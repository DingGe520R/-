<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html>
<style type="text/css">
    .top{
        width: 1000px;
        height: 50px;
        margin: auto;
        margin-top: 0px;
    }
    .div1{
        margin-left: 750px;
        float: left;
    }
    .div2{
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
        float: left;
        margin-top: 25px;
        margin-left: 40px;
        box-shadow: 3px 3px 3px grey;
    }
.name{
    float: left;
    width: 200px;
    margin-left: 40px;
}
    .num{
        float: left;
        margin-left: 80px;
    }
    .price{
        float: left;
        margin-left: 340px;
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
<link rel="stylesheet"  href="css/Fenlei.css"/>
<link href="css/ensure.css" rel="stylesheet"/>
<head>
<meta charset="utf-8">
<title>King 书城</title>
</head>

<body class="body">
<div class="n1_header" style="border-bottom: 20px">
  <div class="n1_header_dyg"> <a style=" text-decoration: none;" href=""><img src="img/logo.jpg" width="144" height="73" /></a >
    <div class="n1_header_deg" >
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
        <ul class="list" id="search_suggestion_box">
        </ul>
      </div>
      <div class="n1_login"> <a style=" text-decoration: none;"  href="${pageContext.request.contextPath}/denglu1hao.jsp"><span class="n1_login_beffor" id="unlogin_box" style="display: block;">登录</span></a> </div>
    </div>
  </div>
</div>
<br>
<div class="xian"></div>
<div class="head">
  <span>确认订单</span><p>又逛超时了，立即抢回还有货的商品吧! &nbsp;<img src="img/xiaotubiao.jpg" width="20px" height="20px"/></p>
</div>
<div class="centent">
  <div class="centent_one">
    <p>&nbsp;&nbsp;&nbsp;收货信息</p>
  </div>
  <div class="text">
  <p>
    <input type="button" onClick="msgbox(1)" value="添加地址" >
    </p>
    
     <script>  
        function msgbox(n){
            document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        }
     </script>
     <div id='inputbox' class="box" style="margin-left: 200px;margin-top: -50px;">
       <form action="${pageContext.request.contextPath}/adduserAddressServlet" method="post">
        <a class='x' href=''; onclick="msgbox(0); return false;" style="text-decoration: none;margin-left:-50px"></a>
        <ul>
        <li>&nbsp;&nbsp;收货人：<input type="text" name="name"></li>
        <li>联系电话：<input type="text" name="phone"></li>
        <li>备用电话：<input type="text" name="sparephone"></li>
        <li style="margin-top: 20px">地址类型：
        <select style="width: 300px;height: 30px" name="address_type" >
            <option></option>
            <option>家庭</option>
            <option>公司</option>
            <option>其他</option>
        </select>
        </li>
        <li>详细地址：<input type="text" name="detail_adr"></li>
        </ul>
        <input type="submit"  value="确定" style="width:70px;margin-left: 530px;background-color: #C69;color: white">
     </form>
     </div>
  </div>

    <div class="huixie" style="margin-left: 380px;margin-top: -150px">
        <div class="xm">${address.name}:</div>
        <div class="dh">${address.phone}</div>
        <div class="dzs">${address.detail_adr}</div>
    </div>

  <div class="centent_two" >
    <p>&nbsp;&nbsp;&nbsp;商品清单<a style=" text-decoration: none;" href="${pageContext.request.contextPath}/findShopServlet" target="_blank">返回购物车</a></p>
  </div>
  <div class="entext">

      <div class="top">
          <div class="div1">单价</div>
          <div class="div2">数量</div>
      </div>
      <c:forEach items="${orders}" var="order" varStatus="s">
          <div class="con" onmouseover="jijia(${order.id})">
              <input type="hidden" value="${order.id}" name="ids">
              <div class="img"><img src="img/${order.book_picture}" style="height: 150px;width: 120px"></div>
              <div class="name">${order.bookname}</div>
              <div class="price">￥<span id="price${order.id}">${order.book_price}</span></div>
              <div class="num"><span id="num${order.id}">${order.num}</span></div>
          </div>
      </c:forEach>
      <div class="jiesuan">
          <div class="zongjia" >总计：<span>¥&nbsp;</span><span id="totalPrice">0</span></div>
          <button class="fukuan" id="fukuan" ><a href="zf.jsp" style="color: white">立即付款</a></button>
      </div>


  </div>
</div>
<%--<div class="v1_foot" >--%>
  <%--<div class="aboutcompany">--%>
    <%--<p class="link"> <a style=" text-decoration: none;" href="" target="_blank">联系我们</a> <a style=" text-decoration: none;" href="" target="_blank">商务合作</a> <a style=" text-decoration: none;" href="" target="_blank">关于我们</a> <a style=" text-decoration: none;" href="" target="_blank">法律声明</a> </p>--%>
    <%--<p>京ICP备11008516号<a style=" text-decoration: none;" href="" target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a style=" text-decoration: none;" href="" target="_blank">京ICP证090653号</a><a style=" text-decoration: none;" href=""  target="_blank" >京公网安备11010502030452</a></p>--%>
    <%--<p>2015 All Rights Reserved king科技股份有限公司 版权所有</p>--%>
    <%--<p>不良信息举报：jubao@king.com 举报电话：010-59845699</p>--%>
  <%--</div>--%>
<%--</div>--%>
</body>
</html>
