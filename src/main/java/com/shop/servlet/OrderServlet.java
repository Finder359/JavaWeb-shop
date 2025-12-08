package com.shop.servlet;

import com.shop.dao.OrderDao;
import com.shop.dao.impl.OrderDaoImpl;
import com.shop.entity.CartItem;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.entity.Product;

import java.io.*;
import java.sql.Timestamp;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "OrderServlet", value = "/front/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
doGet(request, response);
    }

    private OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null || cart.size() == 0) {
            resp.sendRedirect("checkout.jsp?err=empty");
            return;
        }

        // 假设用户ID从 session 获取（你先写死也行）
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) userId = 1;

        // ① 创建订单对象
        Order order = new Order();
        order.setUserId(userId);
        order.setStatus("已提交");
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        order.setOrdertime(ts);


        // ② 写入订单主表，得到订单 ID
        int orderId = orderDao.createOrder(order);

        // ③ 写入订单详情表
        for (CartItem item : cart.values()) {

            Product p = item.getProduct();

            OrderDetail detail = new OrderDetail();
            detail.setOrderId(orderId);
            detail.setProductId(p.getId());
            detail.setNum(item.getCount());

            orderDao.addOrderDetail(detail);
        }

        // ④ 清空购物车
        session.removeAttribute("cart");

        // ⑤ 跳转订单成功页面
        resp.sendRedirect("order_success.jsp?id=" + orderId);
    }
}