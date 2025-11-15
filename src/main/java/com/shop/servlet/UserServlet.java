package com.shop.servlet;

import com.shop.dao.UserDao;
import com.shop.dao.impl.UserDaoImpl;
import com.shop.entity.User;

import java.io.*;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserServlet", value = "/admin/UserServlet")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String op=request.getParameter("op");

        if("login".equals(op)) {
            try {
                doLogin(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //查询所有用户
        if ("queryAll".equals(op)){
            try {
                doQueryAll(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }


    }

    public void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //登录
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao userDao = new UserDaoImpl();
        boolean success = userDao.login(username, password);

        if (success) {

            session.setAttribute("username", username);  // 存用户名
            session.setAttribute("loginTime", new java.util.Date().toString()); // 记录本次登录时间
//        session.setMaxInactiveInterval(120); // 设置 session 超时时间为 120 秒（2分钟）

//            response.sendRedirect("index.html");
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        } else {
            response.sendRedirect("fail.html");
//        out.println("<script>alert('用户名或密码错误');location.href='login.jsp';</script>");
        }
    }

    public void  doQueryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserDao userDao = new UserDaoImpl();
        ArrayList<User> users = userDao.queryAll();

        request.setAttribute("users", users);

        try {
            request.getRequestDispatcher("ListUser.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}