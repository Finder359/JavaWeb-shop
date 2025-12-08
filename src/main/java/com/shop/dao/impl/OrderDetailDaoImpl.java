package com.shop.dao.impl;

import com.shop.dao.OrderDetailDao;
import com.shop.entity.OrderDetail;
import com.shop.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDaoImpl implements OrderDetailDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List<OrderDetail> queryByOrderId(int oid) {

        List<OrderDetail> list = new ArrayList<>();
        conn = DBUtil.getConn();

        String sql = "SELECT * FROM order_detail WHERE o_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail d = new OrderDetail();
                d.setOrderId(rs.getInt("o_id"));
                d.setProductId(rs.getInt("p_id"));
                d.setNum(rs.getInt("num"));

                // product 暂时留空，由 OrderDaoImpl 填充
                list.add(d);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return list;
    }

    @Override
    public int insert(OrderDetail detail) {
        int n = 0;
        conn = DBUtil.getConn();

        String sql = "INSERT INTO order_detail(o_id, p_id, num) VALUES(?,?,?)";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, detail.getOrderId());
            ps.setInt(2, detail.getProductId());
            ps.setInt(3, detail.getNum());

            n = ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(ps, conn);
        }

        return n;
    }

    @Override
    public int deleteByOrderId(int orderId) {
        int n = 0;
        conn = DBUtil.getConn();

        String sql = "DELETE FROM order_detail WHERE o_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

            n = ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(ps, conn);
        }

        return n;
    }
}

