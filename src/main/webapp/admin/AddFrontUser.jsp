<%@ page import="com.shop.entity.FrontUser" %><%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/11/21
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    FrontUser user = (FrontUser) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>修改用户</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-plus-square-o"></span> 添加前台用户</strong>
    </div>

    <div class="body-content">

        <!-- 注意：新增用户提交到 FrontUserServlet?op=save -->
        <form method="post" class="form-x" action="AdminFrontUserServlet?op=save">

            <!-- 用户名 -->
            <div class="form-group">
                <div class="label">
                    <label>用户名</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="userName"
                           data-validate="required:用户名不能为空" />
                </div>
            </div>

            <!-- 密码 -->
            <div class="form-group">
                <div class="label">
                    <label>密码</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50"
                           name="password"
                           data-validate="required:密码不能为空" />
                </div>
            </div>

            <!-- 确认密码 -->
            <div class="form-group">
                <div class="label">
                    <label>确认密码</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50"
                           name="repassword"
                           data-validate="required:请再次输入密码,repeat#password:两次输入的密码不一致" />
                </div>
            </div>

            <!-- 真实姓名 -->
            <div class="form-group">
                <div class="label">
                    <label>真实姓名</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="realName"
                           placeholder="可不填" />
                </div>
            </div>

            <!-- 性别 -->
            <div class="form-group">
                <div class="label"><label>性别</label></div>
                <div class="field">
                    <input type="radio" name="sex" value="男" checked> 男
                    &nbsp;&nbsp;
                    <input type="radio" name="sex" value="女"> 女
                </div>
            </div>

            <!-- 电话 -->
            <div class="form-group">
                <div class="label"><label>电话</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="tel"
                           placeholder="联系电话（可选）" />
                </div>
            </div>

            <!-- 地址 -->
            <div class="form-group">
                <div class="label"><label>地址</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="address"
                           placeholder="收货地址（可选）" />
                </div>
            </div>

            <!-- 喜好 -->
            <div class="form-group">
                <div class="label"><label>喜好</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="favorate"
                           placeholder="可不填" />
                </div>
            </div>

            <!-- VIP -->
            <div class="form-group">
                <div class="label"><label>VIP 状态</label></div>
                <div class="field">
                    <input type="checkbox" name="vip" value="1"> 设为 VIP 用户
                </div>
            </div>

            <!-- 提交按钮 -->
            <div class="form-group">
                <div class="label"></div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">
                        添加用户
                    </button>
                </div>
            </div>

        </form>

    </div>
</div>


</body>
</html>
