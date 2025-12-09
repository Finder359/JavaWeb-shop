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

@WebServlet(name = "AdminOrderServlet", value = "/admin/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {

    private OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 10;  // 每页显示 10 条

        String p = req.getParameter("page");
        if (p != null) page = Integer.parseInt(p);

        List<Order> orders = orderDao.queryPage(page, pageSize);
        int pageCount = orderDao.getPageCount(pageSize);

        req.setAttribute("orders", orders);
        req.setAttribute("currentPage", page);
        req.setAttribute("pageCount", pageCount);

        req.getRequestDispatcher("/admin/ListOrder.jsp").forward(req, resp);
    }
}
