package com.shop.dao;

import com.shop.entity.Product;

import java.util.ArrayList;

public interface ProductDao {
   ArrayList<Product> QueryAll();
   Product queryById(int id);
   ArrayList<Product> QueryByName(String name);
   int add(Product product);
}
