package com.shop.servlet;

import com.jspsmart.upload.*;
import com.jspsmart.upload.File;
import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.entity.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminProductServlet", value = "/admin/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String op=request.getParameter("op");
        if ("queryAll".equals(op)){
            doQueryAll(request, response);
        }
        if ("add".equals(op)) {
            addProduct(request, response);
        }
        if ("delete".equals(op)) {
            deleteProduct(request, response);
        }
        if ("edit".equals(op)) {
            editProduct(request, response);
        }
        if ("update".equals(op)) {
            try {
                updateProduct(request, response);
            } catch (SmartUploadException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    doGet(request, response);
    }

    protected void doQueryAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductDao productDao = new ProductDaoImpl();
        ArrayList<Product> products=productDao.QueryAll();
        //查询结果显示到jsp页面
        request.setAttribute("products",products);
        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1️⃣ 创建 SmartUpload
            SmartUpload su = new SmartUpload();

            // 2️⃣ 初始化（Servlet 里用这个）
            su.initialize(
                    getServletConfig(),
                    request,
                    response
            );

            // 3️⃣ 限制上传文件类型
            su.setAllowedFilesList("jpg,jpeg,png");
            //编码
            su.setCharset("UTF-8");
            //  最大单个文件大小（10MB）
            su.setMaxFileSize(10 * 1024 * 1024); // 10MB

            // ★ 最大总上传大小（可选，建议加）
            su.setTotalMaxFileSize(10 * 1024 * 1024);
            // 4️⃣ 接收上传，带回错误msg
            try {
                su.upload();
            }
            catch (SecurityException e) {
                // 文件类型 / 大小不符合
                request.setAttribute("error", "图片格式错误，只允许 jpg / jpeg / png，且不超过 10MB");
                request.getRequestDispatcher("/admin/addProduct.jsp")
                        .forward(request, response);
                return;
            }
            catch (SmartUploadException e) {
                // 其他上传错误
                request.setAttribute("error", "上传失败，请重新选择图片");
                request.getRequestDispatcher("/admin/addProduct.jsp")
                        .forward(request, response);
                return;
            }



            /* ================= 文件处理 ================= */

            Files files = su.getFiles();

            // 把name=pic取出来
            File file = files.getFile(0);   // 第一个 <input type="file">

            String picPath = "";

            if (!file.isMissing()) {

                // 文件后缀，如 jpg
                String ext = file.getFileExt();

                // 防止重名
                String newName = UUID.randomUUID().toString() + "." + ext;

                // 获取 webapp/upload 的真实磁盘路径
                String saveDir = getServletContext().getRealPath("/upload");

                // 确保目录存在
                java.io.File dir = new java.io.File(saveDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // 保存文件到磁盘
                file.saveAs(saveDir + "/" + newName, SmartUpload.SAVE_PHYSICAL);

                // 存数据库用的路径（重点！）
                picPath = "/upload/" + newName;
            }

            if (file.isMissing()) {
                request.setAttribute("error", "请选择一张商品图片");
                request.getRequestDispatcher("/admin/addProduct.jsp")
                        .forward(request, response);
                return;
            }

            /* ================= 表单字段处理 ================= */

            Request req = su.getRequest();

            Product p = new Product();
            p.setpCode(req.getParameter("code"));
            p.setpName(req.getParameter("name"));
            p.setpType(req.getParameter("type"));
            p.setpBrand(req.getParameter("brand"));
            p.setPic(picPath);
            p.setNum(Integer.parseInt(req.getParameter("num")));
            p.setPrice(Double.parseDouble(req.getParameter("price")));
            p.setSale(Double.parseDouble(req.getParameter("sale")));
            p.setIntro(req.getParameter("intro"));
            p.setStatus(Integer.parseInt(req.getParameter("status")));

            ProductDao dao = new ProductDaoImpl();
            dao.add(p);

//            doQueryAll(request, response);
            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDao dao = new ProductDaoImpl();

        // 1️⃣ 先查商品（为了拿图片路径）
        Product p = dao.queryById(id);

        // 2️⃣ 删除数据库记录
        dao.delete(id);

        // 3️⃣ 删除图片文件（如果有）
        if (p != null && p.getPic() != null && !"".equals(p.getPic())) {

            // p.getPic() 形如：/upload/xxx.jpg
            String realPath = getServletContext().getRealPath(p.getPic());

            java.io.File img = new java.io.File(realPath);
            if (img.exists()) {
                img.delete();
            }
        }

        // 4️⃣ 返回列表
        response.sendRedirect("AdminProductServlet?op=queryAll");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDao dao = new ProductDaoImpl();
        Product product = dao.queryById(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/admin/editProduct.jsp")
                .forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, SmartUploadException {

        SmartUpload su = new SmartUpload();
        su.initialize(getServletConfig(), request, response);
        su.setCharset("UTF-8");
        su.setAllowedFilesList("jpg,jpeg,png");
        su.setMaxFileSize(10 * 1024 * 1024);

        try {
            su.upload();
        } catch (SecurityException e) {
            request.setAttribute("error", "图片格式或大小不符合要求");
            request.getRequestDispatcher("/admin/editProduct.jsp")
                    .forward(request, response);
            return;
        } catch (SmartUploadException e) {
            request.setAttribute("error", "上传失败");
            request.getRequestDispatcher("/admin/editProduct.jsp")
                    .forward(request, response);
            return;
        }

        Request req = su.getRequest();

        int id = Integer.parseInt(req.getParameter("id"));
        String oldPic = req.getParameter("oldPic");

        Files files = su.getFiles();
        File file = files.getFile(0);

        String picPath = oldPic; // 默认保留原图

        // 如果用户选择了新图片
        if (!file.isMissing()) {

            // 删除旧图片
            if (oldPic != null && !"".equals(oldPic)) {
                String oldRealPath = getServletContext().getRealPath(oldPic);
                java.io.File oldFile = new java.io.File(oldRealPath);
                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            // 保存新图片
            String ext = file.getFileExt();
            String newName = UUID.randomUUID().toString() + "." + ext;
            String saveDir = getServletContext().getRealPath("/upload");
            new java.io.File(saveDir).mkdirs();

            file.saveAs(saveDir + "/" + newName, SmartUpload.SAVE_PHYSICAL);
            picPath = "/upload/" + newName;
        }

        // 封装商品
        Product p = new Product();
        p.setId(id);
        p.setpCode(req.getParameter("code"));
        p.setpName(req.getParameter("name"));
        p.setpType(req.getParameter("type"));
        p.setpBrand(req.getParameter("brand"));
        p.setPic(picPath);
        p.setNum(Integer.parseInt(req.getParameter("num")));
        p.setPrice(Double.parseDouble(req.getParameter("price")));
        p.setSale(Double.parseDouble(req.getParameter("sale")));
        p.setIntro(req.getParameter("intro"));
        p.setStatus(Integer.parseInt(req.getParameter("status")));

        ProductDao dao = new ProductDaoImpl();
        int rows = dao.update(p);
        System.out.println("update rows = " + rows);
        if (rows > 0) {
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("error", "修改失败，请检查数据");
            request.getRequestDispatcher("/admin/editProduct.jsp")
                    .forward(request, response);
        }


    }


}