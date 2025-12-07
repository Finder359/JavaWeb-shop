<%@ page import="com.shop.entity.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.shop.entity.Product" %><%--
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
<div class="register_account">
    <div class="beij_center">
        <div class="cart-main-header clearfix">
            <div class="cart-col-1">
                <input type="checkbox" class="jdcheckbox select-all">
            </div>
            <div class="cart-col-2">全选</div>
            <div class="cart-col-3">商品信息</div>
            <div class="cart-col-4">
                <div class="cart-good-real-price">单价</div>
            </div>
            <div class="cart-col-5">数量</div>
            <div class="cart-col-6">
                <div class="cart-good-amount">小计</div>
            </div>
            <div class="cart-col-7">操作</div>
        </div>
    </div>
    <%
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart != null && cart.size() > 0) {

            for (CartItem item : cart.values()) {
                Product p = item.getProduct();
    %>

    <div class="cart-shop-good">
        <div class="cart-col-1">
            <input type="checkbox" class="jdcheckbox item-check">
        </div>
        <div class="cart-col-2" style="height: 82px;">
            <a href="single.jsp?id=<%=p.getId()%>" class="g-img">
                <img src="<%=p.getPic()%>" alt="">
            </a>
        </div>
        <div class="fl houj_c">
            <div class="cart-dfsg">
                <div class="cart-good-name">
                    <a href="single.jsp?id=<%=p.getId()%>"><%=p.getpName()%></a>
                </div>
            </div>

            <div class="cart-col-4">
                <div class="cart-good-real-price">
                    ¥&nbsp;<%=p.getPrice()%>
                </div>
            </div>

            <div class="cart-col-5">
                <div class="gui-count cart-count">
                    <a href="CartServlet?action=sub&id=<%=p.getId()%>" class="gui-count-btn gui-count-sub">-</a>
                    <a href="CartServlet?action=add&id=<%=p.getId()%>" class="gui-count-btn gui-count-add">+</a>
                    <div class="gui-count-input"><input type="text" value="<%=item.getCount()%>"></div>
                </div>
            </div>

            <div class="cart-col-6 ">
                <div class="cart-good-amount item-total">¥&nbsp;<%=item.getTotal()%></div>
            </div>
        </div>
        <div class="cart-col-7">
            <div class="cart-good-fun delfixed">
                <a href="CartServlet?action=delete&id=<%=p.getId()%>">删除</a>
            </div>
            <div class="cart-good-fun">
                <a href="#">移入收藏夹</a>
            </div>
        </div>
    </div>

    <%
        } // end for
    } else {
    %>
    <p>购物车为空</p>
    <%
        }
    %>

    <div class="jies_beij">
        <div class="beij_center over_dis">
            <div class="cart-col-1 cart_jies">
                <input type="checkbox" class="jdcheckbox select-all">
            </div>
            <div class="qianm_shanc_yvf">
                <span>全选</span>
                <a href="#">删除</a>
            </div>
            <div class="jies_ann_bei">
                <p>已选 <em>0</em> 件商品 总计（不含运费）：<span>￥0.00</span></p>
                <a href="tij_dingd.html" class="order_btn">去结算</a>
            </div>
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
<script>
    const selectedCountElement = document.querySelector('.jies_ann_bei em');


    // 选择所有复选框
    const selectAll = document.querySelectorAll('.select-all');
    const itemChecks = document.querySelectorAll('.item-check');

    // 用于显示总价的元素
    const totalPriceElement = document.querySelector('.jies_ann_bei span');

    // 更新总价
    function updateTotalPrice() {
        let total = 0;
        let count = 0;

        itemChecks.forEach(check => {
            if (check.checked) {
                count++;

                // 找到当前商品所在的 cart-shop-good 节点
                let totalElement = check.closest(".cart-shop-good")
                    .querySelector(".item-total");

                if (totalElement) {
                    let t = totalElement.innerText.replace("¥", "").trim();
                    total += parseFloat(t);
                }
            }
        });

        // 更新数量与总价显示
        selectedCountElement.innerText = count;
        totalPriceElement.innerText = "￥" + total.toFixed(2);
    }


    // 全选按钮逻辑
    selectAll.forEach(allCheck => {
        allCheck.addEventListener('change', function () {
            itemChecks.forEach(item => item.checked = this.checked);
            selectAll.forEach(s => s.checked = this.checked); // 多个全选保持同步
            updateTotalPrice();
        });
    });

    // 单选改变时更新总价 + 同步全选状态
    itemChecks.forEach(item => {
        item.addEventListener('change', function () {

            // 判断是否全部选中
            let allChecked = true;
            itemChecks.forEach(c => { if (!c.checked) allChecked = false; });

            selectAll.forEach(s => s.checked = allChecked);

            updateTotalPrice();
        });
    });
</script>

</body>
</html>
