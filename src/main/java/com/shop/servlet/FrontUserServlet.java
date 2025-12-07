package com.shop.servlet;

import com.shop.dao.FrontUserDao;
import com.shop.dao.impl.FrontUserDaoImpl;
import com.shop.entity.FrontUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "FrontUserServlet", value = "/front/FrontUserServlet")
public class FrontUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String op = request.getParameter("op");

        if ("login".equals(op)) {
            doLogin(request, response);
        } else if ("register".equals(op)) {
            doRegister(request, response);
        } else if ("logout".equals(op)) {
            doLogout(request, response);
        }
    }

    /**
     * 用户登录
     */
    private void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 获取用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 验证
        FrontUserDao userDao = new FrontUserDaoImpl();
        FrontUser user = userDao.login(username, password);

        if (user != null) {
            // 登录成功，保存到Session
            HttpSession session = request.getSession();
            session.setAttribute("frontUser", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userId", user.getId());
            session.setAttribute("vip", user.getVip());

            // 跳转到首页
            response.sendRedirect(request.getContextPath() + "/front/index.jsp");
        } else {
            // 登录失败
            request.setAttribute("error", "用户名或密码错误");
            request.getRequestDispatcher("/front/login.jsp").forward(request, response);
        }
    }

    /**
     * 用户注册
     */
    private void doRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realName = request.getParameter("realName");
        String sex = request.getParameter("sex");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String favorate = request.getParameter("favorate");

// 创建用户对象
        FrontUser user = new FrontUser();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setSex(sex);
        user.setTel(tel);
        user.setAddress(address);
        user.setQuestion(question);
        user.setAnswer(answer);
        user.setFavorate(favorate);
        user.setScore(0);
        user.setStatus(1);
        user.setRegDate(new java.sql.Date(System.currentTimeMillis()));

        // 保存到数据库
        FrontUserDao userDao = new FrontUserDaoImpl();
        int result = userDao.register(user);

        if (result > 0) {
            // 注册成功，使用 Session 传递成功消息
            HttpSession session = request.getSession();
            session.setAttribute("registerSuccess", "注册成功，请登录");
            response.sendRedirect(request.getContextPath() + "/front/login.jsp");
        } else {
            // 注册失败
            request.setAttribute("error", "注册失败，用户名可能已存在");
            request.getRequestDispatcher("/front/register.jsp").forward(request, response);
        }
    }

    /**
     * 退出登录
     */
    private void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/front/index.jsp");
    }
}