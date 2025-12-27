package com.shop.dao;

import com.shop.entity.Product;

import java.util.ArrayList;

public interface ProductDao {
   ArrayList<Product> QueryAll();
   Product queryById(int id);
   ArrayList<Product> QueryByName(String name);
   int add(Product product);
    int delete(int id);
    int update(Product p);

    // Pagination for admin list
    ArrayList<Product> queryPage(int currentPage);
    int getPageCount();

    // Pagination with keyword search (by name/brand/type)
    ArrayList<Product> queryPageByKeywords(int currentPage, String keywords);
    int getPageCountByKeywords(String keywords);
}
