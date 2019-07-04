<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/19
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style type="text/css">
    .top{
        width: 1000px;
        height: 50px;
        margin: auto;
        margin-top: 100px;
    }
    .div1{
        margin-left: 750px;
        float: left;
    }
    .div2{
        margin-left: 80px;
        float: left;
    }
    .div3{
        margin-left: 325px;
        float: left;
        color: grey;
    }
    .div4{
        margin-left: 80px;
        float: left;
    }
   .con{
       width: 1000px;
       height: 200px;
       margin: auto;
       line-height: 200px;
       background-color:  #FCFCFC;
       border-bottom: solid 1px gainsboro;
   }
   .con img{
      margin-top: 25px;
       margin-left: 40px;
       box-shadow: 3px 3px 3px grey;
   }
    .div5{
        float: left;
    }
    .name{
        float: left;
        height: 50px;
        width: 200px;
        margin-left: 60px;
    }
    .jiesuan{
        width: 1000px;
        height:100px;
        background-color: #FCFCFC;
        margin: auto;
        margin-top: 30px;
        line-height: 100px;
    }
    .zongshu span{
        color: red;
    }
    .zongjia{
        float: left;
        width: 230px;
        height: 30px;
        margin-left:600px;
    }
    .zongjia span{
        font-size: 21px;
        color: red;
    }
    .fukuan{
        float: left;
        width: 120px;
        height: 40px;
        margin-top: 30px;
        border: solid 1px #f26552;
        font-size: 20px;
        background-color: #f26552;
        color: white;
    }
    a{
        text-decoration: none;
    }
    a:hover{
        color:#f26552 ;
    }
</style>
<script type="text/javascript">
/*
计算订单总价
 */
    window.onload = function(){
        var id=document.getElementsByName("ids");
        var sum=0;
        for(var i=0;i<id.length;i++){
            var nums=document.getElementById("num"+id[i].value).innerHTML;
            var prices=document.getElementById("price"+id[i].value).innerHTML;
            var num = parseInt(nums);
            var price=parseFloat(prices).toFixed(2);
            sum+=num*price;
        }
        var totalPrice=document.getElementById("totalPrice");
        totalPrice.innerText=sum.toFixed(2);
    }

</script>
<link rel="stylesheet" href="css/gouwuche.css">
<head>
    <title>King 书城</title>
</head>
<body>
<div class="n1_header">
    <div class="n1_header_dyg">
        <a style=" text-decoration: none;" href=""><img src="img/logo.jpg" width="144" height="73" /></a >
        <div class="n1_header_deg">
            <ul class="n1_header_deg_biaoshi">
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="${pageContext.request.contextPath}/ShowzhuyeServlet">首页</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="${pageContext.request.contextPath}/ShowBookServlet">分类</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="${pageContext.request.contextPath}/ShowPhServlet">排行</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="${pageContext.request.contextPath}/findShopServlet">购物车</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="${pageContext.request.contextPath}/findOrderServlet">我的订单</a >  </li>
            </ul>
            <div class="n1_search">
                <form method="post" action="${pageContext.request.contextPath}/SouSuoServlet" id="search_form" >
                    <input style="width: 200px;" type="text" name="keyword"  placeholder="书名/作者名"/>
                    <input type="submit" style="width: 30px;margin-left:-20px;background-color: white" value="搜索">
                    <%--<img src="img/ss.jpg" width="22" height="24" style="margin-left: -60px;">--%>
                </form>
                <ul class="list" id="search_suggestion_box"></ul>
            </div>
            <div class="n1_login">
                <a style=" text-decoration: none;" href="${pageContext.request.contextPath}/denglu1hao.jsp"><span class="n1_login_beffor" id="unlogin_box" style="display: block;">登录</span></a>
            </div>
        </div>
    </div>
</div>




<div class="top">
    <div class="div1">单价</div>
    <div class="div2">数量</div>
</div>
<c:forEach items="${orders}" var="order" varStatus="s">
<div class="con" onmouseover="jijia(${order.id})">
    <input type="hidden" value="${order.id}" name="ids">
    <div class="div5"><img src="img/${order.book_picture}" style="height: 150px;width: 120px"></div>
    <div class="name">${order.bookname}</div>
    <div class="div3">￥<span id="price${order.id}">${order.book_price}</span></div>
    <div class="div4"><span id="num${order.id}">${order.num}</span></div>
</div>
</c:forEach>
<div class="jiesuan">
    <div class="zongjia" >总计：<span>¥&nbsp;</span><span id="totalPrice">0</span></div>
    <button class="fukuan" id="fukuan" >立即付款</button>
</div>


</body>
</html>
