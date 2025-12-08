package com.shop.entity;


public class OrderDetail {
    private int orderId;
    private int productId;
    private int num;
    private Product product;

    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
}

