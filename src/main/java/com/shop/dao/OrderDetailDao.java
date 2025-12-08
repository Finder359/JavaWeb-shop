package com.shop.dao;

import com.shop.entity.OrderDetail;

import java.util.List;

public interface OrderDetailDao {
    // 根据订单 ID 查询所有明细
    List<OrderDetail> queryByOrderId(int orderId);

    // 插入订单明细（提交订单时使用）
    int insert(OrderDetail detail);

    // 删除某个订单的全部明细（取消订单）
    int deleteByOrderId(int orderId);

}
