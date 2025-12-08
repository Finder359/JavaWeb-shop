package com.shop.servlet;

import com.shop.dao.OrderDao;
import com.shop.dao.impl.OrderDaoImpl;
import com.shop.entity.Order;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "OrderListServlet", value = "/front/OrderListServlet")
public class OrderListServlet extends HttpServlet {

    private OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 假设你的用户 ID 放在 session 里
        Integer userId = (Integer) req.getSession().getAttribute("userId");

        // 没登录则跳转到 login.jsp
        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // 查询订单列表
        List<Order> orders = orderDao.queryByUserId(userId);

        // 保存到 request
        req.setAttribute("orders", orders);

        // 转发到 JSP
        req.getRequestDispatcher("order_list.jsp").forward(req, resp);
    }
}
