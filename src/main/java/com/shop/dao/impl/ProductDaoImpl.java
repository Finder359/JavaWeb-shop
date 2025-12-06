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

}
