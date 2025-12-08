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
<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    int totalCount = 0;
    double totalAmount = 0;

    if (cart != null) {
        for (CartItem item : cart.values()) {
            totalCount += item.getCount();
            totalAmount += item.getTotal();
        }
    }
%>

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
<div class="beij_center">
    <div class="checkout-tit">
        <span class="tit-txt">填写并核对订单信息</span>
    </div>
    <div class="checkout_steps">
        <div class="step-tit">
            <h3>收货人信息</h3>
            <div class="extra_r">
                <a href="#" class="ftx-05 J_consignee_global">新增收货地址</a>
            </div>
        </div>
        <div class="jies_y_shouh_diz shiq_1">
            <ul>
                <li class="cur">
                    <div class="dangq_xuanz_diz">当前地址</div>
                    <span>海听风吹</span>
                    <span>福建 福州 连江县 XXXXXXXX</span>
                    <span>130****2337</span>
                    <div class="bianji_yv_shanc">
                        <a href="#">设为默认</a>
                        <a href="#">编辑</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="jies_y_shouh_diz shiq_2">
            <ul>
                <li class="zhif_fangs cur">
                    <div class="dangq_xuanz_diz">醒肤快递</div>
                </li>

            </ul>
        </div>
        <div class="step-tit">
            <h3>送货清单</h3>
            <div class="extra_r">
                <a href="#" class="ftx-05 J_consignee_global">价格说明</a>
                <a href="#" class="ftx-05 J_consignee_global">返回修改购物车</a>
            </div>
        </div>
        <div class="shopping_list">
            <div class="dis_modes">
                <div class="mode_item_tit">
                    <h4>付款方式</h4>
                </div>
                <div>
                    <div class="jies_y_shouh_diz jies_y_shouh_diz_kuaid">
                        <ul>
                            <li class="zhif_fangs cur">
                                <div class="dangq_xuanz_diz">在线支付</div>
                            </li>
                            <li class="zhif_fangs">
                                <div class="dangq_xuanz_diz">货到付款</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="peis_shij">
                    <p>配送时间： </p><span>工作日、双休日与节假日均可送货</span>
                </div>
                <div class="maij_liuy">
                    <p>给商家留言</p>
                    <input type="text" value="">
                </div>
            </div>
            <div class="goods_list">
                <div class="goods_list_neik">
                    <h4 class="vendor_name_h">眼镜旗舰店</h4>

                    <%
                        if (cart != null) {
                            for (CartItem item : cart.values()) {
                                Product p = item.getProduct();
                    %>

                    <div class="goods_item">
                        <div class="p_img">
                            <a href="single.jsp?id=<%=p.getId()%>">
                                <img src="<%= p.getPic() %>">
                            </a>
                        </div>
                        <div class="goods_msg">
                            <div class="p_name">
                                <a href="single.jsp?id=<%=p.getId()%>"><%= p.getpName() %></a>
                            </div>
                            <div class="p_price">
                                <span class="jq_price">¥<%= p.getPrice() %></span>
                                <span>x<%= item.getCount() %></span>
                                <span>有货</span>
                                <span>—</span>
                            </div>
                        </div>
                    </div>

                    <%
                            } // end for
                        } // end if
                    %>

                </div>
            </div>

        </div>
        <div class="fap_beij">
            <div class="step-tit">
                <h3>发票信息</h3>
            </div>
            <div class="kaif_p">
                <span>普通发票（电子)</span>
                <span>个人</span>
                <span> 明细 </span>
                <span> <a href="#">修改</a> </span>
            </div>
        </div>
    </div>
    <!--收费明细-->
    <div class="order_summary">
        <div class="qianq_mx">
            <div class="jiaq_meih">
                <span class="xiangq_leib"><em class="goumai_ges"><%= totalCount %></em> 件商品，总商品金额：</span>
                <em class="goum_zongj">¥<%= totalAmount %></em>
            </div>
            <div class="jiaq_meih">
                <span class="xiangq_leib">积分：</span>
                <em class="goum_zongj"><%= String.format("%.2f", totalAmount * 0.1) %></em>
            </div>
            <div class="jiaq_meih">
                <span class="xiangq_leib">运费：</span>
                <em class="goum_zongj">￥00.00</em>
            </div>
            <div class="jiaq_meih">
                <span class="xiangq_leib">服务费：</span>
                <em class="goum_zongj">￥00.00</em>
            </div>
        </div>
    </div>
    <div class="trade_foot_detail_com">
        <div class="dsgs">
            <div class="qianq_mx">
                <div class="jiaq_meih">
                    <span class="xiangq_leib"> 应付总额：</span>
                    <em class="goum_zongj zhongf_jine">¥<%= totalAmount %></em>
                </div>
            </div>
        </div>
        <div class="zuiz_diz">
            <span>寄送至： 福建 福州 连江县 XXXXXXXX</span>
            <span> 收货人：海听风吹 130****2337</span>
        </div>
    </div>
    <div class="tij_dingd_ann">
        <form id="orderForm" action="OrderServlet" method="post">
            <input type="hidden" name="action" value="submit">
            <input type="hidden" name="total" value="<%= totalAmount %>">
        </form>
        <a href="javascript:void(0)" class="order_btn" onclick="document.getElementById('orderForm').submit();">
            提交订单
        </a>
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
