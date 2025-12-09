package com.shop.entity;


import java.sql.Timestamp;
import java.util.List;

public class Order {
    private int id;
    private int userId;
    private String status;
    private Timestamp ordertime;
    private List<OrderDetail> detailList;
    private String userName;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getOrdertime() {
        return ordertime;
    }
    public void setOrdertime(Timestamp ordertime) {
        this.ordertime = ordertime;
    }

    public List<OrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetail> detailList) {
        this.detailList = detailList;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}

