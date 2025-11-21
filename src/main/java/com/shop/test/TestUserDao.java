package com.shop.test;

import com.shop.dao.UserDao;
import com.shop.dao.impl.UserDaoImpl;
import com.shop.entity.User;


public class TestUserDao {
    public static void main(String[] args) {
//    testLogin();
        testAdd();
    }

    public static void testLogin(){
        UserDao userDao = new UserDaoImpl();
        boolean flag = userDao.login("admin","123456");
        System.out.println(flag);
    }

    public static void testAdd(){
        UserDao userDao = new UserDaoImpl();
        User user=new User();
        user.setUsername("abc");
        user.setPassword("123456");
        int n= userDao.add(user);
        System.out.println(n);
    }
}
