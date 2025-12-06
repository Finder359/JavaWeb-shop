package com.shop.dao.impl;

import com.shop.dao.ProductDao;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDaoImpl implements ProductDao {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;


    @Override
    public ArrayList<Product> QueryAll() {
//        ArrayList<Product> list = new ArrayList<>();
//        conn = DBUtil.getConn();
//
//        String sql="select * from admin_info";
//        try {
//            ps=conn.prepareStatement(sql);
//            rs=ps.executeQuery();
//
//            //遍历结果集
//            while (rs.next()) {
//                User user=new User();
//                user.setId(rs.getInt("id"));
//                user.setUsername(rs.getNString("name"));
//                user.setPassword(rs.getNString("pwd"));
//                users.add(user);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//
//        }finally {
//            DBUtil.close(rs,ps,conn);
//        }
//        return users;
        return  null;
    }
}
