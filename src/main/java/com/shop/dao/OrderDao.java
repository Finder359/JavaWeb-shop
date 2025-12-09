package com.shop.dao;

import com.shop.entity.Order;
import com.shop.entity.OrderDetail;

import java.util.List;

public interface OrderDao {
    // 创建订单，返回生成的订单ID
    int createOrder(Order order);
    // 添加订单详情
    void addOrderDetail(OrderDetail detail);
    List<Order> queryByUserId(int userId);
    Order queryById(int id);
    int getRecordCount();
    List<Order> queryPage(int page, int pageSize);
    int getPageCount(int pageSize);

}
