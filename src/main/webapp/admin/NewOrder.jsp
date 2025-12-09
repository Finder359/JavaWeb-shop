<%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/9
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Ciallo~</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Microsoft Yahei", sans-serif;
            background: linear-gradient(135deg, #f6d5f7 0%, #fbe9d7 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1.2s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            background: #ffffffcc;
            backdrop-filter: blur(8px);
            width: 600px;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        h1 {
            font-size: 40px;
            margin-bottom: 10px;
            color: #ff6fa7;
            text-shadow: 1px 1px 2px #fff;
        }

        p {
            font-size: 20px;
            color: #555;
            margin: 0 0 20px 0;
        }

        .btn {
            display: inline-block;
            padding: 12px 28px;
            font-size: 18px;
            color: white;
            background: #ff6fa7;
            border-radius: 30px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn:hover {
            background: #ff8fbf;
            transform: scale(1.08);
        }

        .emoji {
            font-size: 50px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="card">
    <div class="emoji">٩(◕‿◕｡)۶</div>
    <h1>Ciallo～!</h1>

    <p>不要在后台刷单哦～</p>
    <p>不如让真正的用户来帮你下单吧 ♥</p>

    <br>

    <a href="../front/index.jsp" class="btn">
        去前台看看商品吧！
    </a>
</div>

</body>
</html>

