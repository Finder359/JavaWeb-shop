package com.shop.test;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.entity.Product;

import java.util.ArrayList;

public class TestProduct {
    public static void main(String[] args){
testQueryAll();
    }

    public static void testQueryAll(){
        ProductDao dao = new ProductDaoImpl();

        ArrayList<Product> list = dao.QueryAll();

        // 简单遍历输出测试
        for (Product p : list) {
            System.out.println(
                    "id=" + p.getId() +
                            ", pCode=" + p.getpCode() +
                            ", pName=" + p.getpName() +
                            ", pType=" + p.getpType() +
                            ", pBrand=" + p.getpBrand() +
                            ", pic=" + p.getPic() +
                            ", num=" + p.getNum() +
                            ", price=" + p.getPrice() +
                            ", sale=" + p.getSale() +
                            ", intro=" + p.getIntro() +
                            ", status=" + p.getStatus()
            );
        }

        System.out.println("查询结束，共 " + list.size() + " 条记录。");
    }

}
