package com.shop.dao.impl;

import com.shop.dao.FrontUserDao;
import com.shop.entity.FrontUser;
import com.shop.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FrontUserDaoImpl implements FrontUserDao {

    @Override
    public FrontUser login(String username, String password) {
        String sql = "SELECT * FROM user_info WHERE username = ? AND password = ? AND status = 1";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        FrontUser user = null;

        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if (rs.next()) {
                user = new FrontUser();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRealName(rs.getString("realName"));
                user.setSex(rs.getString("sex"));
                user.setAddress(rs.getString("address"));
                user.setQuestion(rs.getString("question"));
                user.setAnswer(rs.getString("answer"));
                user.setTel(rs.getString("tel"));
                user.setFavorate(rs.getString("favorate"));
                user.setScore(rs.getInt("score"));
                user.setRegDate(rs.getDate("regDate"));
                user.setStatus(rs.getInt("status"));
                user.setVip(rs.getInt("vip"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pst, conn);
        }

        return user;
    }

    @Override
    public int register(FrontUser user) {
        String sql = "INSERT INTO user_info (userName, password, realName, sex, tel, address, question, answer, favorate, score, regDate, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pst = null;
        int result = 0;

        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getRealName());
            pst.setString(4, user.getSex());
            pst.setString(5, user.getTel());
            pst.setString(6, user.getAddress());
            pst.setString(7, user.getQuestion());
            pst.setString(8, user.getAnswer());
            pst.setString(9, user.getFavorate());
            pst.setInt(10, user.getScore());
            pst.setDate(11, user.getRegDate());
            pst.setInt(12, user.getStatus());

            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, pst, conn);
        }

        return result;
    }

    @Override
    public FrontUser findByUsername(String username) {
        String sql = "SELECT * FROM user_info WHERE username = ?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        FrontUser user = null;

        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);

            rs = pst.executeQuery();

            if (rs.next()) {
                user = new FrontUser();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRealName(rs.getString("realName"));
                user.setSex(rs.getString("sex"));
                user.setAddress(rs.getString("address"));
                user.setTel(rs.getString("tel"));
                user.setScore(rs.getInt("score"));
                user.setStatus(rs.getInt("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pst, conn);
        }

        return user;
    }

    @Override
    public FrontUser findById(Integer id) {
        String sql = "SELECT * FROM user_info WHERE id = ?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        FrontUser user = null;

        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);

            rs = pst.executeQuery();

            if (rs.next()) {
                user = new FrontUser();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRealName(rs.getString("realName"));
                user.setAddress(rs.getString("address"));
                user.setTel(rs.getString("tel"));
                user.setScore(rs.getInt("score"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pst, conn);
        }

        return user;
    }

    @Override
    public int update(FrontUser user) {
        String sql = "UPDATE user_info SET realName = ?, tel = ?, address = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement pst = null;
        int result = 0;

        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, user.getRealName());
            pst.setString(2, user.getTel());
            pst.setString(3, user.getAddress());
            pst.setInt(4, user.getId());

            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, pst, conn);
        }

        return result;
    }
}