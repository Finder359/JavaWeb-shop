package com.shop.servlet;

import com.shop.dao.FrontUserDao;
import com.shop.dao.impl.FrontUserDaoImpl;
import com.shop.entity.FrontUser;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminFrontUserServlet", value = "/admin/AdminFrontUserServlet")
public class AdminFrontUserServlet extends HttpServlet {

    private FrontUserDao frontUserDao = new FrontUserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String op = req.getParameter("op");
        if (op == null) op = "list";

        switch (op) {

            case "add":         // 跳转到新增页面
                req.getRequestDispatcher("/admin/FrontUserAdd.jsp").forward(req, resp);
                break;

            case "save":        // 新增用户提交
                save(req, resp);
                break;

            case "edit":        // 跳转到修改页面
                edit(req, resp);
                break;

            case "update":      // 修改用户提交
                update(req, resp);
                break;

            case "delete":      // 删除
                delete(req, resp);
                break;

            default:            // 默认显示列表
                list(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }


    // ------------------------- 显示所有用户 --------------------------
    private void list(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ArrayList<FrontUser> users = frontUserDao.queryAll();

        req.setAttribute("frontUsers", users);
        req.getRequestDispatcher("/admin/ListFrontUser.jsp").forward(req, resp);
    }


    // ------------------------- 保存新用户 --------------------------
    private void save(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        FrontUser u = new FrontUser();

        u.setUsername(req.getParameter("userName"));
        u.setPassword(req.getParameter("password"));
        u.setRealName(req.getParameter("realName"));
        u.setSex(req.getParameter("sex"));
        u.setTel(req.getParameter("tel"));
        u.setAddress(req.getParameter("address"));

//        frontUserDao.insert(u);
        //暂未实现

        resp.sendRedirect("FrontUserServlet"); // 回列表页
    }


    // ------------------------- 显示编辑页面 --------------------------
    private void edit(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        FrontUser u = frontUserDao.findById(id);

        req.setAttribute("user", u);
        req.getRequestDispatcher("/admin/FrontUserEdit.jsp").forward(req, resp);
    }


    // ------------------------- 修改用户提交 --------------------------
    private void update(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        FrontUser u = new FrontUser();

        u.setId(Integer.parseInt(req.getParameter("id")));
        u.setUsername(req.getParameter("userName"));
        u.setPassword(req.getParameter("password"));
        u.setRealName(req.getParameter("realName"));
        u.setSex(req.getParameter("sex"));
        u.setTel(req.getParameter("tel"));
        u.setAddress(req.getParameter("address"));

        frontUserDao.update(u);

        resp.sendRedirect("FrontUserServlet");
    }


    // ------------------------- 删除用户 --------------------------
    private void delete(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
//        frontUserDao.delete(id);
//暂未实现
        resp.sendRedirect("FrontUserServlet");
    }
}