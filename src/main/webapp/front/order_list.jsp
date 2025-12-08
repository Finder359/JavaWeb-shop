<%@ page import="com.shop.entity.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.shop.entity.Product" %>
<%@ page import="com.shop.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.entity.OrderDetail" %><%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/7
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE HTML>
<html>
<head>
    <title>Checkout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery1.min.js"></script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <%--    <script type="text/javascript" src="js/megamenu.js"></script>--%>
    <%--    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>--%>
    <!-- dropdown -->
    <script src="js/jquery.easydropdown.js"></script>

    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/ziy.css">
    <%--    <script type="text/javascript" src="js/jquery1.42.min.js"></script>--%>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.source.js"></script>
    <script type="text/javascript" src="js/select.js"></script>
    <style>

        .jinp_tuij_lb li {
            margin-right: 3%;
            width: 31%;
        }

        .jinp_tuij_lb li:nth-child(3n+3) {
            margin-right: 0;
        }

        .jinp_tuij_lb li>a:first-of-type,
        .jinp_tuij_lb li>a:first-of-type>img {
            width: 100%;
        }


        .myGomeWeb>div {
            float: none;
        }

        .myGomeWeb>div:first-of-type {
            margin-right: 30px;
        }
    </style>
</head>
<body>
<div class="header-top">
    <div class="wrap">
        <div class="header-top-left">
            <div class="box">
                <select tabindex="4" class="dropdown">
                    <option value="" class="label" value="">Language :</option>
                    <option value="1">English</option>
                    <option value="2">French</option>
                    <option value="3">German</option>
                </select>
            </div>
            <div class="box1">
                <select tabindex="4" class="dropdown">
                    <option value="" class="label" value="">Currency :</option>
                    <option value="1">$ Dollar</option>
                    <option value="2">€ Euro</option>
                </select>
            </div>
            <div class="clear"></div>
        </div>
        <div class="cssmenu">
            <ul>
                <li class="active"><a href="login.html">Account</a></li> |
                <li><a href="checkout.html">Wishlist</a></li> |
                <li><a href="checkout.html">Checkout</a></li> |
                <li><a href="login.html">Log In</a></li> |
                <li><a href="register.html">Sign Up</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <div class="header-bottom-left">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
            </div>
            <div class="menu">
                <ul class="megamenu skyblue">
                    <li class="active grid"><a href="index.jsp">Home</a></li>
                    <li><a class="color4" href="#">women</a>
                        <div class="megapanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Contact Lenses</h4>
                                        <ul>
                                            <li><a href="womens.html">Daily-wear soft lenses</a></li>
                                            <li><a href="womens.html">Extended-wear</a></li>
                                            <li><a href="womens.html">Lorem ipsum </a></li>
                                            <li><a href="womens.html">Planned replacement</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Sun Glasses</h4>
                                        <ul>
                                            <li><a href="womens.html">Heart-Shaped</a></li>
                                            <li><a href="womens.html">Square-Shaped</a></li>
                                            <li><a href="womens.html">Round-Shaped</a></li>
                                            <li><a href="womens.html">Oval-Shaped</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Eye Glasses</h4>
                                        <ul>
                                            <li><a href="womens.html">Anti Reflective</a></li>
                                            <li><a href="womens.html">Aspheric</a></li>
                                            <li><a href="womens.html">Bifocal</a></li>
                                            <li><a href="womens.html">Hi-index</a></li>
                                            <li><a href="womens.html">Progressive</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color5" href="#">Men</a>
                        <div class="megapanel">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>Contact Lenses</h4>
                                    <ul>
                                        <li><a href="mens.html">Daily-wear soft lenses</a></li>
                                        <li><a href="mens.html">Extended-wear</a></li>
                                        <li><a href="mens.html">Lorem ipsum </a></li>
                                        <li><a href="mens.html">Planned replacement</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>Sun Glasses</h4>
                                    <ul>
                                        <li><a href="mens.html">Heart-Shaped</a></li>
                                        <li><a href="mens.html">Square-Shaped</a></li>
                                        <li><a href="mens.html">Round-Shaped</a></li>
                                        <li><a href="mens.html">Oval-Shaped</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>Eye Glasses</h4>
                                    <ul>
                                        <li><a href="mens.html">Anti Reflective</a></li>
                                        <li><a href="mens.html">Aspheric</a></li>
                                        <li><a href="mens.html">Bifocal</a></li>
                                        <li><a href="mens.html">Hi-index</a></li>
                                        <li><a href="mens.html">Progressive</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color6" href="other.html">Other</a></li>
                    <li><a class="color7" href="other.html">Purchase</a></li>
                </ul>
            </div>
        </div>
        <div class="header-bottom-right">
            <div class="search">
                <input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                <input type="submit" value="Subscribe" id="submit" name="submit">
                <div id="response"> </div>
            </div>
            <div class="tag-list">
                <ul class="icon1 sub-icon1 profile_img">
                    <li><a class="active-icon c1" href="#"> </a>
                        <ul class="sub-icon1 list">
                            <li><h3>sed diam nonummy</h3><a href=""></a></li>
                            <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                        </ul>
                    </li>
                </ul>
                <ul class="icon1 sub-icon1 profile_img">
                    <li><a class="active-icon c2" href="#"> </a>
                        <ul class="sub-icon1 list">
                            <li><h3>No Products</h3><a href=""></a></li>
                            <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                        </ul>
                    </li>
                </ul>
                <ul class="last"><li><a href="#">Cart(0)</a></li></ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<style>
    .order-success-box {
        width: 70%;
        margin: 40px auto;
        padding: 30px 40px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        text-align: center;
        animation: fadeIn 0.5s ease;
    }

    .order-success-icon {
        font-size: 70px;
        color: #4CAF50;
        margin-bottom: 15px;
    }

    .order-success-title {
        font-size: 26px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .order-success-desc {
        font-size: 16px;
        color: #666;
        margin-bottom: 25px;
        line-height: 1.6;
    }

    .order-info-box {
        display: inline-block;
        padding: 15px 25px;
        background: #f7f7f7;
        border-radius: 8px;
        margin-bottom: 30px;
        text-align: left;
        line-height: 1.8;
        font-size: 15px;
        color: #444;
    }

    .order-btn-group a {
        display: inline-block;
        padding: 12px 26px;
        margin: 0 10px;
        font-size: 15px;
        border-radius: 6px;
        text-decoration: none;
        transition: all 0.2s ease;
    }

    .btn-primary {
        background: #ff4400;
        color: white;
    }

    .btn-primary:hover {
        background: #e03a00;
    }

    .btn-secondary {
        border: 1px solid #ccc;
        color: #666;
    }

    .btn-secondary:hover {
        background: #f2f2f2;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px);}
        to { opacity: 1; transform: translateY(0);}
    }
</style>

<div class="mod_main">
    <div class="jib_xinx_kuang">
        <div class="shand_piaot">我的订单</div>
        <div class="tab_trigger tab_trigger_wod_dd">
            <ul>
                <li><a class="text_shaid" href="#">全部</a></li>
                <li><a class="text_shaid" href="#">待付款</a>
                    <p class="sup">0</p>
                </li>
                <li><a class="text_shaid" href="#">待收货</a>
                    <p class="sup">1</p>
                </li>
                <li><a class="text_shaid" href="pingj_shaid.html">待评价</a>
                    <p class="sup">2</p>
                </li>
            </ul>
        </div>
        <div class="wod_dingd_shuaix">
            <div class="combox">
                <div><span class="c-lable" val="1">近三个月的订单</span><i></i></div>
                <ul class="c-list-value">
                    <li class=""><a href="#" val="1">近三个月的订单</a></li>
                    <li class=""><a href="#" val="2017">今年内订单</a></li>
                    <li class=""><a href="#" val="2016">2019年订单</a></li>
                    <li class=""><a href="#" val="2015">2018年订单</a></li>
                    <li class=""><a href="#" val="3">2018年以前订单</a></li>
                </ul>
            </div>
            <p class="dingd_huis_zhan"><a href="#">订单回收站</a></p>
            <div class="search_box">
                <input type="text" placeholder="订单编号" class="seach_inpt">
                <input type="button" value="" class="search-btn">
            </div>
        </div>
        <table class="order-tb order-tb_1">
            <colgroup>
                <col class="number-col">
                <col class="consignee-col">
                <col class="amount-col">
                <col class="operate-col">
                <col class="dis_col">
            </colgroup>
            <thead>
            <tr>
                <th>订单详情</th>
                <th>金额</th>
                <th>
                    <div class="combox combox_2">
                        <div><span class="c-lable" val="1">订单状态</span><i></i></div>
                        <ul class="c-list-value">
                            <li class=""><a href="#" val="2017">等待付款</a></li>
                            <li class=""><a href="#" val="2016">等待收货</a></li>
                            <li class=""><a href="#" val="2015">已完成</a></li>
                            <li class=""><a href="#" val="3">已取消</a></li>
                        </ul>
                    </div>
                </th>
                <th>收货人</th>
                <th>操作</th>
            </tr>
            </thead>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                if (orders != null && orders.size() > 0) {

                    for (Order order : orders) {
            %>

            <tbody>
            <tr class="sep-row">
                <td colspan="4"></td>
            </tr>

            <!-- 订单头部（订单时间 / 订单号 / 店铺名） -->
            <tr class="tr-th">
                <td colspan="5">
                    <span class="gap"></span>
                    <span class="dealtime span_30"><%=order.getOrdertime()%></span>
                    <span class="number span_30">订单号：
            <a href="order_detail.jsp?id=<%=order.getId()%>"><%=order.getId()%></a>
        </span>
                    <span class="span_30">眼镜商城官方旗舰店</span>
                    <span class="wod_sc_delete_beij span_30">
            <a href="OrderServlet?action=delete&id=<%=order.getId()%>" class="wod_dingd_delete"></a>
        </span>
                </td>
            </tr>

            <!-- 展示订单商品明细 -->
            <%
                List<OrderDetail> dList = order.getDetailList();
                int rowSpan = dList.size();
                boolean first = true;

                for (OrderDetail d : dList) {
                    Product p = d.getProduct();    // detail 中必须包含 product 对象
            %>

            <tr class="tr-bd">
                <td <%= first ? "rowspan='"+rowSpan+"'" : "" %> >
                    <div class="goods-item">
                        <div class="p-img">
                            <a target="_blank" href="single.jsp?id=<%=p.getId()%>">
                                <img src="<%=p.getPic()%>" alt="">
                            </a>
                        </div>
                        <div class="p-msg">
                            <div class="p-name">
                                <a target="_blank" href="single.jsp?id=<%=p.getId()%>"><%=p.getpName()%></a>
                                <p class="yiwanc_hui"><a href="#">申请售后</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="goods-number">x<%=d.getNum()%></div>
                </td>

                <% if (first) { %>
                <!-- 金额与状态只显示一次 -->
                <td rowspan="<%=rowSpan%>">
                    <div class="zhif_jine">
<%--                        <p>总额 ¥<%=order.getTotal()%></p>--%>
                        <span><%=order.getStatus()%></span>
                    </div>
                </td>

                <td rowspan="<%=rowSpan%>">
                    <div class="operate">
                        <p class="yiwanc_hui"><%=order.getStatus()%></p>
                        <a href="order_detail.jsp?id=<%=order.getId()%>" class="a-link">订单详情</a><br>
                    </div>
                </td>

                <td rowspan="<%=rowSpan%>">
                    <div class="txt_ren">
                        <span>默认收货人</span>
                        <p class="ren_tub"></p>
                    </div>
                </td>

                <td rowspan="<%=rowSpan%>">
                    <div class="operate">
                        <a href="#" target="_blank" class="a-link">评价</a>丨
                        <a href="#" class="a-link">晒单</a><br>
                        <a href="single.jsp?id=<%=p.getId()%>" class="btn-def">再次购买</a>
                    </div>
                </td>
                <% } %>

            </tr>

            <%
                    first = false;
                } // end detail loop
            %>

            </tbody>

            <%
                } // end order loop
            } else {
            %>

            <tbody>
            <tr><td colspan="5" style="text-align:center;padding:40px;">暂无订单</td></tr>
            </tbody>

            <%
                }
            %>

        </table>
        <div class="gerzx_fany">
            <a href="#" class="shangxy">上一页</a>
            <a href="#">1</a>
            <a href="#" class="shangxy">上一页</a>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer-top">
        <div class="wrap">
            <div class="section group example">
                <div class="col_1_of_2 span_1_of_2">
                    <ul class="f-list">
                        <li><img src="images/2.png"><span class="f-text">Free Shipping on orders over $ 100</span><div class="clear"></div></li>
                    </ul>
                </div>
                <div class="col_1_of_2 span_1_of_2">
                    <ul class="f-list">
                        <li><img src="images/3.png"><span class="f-text">Call us! toll free-222-555-6666 </span><div class="clear"></div></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="footer-middle">
        <div class="wrap">
            <div class="section group example">
                <div class="col_1_of_f_1 span_1_of_f_1">
                    <div class="section group example">
                        <div class="col_1_of_f_2 span_1_of_f_2">
                            <h3>Facebook</h3>
                            <script>(function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));</script>
                            <div class="like_box">
                                <div class="fb-like-box" data-href="http//www.zjf88.com/" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
                            </div>
                        </div>
                        <div class="col_1_of_f_2 span_1_of_f_2">
                            <h3>From Twitter</h3>
                            <div class="recent-tweet">
                                <div class="recent-tweet-icon">
                                    <span> </span>
                                </div>
                                <div class="recent-tweet-info">
                                    <p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
                                </div>
                                <div class="clear"> </div>
                            </div>
                            <div class="recent-tweet">
                                <div class="recent-tweet-icon">
                                    <span> </span>
                                </div>
                                <div class="recent-tweet-info">
                                    <p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
                                </div>
                                <div class="clear"> </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="col_1_of_f_1 span_1_of_f_1">
                    <div class="section group example">
                        <div class="col_1_of_f_2 span_1_of_f_2">
                            <h3>Information</h3>
                            <ul class="f-list1">
                                <li><a href="#">Duis autem vel eum iriure </a></li>
                                <li><a href="#">anteposuerit litterarum formas </a></li>
                                <li><a href="#">Tduis dolore te feugait nulla</a></li>
                                <li><a href="#">Duis autem vel eum iriure </a></li>
                                <li><a href="#">anteposuerit litterarum formas </a></li>
                                <li><a href="#">Tduis dolore te feugait nulla</a></li>
                            </ul>
                        </div>
                        <div class="col_1_of_f_2 span_1_of_f_2">
                            <h3>Contact us</h3>
                            <div class="company_address">
                                <p>500 Lorem Ipsum Dolor Sit,</p>
                                <p>22-56-2-9 Sit Amet, Lorem,</p>
                                <p>USA</p>
                                <p>Phone:(00) 222 666 444</p>
                                <p>Fax: (000) 000 00 00 0</p>
                                <p>Email: <span>mail[at]leoshop.com</span></p>

                            </div>
                            <div class="social-media">
                                <ul>
                                    <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Google"><a href="#" target="_blank"> </a></span></li>
                                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Linked in"><a href="#" target="_blank"> </a> </span></li>
                                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Rss"><a href="#" target="_blank"> </a></span></li>
                                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Facebook"><a href="#" target="_blank"> </a></span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="wrap">
            <div class="copy">
                <p>Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http//www.zjf88.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            </div>
            <div class="f-list2">
                <ul>
                    <li class="active"><a href="about.html">About Us</a></li> |
                    <li><a href="delivery.html">Delivery & Returns</a></li> |
                    <li><a href="delivery.html">Terms & Conditions</a></li> |
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>


</body>
</html>
