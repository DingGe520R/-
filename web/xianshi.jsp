<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/13
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>King 书城</title>
</head>
<link rel="stylesheet"  href="css/Fenlei.css"/>
<style type="text/css">
    /*body{*/
        /*width: 80%;*/
        /*margin: auto;*/
    /*}*/
 .image{
    margin-top:20px;
   }
    .text{
        margin-top: -170px;
        margin-left: 140px;
        width: 120px;
        height: 150px;
    }
    .name{
      margin-bottom: 30px;
        color: black;
        font-size: 16px;
}
    .author{
        font-size: 14px;
        color: grey;
        font-family: "Microsoft Yahei", arial,sans-serif;
    }
/*可以给定容器宽度限制，超出部分省略*/
.jianjie {
    width: 120px;
    height: 60px;
    color: grey;
    line-height: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    margin-top:20px;
    font-size: 14px;
    letter-spacing: 1px;
    font-family: "Microsoft Yahei", arial,sans-serif;
}
    .author a{
        text-decoration: none;
        outline: none;
        font-family: "Microsoft Yahei", arial,sans-serif;
        width: 30px;
        height: 22px;
        line-height: 22px;
        text-align: center;
        color: #fff;
        border-radius: 3px;
        float: right;
        background: #f26552;
        font-size: 12px;
        margin-top: -18px;
        margin-left: -10px;
    }
    a:hover{
        color: #f26552;
    }
    a{
        text-decoration: none;
        color: black;
    }
    .fenglei{
        width: 64%;
        height: 180px;
        margin: auto;
        line-height: 60px;
        text-align: left;
        border-radius: 5px;
        margin-top: 20px;
        background-color: white;
        color: grey;
        padding-left: 20px;
    }
    .con{
        width: 65%;
        height: 1100px;
        margin: auto;
        background-color: white;
        padding-top: 0px;
        padding-top:-50px  ;
        clear: both;
        margin-top: -60px;
    }
    .fenglei a{
        margin-left: 30px;
        margin-top: 50px;
        color: grey;
        font-size: 13px;
    }
    .fenglei a:hover{
        color:  #f26552;
    }
</style>
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


    <div class="fenglei">
        <a style=" text-decoration: none;"  class="tt">频道</a >
        <c:forEach items="${types}" var="type" varStatus="s"  begin="4"  end="6" >
          <a href="${pageContext.request.contextPath}/ShowBookServlet?id=${type.type_id}">${type.book_type}</a>
        </c:forEach>
        <br>
       <%--<p></p>--%>
        <a style=" text-decoration: none;" class="tt">类型</a >
        <c:forEach items="${types}" var="type" varStatus="s" begin="0"  end="3" >
            <a href="${pageContext.request.contextPath}/ShowBookServlet?id=${type.type_id}">${type.book_type}</a>
        </c:forEach>
        <c:forEach items="${types}" var="type" varStatus="s" begin="10" end="19">
            <a href="${pageContext.request.contextPath}/ShowBookServlet?id=${type.type_id}">${type.book_type}</a>
        </c:forEach>
        <br>
        <div class="div3">
            <ul class="n1_header2_dsg_biaoshi">
                <li style="list-style-type:none;" ><a style=" text-decoration: none;" class="tt" >其他</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="">全部</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="">免费</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="">特价</a ></li>
                <li style="list-style-type:none;"><a style=" text-decoration: none;" href="">VIP</a ></li>
            </ul>
        </div>
    </div>
<div class="san">
    <c:forEach items="${types}" var="type" varStatus="s" begin="7" end="9">
        <a href="${pageContext.request.contextPath}/ShowBookServlet?id=${type.type_id}">${type.book_type}</a>
    </c:forEach>
</div>
<div class="con">
<c:forEach items="${books}" var="book" varStatus="s" begin="0" end="11">
    <div class="shu">
     <div style="float:left;margin-left: 40px">
        <div class="image">
            <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
            <img  src="img/${book.book_picture}" style="width: 120px;height: 170px">
            </a>
        </div>
        <div class="text" >
            <div class="name">
                <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">${book.bookname}</a>
            </div>
            <hr style="color: gainsboro">
           <div class="author">${book.book_author}</div><span><a>试读</a></span>
            <div class="jianjie">${book.book_intro}</div>
        </div>
    </div>
    </div>
</c:forEach>
</div>
<div class="changepage">
     <span>
      <a style=" text-decoration: none;" class="up noClick"><i>上一页</i></a><a style=" text-decoration: none;" class="cur">1</a><a style=" text-decoration: none;" href="">2</a><a style=" text-decoration: none;" href="">3</a><a class="noBg">...</a><a style=" text-decoration: none;" href="" class="down"><i>下一页</i></a>
      </span>
</div>

<div class="v1_foot">
    <div class="aboutcompany">
        <p class="link">
            <a style=" text-decoration: none;" href="" target="_blank">联系我们</a>
            <a style=" text-decoration: none;" href="" target="_blank">商务合作</a>
            <a style=" text-decoration: none;" href="" target="_blank">关于我们</a>
            <a style=" text-decoration: none;" href="" target="_blank">法律声明</a>
        </p>
        <p>京ICP备11008516号<a style=" text-decoration: none;" href="" target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a style=" text-decoration: none;" href="" target="_blank">京ICP证090653号</a><a style=" text-decoration: none;" href=""  target="_blank" >京公网安备11010502030452</a></p>
        <p>2015 All Rights Reserved king科技股份有限公司 版权所有</p>
        <p>不良信息举报：jubao@king.com 举报电话：010-59845699</p>
    </div>
</div>
</body>
</html>
