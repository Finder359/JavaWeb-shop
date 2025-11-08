package com.shop.test;

import com.shop.dao.UserDao;
import com.shop.dao.impl.UserDaoImpl;



public class TestUserDao {
    public static void main(String[] args) {
    testLogin();
    }

    public static void testLogin(){
        UserDao userDao = new UserDaoImpl();
        boolean flag = userDao.login("admin","123456");
        System.out.println(flag);
    }
}
