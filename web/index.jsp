<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
</head>
<style type="text/css">

    .huanyin {
        font-size: 18px;
        margin-left: 140px;
        letter-spacing: 2px;
        color: grey;
    }

    img {
        margin-left: 100px;
        margin-top: 30px;
        width: 200px;
        height: 100px;
    }

    a {
        text-align: center;
        float: left;
        margin-top: 50px;
        margin-left: 50px;
        line-height: 200px;
        display: inline-block;
        width: 280px;
        height: 200px;
        border: solid 1px palevioletred;
        margin-top: 30px;
        background: radial-gradient(200% 100% at bottom center, #f7f7b6, #e96f92, #CD96CD, #B452CD);
        background: radial-gradient(220% 105% at top center, #B452CD 10%, #CD96CD 40%, #e96f92 65%, #f7f7b6);
        color: white;
        font-size: 10px;
        border-radius: 50%;
    }
    .con{
        margin-top: 80px;
        width: 100%;
        height: 500px;
        margin-left: 60px;

    }
</style>
<body>

<div><img src="img/logo.jpg"></div>
<div class="huanyin">${user.name},欢迎您!</div>
<div align="center" class="con">
    <%--人员管理--%>
    <a
            href="${pageContext.request.contextPath}/findUserByPageServlet" style="text-decoration:none;font-size:28px">查询所有用户信息
    </a>
    <%--图书管理--%>
    <a
            href="${pageContext.request.contextPath}/findBookByPageServlet" style="text-decoration:none;font-size:28px">查询所有图书信息
    </a>
    <%--购物车管理--%>

    <a
            href="${pageContext.request.contextPath}/findShopByPageServlet" style="text-decoration:none;font-size:28px">查看所有购物车信息
    </a>
    <%--订单管理--%>

    <a
            href="${pageContext.request.contextPath}/findOrderByPageServlet" style="text-decoration:none;font-size:28px">查看所有订单信息
    </a>
</div>


</body>
</html>