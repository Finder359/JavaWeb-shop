package com.shop.test;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.entity.Product;

import java.util.ArrayList;

public class TestProduct {
    public static void main(String[] args){
//testQueryAll();
        testAdd();
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

    public  static void testAdd(){
        ProductDao product = new ProductDaoImpl();
        Product p = new Product();
    p.setpCode("A20001");
    p.setpName("雷朋 Ray-Ban 飞行员经典太阳镜 RB3025");
    p.setpType("太阳镜");
    p.setpBrand("Ray-Ban");
    p.setPic("/front/images/pic1.jpg");

    p.setNum(150);      // 原示例写 00000000150，本质就是 150
    p.setPrice(1299);   // 价格
    p.setSale(100);     // 减免金额 or 优惠金额（你项目中用的就是这个）

    p.setIntro("<p>经典金框飞行员设计，百搭必备。</p>");
    p.setStatus(1);     // 上架状态（你 INSERT 里写的 1）

    // 插入数据库
    int result = product.add(p);

    if (result > 0) {
        System.out.println("插入成功！");
    } else {
        System.out.println("插入失败！");
    }
}

}
