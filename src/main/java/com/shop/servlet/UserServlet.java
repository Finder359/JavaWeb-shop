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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

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

        if ("add".equals(op)){
                doAdd(request,response);
        }

        if ("delete".equals(op)){
            doDelete(request,response);
        }

        if("batchDelete".equals(op)){
            doBatchDelete(request, response);
        }

        if ("showEdit".equals(op)) {
            doShowEdit(request, response);
        }

        if ("update".equals(op)) {
            doUpdate(request, response);
        }



    }

    public void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 验证码检查
        String inputCode = request.getParameter("code");
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("captcha");

        if (inputCode == null || sessionCode == null ||
                !inputCode.trim().equalsIgnoreCase(sessionCode)) {

            request.setAttribute("error", "验证码错误");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        // 2. 用户名密码校验
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDaoImpl();
        boolean success = userDao.login(username, password);
        User user = userDao.getUserByName(username);
        if (success) {

            // 登录成功，保存 session 信息
            session.setAttribute("username", username);
            session.setAttribute("loginTime", new java.util.Date());
            session.setAttribute("userId", user.getId());

            // 使用 redirect 避免重复提交
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");

        } else {
            // 登录失败
            response.sendRedirect(request.getContextPath() + "/admin/fail.html");
        }
    }

    public void doQueryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDao userDao = new UserDaoImpl();

        // ① 获取当前页码
        String page = request.getParameter("page");
        int currentPage = (page == null ? 1 : Integer.parseInt(page));

        // ② 查询分页数据
        ArrayList<User> users = userDao.queryPage(currentPage);

        // ③ 查询总页数
        int pageCount = userDao.getPageCount();

        // ④ 回传 JSP
        request.setAttribute("users", users);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageCount", pageCount);

        request.getRequestDispatcher("ListUser.jsp").forward(request, response);
    }


    public  void doAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);

        UserDao userDao = new UserDaoImpl();
        int n=userDao.add(user);
        if(n>0){
            response.sendRedirect("success.jsp");
        }else {
            response.sendRedirect("error.jsp");
        }
    }

    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=0;

        String tid=request.getParameter("id");
        if(tid!=null&&!tid.isEmpty()){
            id=Integer.parseInt(tid);
        }

        UserDao userDao = new UserDaoImpl();
        int n=userDao.delete(id);
        if(n>0){
            response.sendRedirect("success.jsp");
        }else {
            response.sendRedirect("error.jsp");
        }
    }

    public void doBatchDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String[] ids = request.getParameterValues("id[]");

        if(ids == null || ids.length == 0){
            response.sendRedirect("error.jsp");
            return;
        }

        UserDao userDao = new UserDaoImpl();
        int successCount = 0;

        for (String idStr : ids){
            if(idStr == null || idStr.trim().equals("")) continue;  // 跳过空值
            int id = Integer.parseInt(idStr);
            int n = userDao.delete(id);
            if(n > 0){
                successCount++;
            }
        }

        if(successCount == ids.length){
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    public void doShowEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tid = request.getParameter("id");
        int id = Integer.parseInt(tid);

        UserDao userDao = new UserDaoImpl();
        User user = userDao.findById(id);

        request.setAttribute("user", user);
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
    }

    public void doUpdate(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        // 获取当前登录用户信息
        HttpSession session = request.getSession();
        Integer currentUserId = (Integer) session.getAttribute("userId");

        // 获取要修改的用户ID
        String idStr = request.getParameter("id");
        Integer editUserId = Integer.parseInt(idStr);

        // 权限检查
        boolean isAdmin = (currentUserId != null && currentUserId == 1);
        boolean isSelf = (currentUserId != null && currentUserId.equals(editUserId));

        if (!isAdmin && !isSelf) {
            // 无权限
            request.setAttribute("error", "您没有权限修改其他用户的信息");
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);

        UserDao userDao = new UserDaoImpl();
        int n = userDao.update(user);

        if(n > 0){
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }





}