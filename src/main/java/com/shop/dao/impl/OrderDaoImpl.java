package com.shop.dao.impl;

import com.shop.dao.OrderDao;
import com.shop.dao.OrderDetailDao;
import com.shop.dao.ProductDao;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.entity.Product;
import com.shop.util.DBUtil;

import java.security.Timestamp;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    Connection conn = DBUtil.getConn();
    PreparedStatement ps = null;
    ResultSet rs = null;
    private OrderDetailDao orderDetailDao = new OrderDetailDaoImpl();
    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public int createOrder(Order order) {


        String sql = "INSERT INTO order_info(userId, status, ordertime) VALUES (?, ?, ?)";

        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setString(2, order.getStatus());
//            ps.setTimestamp(3, new Timestamp(order.getOrdertime().getTime()));
            ps.setTimestamp(3, order.getOrdertime());

            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);  // 返回新订单ID
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return -1;
    }


    @Override
    public void addOrderDetail(OrderDetail detail) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;

        String sql = "INSERT INTO order_detail(o_id, p_id, num) VALUES (?, ?, ?)";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, detail.getOrderId());
            ps.setInt(2, detail.getProductId());
            ps.setInt(3, detail.getNum());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);

        } finally {
            DBUtil.close(ps, conn);
        }
    }

    @Override
    public List<Order> queryByUserId(int userId) {

        List<Order> list = new ArrayList<>();
        conn = DBUtil.getConn();

        String sql = "SELECT o.*, u.userName" +
                "FROM order_info o" +
                "LEFT JOIN user_info u ON o.userId = u.id" +
                "WHERE userId = ?" +
                "ORDER BY ordertime DESC";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("userName"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getTimestamp("ordertime"));

                // 填充详情
                List<OrderDetail> detailList = orderDetailDao.queryByOrderId(o.getId());
                for (OrderDetail d : detailList) {
                    d.setProduct(productDao.queryById(d.getProductId()));
                }
                o.setDetailList(detailList);

                list.add(o);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return list;
    }


    @Override
    public Order queryById(int id) {

        Order order = null;
        conn = DBUtil.getConn();

        String sql = "SELECT o.*, u.userName " +
                "FROM order_info o LEFT JOIN user_info u ON o.userId = u.id " +
                "WHERE o.id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("userId"));
                order.setUserName(rs.getString("userName"));
                order.setStatus(rs.getString("status"));
                order.setOrdertime(rs.getTimestamp("ordertime"));

                // 1. 查询订单详情
                List<OrderDetail> detailList = orderDetailDao.queryByOrderId(id);

                // 2. 给每条 detail 补上 product 对象
                for (OrderDetail d : detailList) {
                    Product p = productDao.queryById(d.getProductId());
                    d.setProduct(p);
                }

                // 3. 放进订单对象
                order.setDetailList(detailList);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return order;
    }

    @Override
    public int getRecordCount() {
        int count = 0;
        conn = DBUtil.getConn();

        String sql = "SELECT COUNT(*) FROM order_info";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return count;
    }


    @Override
    public List<Order> queryPage(int page, int pageSize) {

        List<Order> list = new ArrayList<>();
        conn = DBUtil.getConn();

        int offset = (page - 1) * pageSize;

        String sql =
                "SELECT o.*, u.userName " +
                        "FROM order_info o " +
                        "LEFT JOIN user_info u ON o.userId = u.id " +
                        "ORDER BY o.ordertime DESC " +
                        "LIMIT ?, ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            rs = ps.executeQuery();

            while (rs.next()) {

                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("userName"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getTimestamp("ordertime"));

                // ① 查订单详情
                List<OrderDetail> detailList = orderDetailDao.queryByOrderId(o.getId());

                // ② 为每条详情补 Product 对象（你已经写了 productDao）
                for (OrderDetail d : detailList) {
                    Product p = productDao.queryById(d.getProductId());
                    d.setProduct(p);
                }

                o.setDetailList(detailList);
                list.add(o);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return list;
    }


    @Override
    public int getPageCount(int pageSize) {
        int count = getRecordCount();
        return (count + pageSize - 1) / pageSize;  // 向上取整
    }


}
