<%@ page import="com.shop.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/15
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加商品</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="AdminProductServlet?op=update" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%=product.getId()%>">
            <input type="hidden" name="oldPic" value="<%=product.getPic()%>">

            <div class="form-group">
                <div class="label">
                    <label>编码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getpCode()%>" name="code" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getpName()%>" name="name" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>商品类型：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getpType()%>" name="type" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>品牌：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getpBrand()%>" name="brand" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>图片：</label>
                </div>
                <div class="field">
                    <input type="file" id="url1" name="pic" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
                    <div class="tipss">图片尺寸：500*500</div>
                </div>
            </div>
            <img src="<%=product.getPic()%>" width="80">
            <p>不选择图片则保留原图</p>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div style="color:red; margin-bottom:10px;">
                <%= error %>
            </div>
            <%
                }
            %>

            <div class="form-group">
                <div class="label">
                    <label>数量：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getNum()%>" name="num" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>单价：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getPrice()%>" name="price" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>促销折扣：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getSale()%>" name="sale" data-validate="required:请输入编码" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>简介：</label>
                </div>
                <div class="field">
                    <textarea class="input"  name="intro" style=" height:90px;"><%=product.getIntro()%></textarea>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>商品状态：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="status" value="<%=product.getStatus()%>" data-validate="member:只能为数字"  />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body></html>
