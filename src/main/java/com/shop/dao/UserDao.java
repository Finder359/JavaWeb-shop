package com.shop.dao;

import java.util.ArrayList;

public interface UserDao {
    boolean login(String username,String password);
    ArrayList queryAll();
}
