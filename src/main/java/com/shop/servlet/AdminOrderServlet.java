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
        String op = req.getParameter("op");

        if ("delete".equals(op)) {
            delete(req, resp);
            return;
        }

        if ("detail".equals(op)) {
            showDetail(req, resp);
            return;
        }

        if ("updateStatus".equals(op)) {
            updateStatus(req, resp);
            return;
        }


        list(req, resp);  // 默认显示列表

    }

    private void list(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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

    private void delete(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        int n = orderDao.delete(id);

        // 删除成功后刷新列表
        resp.sendRedirect("AdminOrderServlet");
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        Order order = orderDao.queryById(id);

        req.setAttribute("order", order);
        req.getRequestDispatcher("/admin/OrderDetail.jsp").forward(req, resp);
    }

    private void updateStatus(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");

        orderDao.updateStatus(id, status);

        resp.sendRedirect("AdminOrderServlet?op=detail&id=" + id);
    }



}
