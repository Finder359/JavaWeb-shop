<%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/6
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 处理退出登录
    if ("logout".equals(request.getParameter("action"))) {
        session.invalidate();
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http//fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery1.min.js"></script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <!--start slider -->
    <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
    <!--end slider -->
    <script src="js/jquery.easydropdown.js"></script>
</head>
<body>
<div class="header-top">
    <div class="wrap">
        <div class="header-top-left">
            <div class="box">
<%--                <select tabindex="4" class="dropdown">--%>
<%--                    <option value="" class="label" value="">Language :</option>--%>
<%--                    <option value="1">English</option>--%>
<%--                    <option value="2">French</option>--%>
<%--                    <option value="3">German</option>--%>
<%--                </select>--%>
            </div>
            <div class="box1">
<%--                <select tabindex="4" class="dropdown">--%>
<%--                    <option value="" class="label" value="">Currency :</option>--%>
<%--                    <option value="1">$ Dollar</option>--%>
<%--                    <option value="2">€ Euro</option>--%>
<%--                </select>--%>
            </div>
            <div class="clear"></div>
        </div>
        <div class="cssmenu">
            <ul>
                <%
                    String username = (String) session.getAttribute("username");
                    if (username != null) {
                %>
                <li><a href="#">欢迎, <%= username %></a></li> |
                <li><a href="myOrders.jsp">我的订单</a></li> |
                <li><a href="cart.jsp">购物车</a></li> |
                <li><a href="index.jsp?action=logout">退出登录</a></li>
                <%
                } else {
                %>
                <li><a href="login.jsp">登录</a></li> |
                <li><a href="register.jsp">注册</a></li> |
                <li><a href="cart.jsp">购物车</a></li>
                <%
                    }
                %>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <div class="header-bottom-left">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" alt=""/></a>
            </div>
            <div class="menu">
                <ul class="megamenu skyblue">
                    <li class="active grid"><a href="index.jsp">首页</a></li>
                    <li><a class="color4" href="womens.jsp">女款</a>
                        <div class="megapanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>太阳镜</h4>
                                        <ul>
                                            <li><a href="womens.jsp?type=太阳镜">经典款</a></li>
                                            <li><a href="womens.jsp?type=太阳镜">运动款</a></li>
                                            <li><a href="womens.jsp?type=太阳镜">时尚款</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>防蓝光眼镜</h4>
                                        <ul>
                                            <li><a href="womens.jsp?type=防蓝光">办公防护</a></li>
                                            <li><a href="womens.jsp?type=防蓝光">游戏专用</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>光学镜架</h4>
                                        <ul>
                                            <li><a href="womens.jsp?type=光学镜架">金属框</a></li>
                                            <li><a href="womens.jsp?type=光学镜架">板材框</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color5" href="mens.jsp">男款</a>
                        <div class="megapanel">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>隐形眼镜</h4>
                                    <ul>
                                        <li><a href="mens.jsp">日抛软性隐形眼镜</a></li>
                                        <li><a href="mens.jsp">长戴型隐形眼镜</a></li>
                                        <li><a href="mens.jsp">彩色美瞳</a></li>
                                        <li><a href="mens.jsp">定期更换型</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>太阳镜</h4>
                                    <ul>
                                        <li><a href="mens.jsp">心形镜框</a></li>
                                        <li><a href="mens.jsp">方形镜框</a></li>
                                        <li><a href="mens.jsp">圆形镜框</a></li>
                                        <li><a href="mens.jsp">椭圆镜框</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>光学眼镜</h4>
                                    <ul>
                                        <li><a href="mens.jsp">防反光镜片</a></li>
                                        <li><a href="mens.jsp">非球面镜片</a></li>
                                        <li><a href="mens.jsp">双光镜片</a></li>
                                        <li><a href="mens.jsp">高折射率超薄镜片</a></li>
                                        <li><a href="mens.jsp">渐进多焦镜片</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li><a class="color6" href="other.jsp">其他</a></li>
                    <li><a class="color7" href="purchase.jsp">优惠专区</a></li>
                </ul>
            </div>
        </div>
        <div class="header-bottom-right">
            <div class="search">
                <input type="text" name="s" class="textbox" value="搜索商品" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '搜索商品';}">
                <input type="submit" value="搜索" id="submit" name="submit">
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
                <ul class="last"><li><a href="cart.jsp">购物车(0)</a></li></ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- start slider -->
<div id="fwslider">
    <div class="slider_container">
        <div class="slide">
            <!-- Slide image -->
            <img src="images/banner.jpg" alt=""/>
            <!-- /Slide image -->
            <!-- Texts container -->
            <div class="slide_content">
                <div class="slide_content_wrap">
                    <!-- Text title -->
                    <h4 class="title">铝合金系列</h4>
                    <p class="description">体验雷朋经典</p>
                    <!-- /Text description -->
                </div>
            </div>
            <!-- /Texts container -->
        </div>
        <!-- /Duplicate to create more slides -->
        <div class="slide">
            <img src="images/banner1.jpg" alt=""/>
            <div class="slide_content">
                <div class="slide_content_wrap">
                    <h4 class="title">时尚潮流系列</h4>
                    <p class="description">引领眼镜新风尚</p>
                </div>
            </div>
        </div>
        <!--/slide -->
    </div>
    <div class="timers"></div>
    <div class="slidePrev"><span></span></div>
    <div class="slideNext"><span></span></div>
</div>
<!--/slider -->
<div class="main">
    <div class="wrap">
        <div class="section group">
            <div class="cont span_2_of_3">
                <h2 class="head">特色商品</h2>
                <%
                    // 这里先用静态数据测试，后面改成从数据库读取
                    // 等你发我 UserDao/Impl 后，我写 ProductServlet 和 ProductDao
                %>
                <div class="top-box">
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.jsp?id=6">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">新品</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">雷朋飞行员太阳镜</p>
                                        <div class="price1">
                                            <span class="actual">¥1299</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.jsp?id=6">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">新品</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">雷朋飞行员太阳镜</p>
                                        <div class="price1">
                                            <span class="actual">¥1299</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.jsp?id=6">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">新品</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">雷朋飞行员太阳镜</p>
                                        <div class="price1">
                                            <span class="actual">¥1299</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <!-- 其他商品同理 -->
                </div>



                <h2 class="head">Staff Pick</h2>
                <div class="top-box1">
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic8.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic4.jpg" alt=""/>
                                </div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic2.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
                <h2 class="head">New Products</h2>
                <div class="section group">
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic5.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic2.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <a href="single.html">
                            <div class="inner_content clearfix">
                                <div class="product_image">
                                    <img src="images/pic3.jpg" alt=""/>
                                </div>
                                <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                                <div class="price">
                                    <div class="cart-left">
                                        <p class="title">Lorem Ipsum simply</p>
                                        <div class="price1">
                                            <span class="actual">$12.00</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"> </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="rsidebar span_1_of_left">
                <div class="top-border"> </div>
                <div class="border">
                    <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
                    <link href="css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
                    <script src="js/jquery.nivo.slider.js"></script>
                    <script type="text/javascript">
                        $(window).load(function() {
                            $('#slider').nivoSlider();
                        });
                    </script>
                    <div class="slider-wrapper theme-default">
                        <div id="slider" class="nivoSlider">
                            <img src="images/t-img1.jpg"  alt="" />
                            <img src="images/t-img2.jpg"  alt="" />
                            <img src="images/t-img3.jpg"  alt="" />
                        </div>
                    </div>
                    <div class="btn"><a href="single.html">Check it Out</a></div>
                </div>
                <div class="top-border"> </div>
                <div class="sidebar-bottom">
                    <h2 class="m_1">订阅我们的<br>最新消息</h2>
                    <p class="m_text">获取最新优惠信息</p>
                    <div class="subscribe">
                        <form>
                            <input name="userName" type="text" class="textbox">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-top">
        <div class="wrap">
            <div class="section group example">
                <div class="col_1_of_2 span_1_of_2">
                    <ul class="f-list">
                        <li><img src="images/2.png"><span class="f-text">订单满¥100免运费</span><div class="clear"></div></li>
                    </ul>
                </div>
                <div class="col_1_of_2 span_1_of_2">
                    <ul class="f-list">
                        <li><img src="images/3.png"><span class="f-text">客服热线：400-888-6666</span><div class="clear"></div></li>
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
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
