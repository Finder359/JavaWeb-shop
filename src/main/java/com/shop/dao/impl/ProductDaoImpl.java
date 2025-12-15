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

        ArrayList<Product> products = new ArrayList<>();
        conn = DBUtil.getConn();

        String sql = "SELECT * FROM product_info"; // ← 按你的表名改
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            // 遍历结果集
            while (rs.next()) {
                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setpCode(rs.getNString("code"));
                p.setpName(rs.getNString("name"));
                p.setpType(rs.getNString("type"));
                p.setpBrand(rs.getNString("brand"));
                p.setPic(rs.getNString("pic"));
                p.setNum(rs.getInt("num"));
                p.setPrice(rs.getDouble("price"));
                p.setSale(rs.getDouble("sale"));
                p.setIntro(rs.getNString("intro"));
                p.setStatus(rs.getInt("status"));

                products.add(p);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return products;
    }

    @Override
    public Product queryById(int id) {
        Product p = null;
        conn = DBUtil.getConn();

        String sql = "SELECT * FROM product_info WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product();

                p.setId(rs.getInt("id"));
                p.setpCode(rs.getNString("code"));
                p.setpName(rs.getNString("name"));
                p.setpType(rs.getNString("type"));
                p.setpBrand(rs.getNString("brand"));
                p.setPic(rs.getNString("pic"));
                p.setNum(rs.getInt("num"));
                p.setPrice(rs.getDouble("price"));
                p.setSale(rs.getDouble("sale"));
                p.setIntro(rs.getNString("intro"));
                p.setStatus(rs.getInt("status"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return p;
    }


    @Override
    public ArrayList<Product> QueryByName(String name) {
        return null;
    }

    @Override
    public int add(Product product) {
        int n=0;
        conn = DBUtil.getConn();

        try {
            String sql="insert into product_info(code,name,type,brand,pic,num,price,sale,intro,status) values(?,?,?,?,?,?,?,?,?,?)";
            ps=conn.prepareStatement(sql);
            ps.setString(1,product.getpCode());
            ps.setString(2,product.getpName());
            ps.setString(3,product.getpType());
            ps.setString(4,product.getpBrand());
            ps.setString(5,product.getPic());
            ps.setInt(6,product.getNum());
            ps.setDouble(7,product.getPrice());
            ps.setDouble(8,product.getSale());
            ps.setString(9,product.getIntro());
            ps.setInt(10,product.getStatus());

            n=ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            DBUtil.close(ps,conn);
        }

        return n;

    }

}
