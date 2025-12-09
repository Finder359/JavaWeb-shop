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
<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span> 修改前台用户信息</strong>
    </div>

    <div class="body-content">

        <!-- 注意：此处更新的 Servlet 已经是 FrontUserServlet -->
        <form method="post" class="form-x" action="AdminFrontUserServlet?op=update">

            <!-- ID（不可编辑） -->
            <div class="form-group">
                <div class="label"><label>ID</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           value="<%=user.getId()%>"
                           readonly="readonly" />

                    <!-- 仍需要隐藏 id 传给后端 -->
                    <input type="hidden" name="id" value="<%=user.getId()%>">
                </div>
            </div>

            <!-- 用户名 -->
            <div class="form-group">
                <div class="label"><label>用户名</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="userName"
                           value="<%=user.getUsername()%>"
                           data-validate="required:用户名不能为空" />
                </div>
            </div>

            <!-- 真实姓名 -->
            <div class="form-group">
                <div class="label"><label>真实姓名</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="realName"
                           value="<%=user.getRealName()%>" />
                </div>
            </div>

            <!-- 性别 -->
            <div class="form-group">
                <div class="label"><label>性别</label></div>
                <div class="field">
                    <input type="radio" name="sex" value="男" <%="男".equals(user.getSex())?"checked":""%>> 男
                    &nbsp;&nbsp;
                    <input type="radio" name="sex" value="女" <%="女".equals(user.getSex())?"checked":""%>> 女
                </div>
            </div>

            <!-- 地址 -->
            <div class="form-group">
                <div class="label"><label>地址</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="address"
                           value="<%=user.getAddress()%>" />
                </div>
            </div>

            <!-- 电话 -->
            <div class="form-group">
                <div class="label"><label>电话</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="tel"
                           value="<%=user.getTel()%>" />
                </div>
            </div>

            <!-- 喜好 -->
            <div class="form-group">
                <div class="label"><label>喜好</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           name="favorate"
                           value="<%=user.getFavorate()%>" />
                </div>
            </div>

            <!-- 注册时间（只读） -->
            <div class="form-group">
                <div class="label"><label>注册时间</label></div>
                <div class="field">
                    <input type="text" class="input w50"
                           value="<%=user.getRegDate()%>"
                           readonly="readonly" />
                </div>
            </div>

            <!-- VIP -->
            <div class="form-group">
                <div class="label"><label>VIP 状态</label></div>
                <div class="field">
                    <input type="checkbox" name="vip" value="1"
                        <%=user.getVip() == 1 ? "checked" : ""%> >
                    是否为 VIP 用户
                </div>
            </div>

            <!-- 提交按钮 -->
            <div class="form-group">
                <div class="label"></div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">
                        保存修改
                    </button>
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
