<%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/9
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 - Cyberpunk Reality Breach</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            overflow: hidden;
            background: #000;
        }

        /* 动态背景霓虹光柱 */
        .bg {
            position: absolute;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at center, #0ff2, #000d 70%),
            repeating-linear-gradient(90deg, #0ff1 0px, #0003 2px, #111 4px);
            animation: scan 6s linear infinite;
            z-index: -1;
        }

        @keyframes scan {
            0% { background-position-y: 0; }
            100% { background-position-y: 1000px; }
        }

        /* 404 巨型发光文字 */
        .title {
            font-size: 150px;
            font-weight: 900;
            text-align: center;
            margin-top: 10vh;
            letter-spacing: 10px;
            color: #0ff;
            text-shadow:
                    0 0 20px #0ff,
                    0 0 40px #0ff,
                    0 0 70px #0ff,
                    0 0 120px cyan;
            animation: pulse 1.5s infinite alternate;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(1.05); opacity: 0.8; }
        }

        /* 副标题 */
        .subtitle {
            text-align: center;
            margin-top: -20px;
            font-size: 28px;
            color: #0ff9;
            text-shadow: 0 0 10px #0ff;
        }

        /* 效果线 */
        .line {
            width: 70%;
            height: 2px;
            margin: 30px auto;
            background: linear-gradient(90deg, transparent, #0ff, transparent);
            animation: glowline 2s infinite linear;
        }

        @keyframes glowline {
            0% { opacity: 0.3; }
            100% { opacity: 1; }
        }

        /* 按钮 */
        .btn {
            display: block;
            width: 280px;
            margin: 40px auto;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            border-radius: 8px;
            text-decoration: none;
            color: #000;
            font-weight: bold;
            background: #0ff;
            box-shadow: 0 0 20px #0ff, 0 0 40px cyan;
            transition: 0.2s;
        }

        .btn:hover {
            transform: scale(1.08);
            box-shadow: 0 0 30px #0ff, 0 0 60px cyan;
        }

        /* 底部提示 */
        .footer {
            position: absolute;
            bottom: 30px;
            text-align: center;
            width: 100%;
            color: #0ff7;
            font-size: 18px;
            text-shadow: 0 0 10px #0ff;
            letter-spacing: 1px;
        }
    </style>
</head>

<body>

<div class="bg"></div>

<div class="title">404</div>

<div class="subtitle">YOU HAVE ENTERED A RESTRICTED CYBER DIMENSION</div>

<div class="line"></div>

<a href="/front/index.jsp" class="btn">返回现实世界</a>

<div class="footer">
    SYSTEM MESSAGE: 该页面已被虚空吞噬。请谨慎探索。⚡
</div>

</body>
</html>

