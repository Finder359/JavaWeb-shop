<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.shop.entity.Product" %>
<%@ page import="com.shop.dao.impl.ProductDaoImpl" %>
<%@ page import="com.shop.dao.ProductDao" %>

<%
    // 1️⃣ 创建 SmartUpload
    SmartUpload su = new SmartUpload();
    su.initialize(pageContext);

    // 2️⃣ 限制图片类型
    su.setAllowedFilesList("jpg,jpeg,png");

    // 3️⃣ 接收上传
    su.upload();

    // 4️⃣ 处理图片文件
    Files files = su.getFiles();
    File file = files.getFile("pic");   // 对应 input name="pic"

    String picPath = ""; // 最终保存到数据库的路径

    if (!file.isMissing()) {
        // 生成不重复文件名
        String ext = file.getFileExt(); // jpg
        String newName = UUID.randomUUID().toString() + "." + ext;

        // 服务器真实路径
        String savePath = application.getRealPath("/upload");

        // 保存文件
        file.saveAs(savePath + "/" + newName, SmartUpload.SAVE_PHYSICAL);

        // 存数据库用的路径（⚠不是物理路径）
        picPath = "/upload/" + newName;
    }

    // 5️⃣ 读取普通表单字段（⚠ 不能用 request.getParameter）
    Request req = su.getRequest();

    String code   = req.getParameter("code");
    String name   = req.getParameter("name");
    String type   = req.getParameter("type");
    String brand  = req.getParameter("brand");
    int num       = Integer.parseInt(req.getParameter("num"));
    double price  = Double.parseDouble(req.getParameter("price"));
    double sale   = Double.parseDouble(req.getParameter("sale"));
    String intro  = req.getParameter("intro");
    int status    = Integer.parseInt(req.getParameter("status"));

    // 6️⃣ 封装 Product（示意）
    Product p = new Product();
    p.setpCode(code);
    p.setpName(name);
    p.setpType(type);
    p.setpBrand(brand);
    p.setPic(picPath);   // 👈 图片路径
    p.setNum(num);
    p.setPrice(price);
    p.setSale(sale);
    p.setIntro(intro);
    p.setStatus(status);

    // 7️⃣ 调 DAO 入库
    ProductDao dao = new ProductDaoImpl();
    dao.add(p);

    // 8️⃣ 跳转
    response.sendRedirect("product_list.jsp");
%>
