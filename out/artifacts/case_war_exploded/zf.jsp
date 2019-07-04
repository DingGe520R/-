<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>King 书城</title>
<link href="css/zf.css" rel="stylesheet" type="text/css" />
<link href="css/Fenlei.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="body">

    <div class="n1_header">
        <div class="n1_header_dyg">
            <a style=" text-decoration: none;" href=""><img src="img/logo.jpg" width="144" height="73" /></a >
            <div class="n1_header_deg">
                <ul class="n1_header_deg_biaoshi">
                    <li style="list-style-type:none;"><a style=" text-decoration: none;" href="">首页</a ></li>
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
                    <a style=" text-decoration: none;" href=""><span class="n1_login_beffor" id="unlogin_box" style="display: block;">登录</span></a>
                </div>
            </div>
        </div>
    </div>



<div id="aa">
<div class="a1"><img src="img/weixing.jpg" width="120" height="80" /></div>
<div class="a2">
  <h1>微信支付</h1>
</div>
</div>


<div id="middle"> <div class="m1">
		<img src="img/2.png" width="350" height="350" />
        </div>
				  <div class="m2"><div class="mm">
                  	<div class="m2-1">
                  	 <p>&nbsp;</p>
                  	  <p><img src="img/3.jpg" width="60" height="60"/>      	</div>
                    <div class="m2-2"><ul>
                      <p>&nbsp;</p>
                      <p>请使用微信“扫一扫”<br />
                      扫描二维码支付</p>
                    </p></ul></div>
      </div></div>                  

     <div id="kg"><li>完成支付没有提示？<img src="img/4.jpg" width="15" height="18" /></li>
    </div></div>
     
</div>
</div>


<div class="v1_foot" style="margin-top: -80px">
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
</div>
</body>
</html>
