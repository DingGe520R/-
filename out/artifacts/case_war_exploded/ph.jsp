<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>King 书城</title>
<link rel="stylesheet" type="text/css" href="css/ph.css"/>
<link rel="stylesheet" type="text/css" href="css/Fenlei.css"/>
</head>

<body>
<div id="page">

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
 
<div class="content">
		<div class="content_top">
			<span>首页 > 分类 > 排行</span>
		</div>

	<div class="content_bottom">
			<h1>书城畅销</h1>
		<hr/>

			 <div class="productlist">
				 <c:forEach items="${books}" var="book" varStatus="s"  begin="0"  end="11" >
			     <div class="book">
						  <div class="bookimg">
							  <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                          <img src="img/${book.book_picture}">
							  </a>
						  </div>
						  <div class="bookIntr">
							<span>${book.bookname}</span><br/>
							<span>售价:${book.book_price}</span>
					      </div>
				      </div>
				 </c:forEach>

				      <div class="clear"></div>
					   <%--<div class="jumpPage">--%>
							<%--<a href="#">上一页</a>--%>
							<%--<a class="current" href="#">1</a>--%>
							<%--<a href="#">2</a>--%>
							<%--<a href="#">3</a>--%>
							<%--<a href="#">4</a>--%>
							<%--<a href="#">5</a>--%>
							<%--<a href="#">6</a>--%>
							<%--<a href="#">7</a>--%>
							<%--<a href="#">下一页</a>--%>
					  <%--</div>--%>
					</div>

		  </div>
	</div>
  </div>
 <div class="content">
		<div class="content_top">
			<span>首页 > 分类 > 排行</span>
		</div>
		   
	<div class="content_bottom">
			<h1>新书上榜</h1>
		<hr/>
 
			 <div class="productlist">

				 <c:forEach items="${books}" var="book" varStatus="s"  begin="0"  end="11" >
					 <div class="book">
						 <div class="bookimg">
							 <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
							 <img src="img/${book.book_picture}">
							 </a>
						 </div>
						 <div class="bookIntr">
							 <span>${book.bookname}</span><br/>
							 <span>售价:${book.book_price}</span>
						 </div>
					 </div>
				 </c:forEach>
 

                      
 <div class="clear"></div>
					   <%--<div class="jumpPage">--%>
							<%--<a href="#">上一页</a>--%>
							<%--<a class="current" href="#">1</a>--%>
							<%--<a href="#">2</a>--%>
							<%--<a href="#">3</a>--%>
							<%--<a href="#">4</a>--%>
							<%--<a href="#">5</a>--%>
							<%--<a href="#">6</a>--%>
							<%--<a href="#">7</a>--%>
							<%--<a href="#">下一页</a>--%>
					  <%--</div>--%>
					</div>
					
		  </div>
	</div>
  </div>

<div class="v1_foot" style="margin-top: 50px;">
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