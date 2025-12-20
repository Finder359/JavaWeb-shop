package com.shop.servlet;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.entity.Product;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminProductServlet", value = "/admin/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String op=request.getParameter("op");
        if ("queryAll".equals(op)){
            doQueryAll(request, response);
        }
        if ("add".equals(op)){
            addProduct(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    doGet(request, response);
    }

    protected void doQueryAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductDao productDao = new ProductDaoImpl();
        ArrayList<Product> products=productDao.QueryAll();
        //查询结果显示到jsp页面
        request.setAttribute("products",products);
        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}