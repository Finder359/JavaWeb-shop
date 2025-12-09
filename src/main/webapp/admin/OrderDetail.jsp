<%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/9
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.entity.Order,com.shop.entity.OrderDetail,com.shop.entity.Product" %>

<%
    Order order = (Order) request.getAttribute("order");
%>

<html>
<head>
    <title>订单详情</title>
    <style>
        .box { width: 900px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; background: #fafafa; }
        .title { font-size: 20px; margin-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        .img { width: 80px; height: 80px; object-fit: cover; }
        .btn { padding: 5px 12px; text-decoration: none; border-radius: 4px; }
        .btn-blue { background: #1E9FFF; color: #fff; }
        .btn-red { background: #FF5722; color: #fff; }
        .btn-green { background: #16b777; color: #fff; }
    </style>
</head>

<body>

<div class="box">

    <div class="title">订单详情（订单号：<%=order.getId()%>）</div>

    <!-- 基本信息 -->
    <p><b>下单用户：</b> <%=order.getUserName()%></p>
    <p><b>下单时间：</b> <%=order.getOrdertime()%></p>
    <p><b>订单状态：</b> <%=order.getStatus()%></p>

    <!-- 收货地址（写死的） -->
    <h3>收货信息</h3>
    <p>张三（收）</p>
    <p>山东省 烟台市 芝罘区 某某街道 123 号</p>
    <p>联系电话：13800000000</p>

    <hr/>

    <!-- 商品信息 -->
    <h3>商品信息</h3>

    <table>
        <tr>
            <th>商品图片</th>
            <th>商品名称</th>
            <th>数量</th>
        </tr>

        <%
            for (OrderDetail d : order.getDetailList()) {
                Product p = d.getProduct();
        %>

        <tr>
            <td><img class="img" src="<%=p.getPic()%>" /></td>
            <td><%=p.getpName()%></td>
            <td><%=d.getNum()%></td>
        </tr>

        <% } %>
    </table>

    <hr/>

    <!-- 状态修改 -->
    <h3>订单状态操作</h3>

    <a class="btn btn-blue"
       href="AdminOrderServlet?op=updateStatus&id=<%=order.getId()%>&status=已发货">
        标记为已发货
    </a>

    <a class="btn btn-green"
       href="AdminOrderServlet?op=updateStatus&id=<%=order.getId()%>&status=已完成">
        标记为已完成
    </a>

    <a class="btn btn-red"
       href="AdminOrderServlet?op=updateStatus&id=<%=order.getId()%>&status=已取消">
        标记为已取消
    </a>

    <br/><br/>

    <!-- 删除订单 -->
    <a class="btn btn-red"
       onclick="return confirm('确定要删除该订单吗？');"
       href="AdminOrderServlet?op=delete&id=<%=order.getId()%>">
        删除订单
    </a>

    <br/><br/>
    <a href="AdminOrderServlet" class="btn">返回订单列表</a>

</div>

</body>
</html>

