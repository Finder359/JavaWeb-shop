package com.shop.servlet;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.entity.CartItem;
import com.shop.entity.Product;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartServlet", value = "/front/CartServlet")
public class CartServlet extends HttpServlet {

    private ProductDao dao = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addToCart(request, response);
        }

        if ("delete".equals(action)) {
            deleteFromCart(request, response);
        }

        if ("sub".equals(action)) {
            subFromCart(request, response);
        }

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // =====  登录校验 =====
        HttpSession session = request.getSession();
        Object frontUser = session.getAttribute("frontUser");
        if (frontUser == null) {
            // 未登录，跳转到登录页
            response.sendRedirect("login.jsp");
            return; // 一定要 return，防止继续执行加购逻辑
        }


        int id = Integer.parseInt(request.getParameter("id"));
        Product p = dao.queryById(id);

        // 购物车结构：Map<Integer, CartItem>
        session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        if (cart.containsKey(id)) {
            cart.get(id).setCount(cart.get(id).getCount() + 1);
        } else {
            cart.put(id, new CartItem(p, 1));
        }

        session.setAttribute("cart", cart);

        // 加入购物车后前往购物车页面
        response.sendRedirect("checkout.jsp");
    }

    // ⭐ 数量 -1 功能（最小数量为 1）
    private void subFromCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            response.sendRedirect("checkout.jsp");
            return;
        }

        if (cart.containsKey(id)) {
            CartItem item = cart.get(id);
            if (item.getCount() > 1) {
                item.setCount(item.getCount() - 1);
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("checkout.jsp");
    }

    // ⭐ 删除商品功能
    private void deleteFromCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(id)) {
            cart.remove(id);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("checkout.jsp");
    }

}
