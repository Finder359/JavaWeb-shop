package com.shop.dao.impl;

import com.shop.dao.UserDao;
import com.shop.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;


    @Override
    public boolean login(String username, String password) {
        boolean flag = false;
        conn= DBUtil.getConn();
        String sql="select * from admin_info where name=? and pwd=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            DBUtil.close(rs,ps,conn);
        }


        return flag;
    }
}
