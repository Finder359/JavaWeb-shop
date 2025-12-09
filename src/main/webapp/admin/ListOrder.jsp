<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shop.entity.User" %>
<%@ page import="com.shop.entity.Order" %>
<%@ page import="com.shop.entity.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/11/15
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
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
<form method="post" action="AdminOrderServlet" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li> <a class="button border-main icon-plus-square-o" href="addUser.jsp"> 添加内容</a> </li>
                <li>搜索：</li>
                <li>首页
                    <select name="s_ishome" class="input" onchange="changesearch()" style="width:60px; line-height:17px; display:inline-block">
                        <option value="">选择</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                    &nbsp;&nbsp;
                    推荐
                    <select name="s_isvouch" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
                        <option value="">选择</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                    &nbsp;&nbsp;
                    置顶
                    <select name="s_istop" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
                        <option value="">选择</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </li>
                <if condition="$iscid eq 1">
                    <li>
                        <select name="cid" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                    </li>
                </if>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
            </ul>
        </div>



        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">订单ID</th>
                <th>下单用户</th>
                <th>商品</th>
                <th>数量</th>
                <th>下单时间</th>
                <th>订单状态</th>
                <th width="220">操作</th>
            </tr>


            <%
                // 1. 从 request 中取出订单列表（后台 Servlet 需要 setAttribute("orders", ...)）
                ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
                if (orders != null) {
                    for (Order order : orders) {

                        // 2. 取出订单的第一个商品，用来在列表里展示
                        List<OrderDetail> dList = order.getDetailList();
                        OrderDetail firstDetail = null;
                        Product p = null;
                        if (dList != null && !dList.isEmpty()) {
                            firstDetail = dList.get(0);
                            p = firstDetail.getProduct();   // 需要在 DAO 里把 product 填进去
                        }
            %>

            <tr>
                <!-- 订单ID + 复选框 -->
                <td style="text-align:left; padding-left:20px;">
                    <input type="checkbox" name="id[]" value="<%=order.getId()%>" />
                    <%=order.getId()%>
                </td>

                <!-- 下单用户名：看你 Order 里是 username 还是 user 对象 -->
                <td>
                    <%-- 如果 Order 里有 private String userName; --%>
                    <%=order.getUserName()%>

                    <%-- 如果是 private User user; 就写：order.getUser().getUsername() --%>
                    <%-- <%=order.getUser().getUsername()%> --%>
                </td>

                <!-- 商品图片 + 名称 -->
                <td>
                    <% if (p != null) { %>
                    <img src="<%=p.getPic()%>" style="width:60px;height:60px;"><br/>
                    <%=p.getpName()%>
                    <% } else { %>
                    -
                    <% } %>
                </td>

                <!-- 数量（取第一件商品的数量） -->
                <td>
                    <%= (firstDetail != null) ? firstDetail.getNum() : 0 %>
                </td>

                <!-- 下单时间 -->
                <td>
                    <%=order.getOrdertime()%>
                </td>

                <!-- 订单状态 -->
                <td>
                    <%=order.getStatus()%>
                </td>

                <!-- 操作按钮 -->
                <td>
                    <div class="button-group">
                        <a class="button border-main" href="AdminOrderServlet?op=detail&id=<%=order.getId()%>">
                            <span class="icon-search"></span> 详情
                        </a>
                        <a class="button border-red" href="AdminOrderServlet?op=delete&id=<%=order.getId()%>"
                           onclick="return del(1,1,1)">
                            <span class="icon-trash-o"></span> 删除
                        </a>
                    </div>
                </td>
            </tr>

            <%
                    } // end for
                } // end if
            %>

            <tr>
                    <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                        全选 </td>
                    <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="submitOp('batchDelete', '您确认要删除选中的内容吗？')"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
                        <select name="ishome" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeishome(this)">
                            <option value="">首页</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="isvouch" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeisvouch(this)">
                            <option value="">推荐</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="istop" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeistop(this)">
                            <option value="">置顶</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;

                        移动到：
                        <select name="movecid" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecate(this)">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                        <select name="copynum" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecopy(this)">
                            <option value="">请选择复制</option>
                            <option value="5">复制5条</option>
                            <option value="10">复制10条</option>
                            <option value="15">复制15条</option>
                            <option value="20">复制20条</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div class="pagelist">

                            <% int current = (int) request.getAttribute("currentPage");
                                int total = (int) request.getAttribute("pageCount");
                            %>

                            <!-- 上一页 -->
                            <%
                                if(current > 1){
                            %>
                            <a href="AdminOrderServlet?page=<%=current-1%>">上一页</a>
                            <% } else { %>
                            <span class="disabled">上一页</span>
                            <% } %>

                            <!-- 中间页码 -->
                            <%
                                for(int i = 1; i <= total; i++){
                                    if(i == current){
                            %>
                            <span class="current"><%=i%></span>
                            <%  } else { %>
                            <a href="AdminOrderServlet?page=<%=i%>"><%=i%></a>
                            <%
                                    }
                                }
                            %>

                            <!-- 下一页 -->
                            <%
                                if(current < total){
                            %>
                            <a href="AdminOrderServlet?page=<%=current+1%>">下一页</a>
                            <% } else { %>
                            <span class="disabled">下一页</span>
                            <% } %>

                        </div>
                    </td>
                </tr>

        </table>
    </div>
</form>
<script type="text/javascript">

    //搜索
    function changesearch(){

    }

    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){
                return true;
        }else {
            return false;
        }
    }

    //全选
    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
            $("#listform").submit();
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    /**
     * 通用批量操作函数
     * @param op  后端使用的 op 参数，如 batchDelete / sort / top
     * @param confirmMsg   可选，只有删除才会传这个参数
     */
    function submitOp(op, confirmMsg){

        // 是否选择了复选框
        if($("input[name='id[]']:checked").length == 0){
            alert("请选择要操作的内容！");
            return false;
        }

        //  如果需要确认（比如删除），才弹窗
        if(confirmMsg){
            if(!confirm(confirmMsg)){
                return false;
            }
        }

        // 提交到指定的操作
        $("#listform").attr("action", "/admin/UserServlet?op=" + op);
        $("#listform").submit();
    }



    //批量排序
    function sorts(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){


            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var i = 0;
            $("input[name='id[]']").each(function(){
                if (this.checked==true) {
                    i++;
                }
            });
            if(i>1){
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected","selected");
            }else{

                $("#listform").submit();
            }
        }
        else{
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected","selected");
            return false;
        }
    }

</script>
</body>
</html>
