<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/1
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>King 书城</title>
    <link rel="stylesheet" type="text/css" href="css/tjcg.css">
    <link rel="stylesheet"  href="css/Fenlei.css"/>
</head>

<body>
<div class="bj">
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
    <div class="tjgwccg" style="width: 47%;margin-left: 420px;text-align: center">
        <div class="tb">
            <img src="img/success.jpg" width="44" height="44">
        </div>
        <div class="zy">
            添加购物车成功！
        </div>
        <div class="jx">
            <div class="jxtb">
                <img src="img/gwctb.jpg" width="34" height="34">
            </div>
            <div class="jxzy"><a style=" text-decoration: none; font-size: 18px" href="${pageContext.request.contextPath}/ShowzhuyeServlet" >继续购物</a></div>
        </div>
        <div class="js">
            <div class="jstb">
                <img src="img/gwctb.jpg" width="34" height="34">
            </div>
            <div class="jszy"><a style=" text-decoration: none;  font-size: 18px" href="${pageContext.request.contextPath}/addShopServlet?id=${id}">去购物车结算</a></div>
        </div>
    </div>
    <input type="hidden" value="${id}" name="id">
    <div class="comm_box" style="margin-left: 230px">
        <div class="comm-box" >
            <div class="comm-header">
                <h3>相信你还喜欢</h3>
            </div>
            <div class="comm-content">
                <ul class="comm-content-list clearfix">
               <c:forEach items="${books}" var="book" varStatus="s"  begin="83"  end="87" >
                   <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                    <li style="list-style-type:none;">
                        <div class="comm-list-item">
                            <img src="img/${book.book_picture}" alt="">
                            <p style="display:block;height: 100px" >${book.bookname}</p>
                            <div class="comm-list-cont">
                                <div class="comm-list-text">
                                    <p>${book.book_intro}</p>
                                    <div>
                                        <a style=" text-decoration: none;" href="" class="comm-go-home">加入购物车</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                   </a>
               </c:forEach>

                </ul>
            </div>
        </div>
    </div>

    <div class="v1_foot"style="margin-top: 700px;margin-left: 40px">
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
</div>
</body>
</html>

