<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/1
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>King 书城</title>
    <link href="css/libiao.css" type="text/css" rel="stylesheet">
</head>

<body>
<div class="bj">
    <div class="n1_header">
        <div class="n1_header_dyg">
            <a style=" text-decoration: none;margin-left: -150px" href=""><img src="img/logo.jpg" width="144" height="73" /></a >
            <div class="n1_header_deg" style="margin-left: 300px">
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
    <section class="main_box" style="margin-left: -170px;width: 90%">
        <div class="box" style="width: 100%">
            <ul>
               <c:forEach items="${books}" var="book" varStatus="s"  begin="52"  end="56" >
                   <li class="on" >
                       <a href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                           <h3>${book.bookname}</h3>
                           <p>作者：${book.book_author}</p>
                           <img src="img/${book.book_picture}">
                       </a>
                   </li>
               </c:forEach>

                <div style="clear: both"></div>
            </ul>
        </div>
    </section>
    <script src="js/jquery-1.12.1.min.js"></script>
    <script>
        $(".box ul li").hover(function(){
            $(this).addClass('on').siblings().removeClass('on');
        });
    </script>
    <div class="c" style="width:10%;margin:auto">出版图书</div>
    <div class="d1" style="width:25%;margin:auto;margin-top: 20px;">
        <ul>
            <li class="d2">小说</li>
            <li class="d2">励志图书</li>
            <li class="d2">文学</li>
            <li class="d2">经济管理</li>
            <li class="d2">更多</li>
        </ul>
    </div>
    <div class="e" style="width:75%;margin: auto">
        <div class="e1">
            <div class="e2">还不过来抱抱我</div>
            <div class="e3">作者：冬三儿</div>
            <div class="e4">校园+重生+逆袭的故事。甜！宠！爽！ 职场白领狄小蓝&商界奇才邵钦扬 一觉醒来回到17岁？看问题少女如何重生逆袭，追到男神！</div>
            <div class="e5">
                <img src="img/d1.jpg" width="150px">
            </div>
        </div>
        <div class="f">
            <div class="f1">
                <c:forEach items="${books}" var="book" varStatus="s"  begin="46"  end="46" >
                    <a  href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                        <img src="img/${book.book_picture}" width="115px">
                        <p>${book.bookname}</p>
                    </a>
                </c:forEach>
            </div>
            <div class="f2">
                <c:forEach items="${books}" var="book" varStatus="s"  begin="47"  end="47" >
                    <a  href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                        <img src="img/${book.book_picture}" width="115px">
                        <p>${book.bookname}</p>
                    </a>
                </c:forEach>
            </div>

            <div class="f4">
                <c:forEach items="${books}" var="book" varStatus="s"  begin="48"  end="48" >
                    <a  href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                        <img src="img/${book.book_picture}" width="115px">
                        <p>${book.bookname}</p>
                    </a>
                </c:forEach>
            </div>
            <div class="f5">
                <c:forEach items="${books}" var="book" varStatus="s"  begin="44"  end="44" >
                    <a  href="${pageContext.request.contextPath}/findXiangQingSelect?id=${book.id}">
                        <img src="img/${book.book_picture}" width="115px"><br> &nbsp; &nbsp;
                        <p>${book.bookname}</p>
                    </a>
                </c:forEach>
            </div>

            <div style="margin-top: 20px;font-size: 24px;margin-left: 100px;padding-left: 20px">
                &nbsp; &nbsp; &nbsp;畅销榜</div>
            <div class="container" style="margin-top: 10px">
                &nbsp; &nbsp; &nbsp;
                <div class="boxa box1">
                    <div class="name" >
                        <h4>我不</h4>
                        <h5>大冰</h5>
                    </div>
                    <div class="m1" style="display: block">
                        <img src="img/eyes.jpg" width="20px" height="18px"/>
                        <p>689</p>
                    </div>
                </div>
                <div class="boxa box2">
                    <div class="name">
                        <h4>边城</h4>
                        <h5>沈从文</h5>
                    </div>
                    <div class="m2">
                        <img src="img/eyes.jpg" width="20px" height="18px"/>
                        <p>924</p>
                    </div>
                </div>
                <div class="boxa box3">
                    <div class="name">
                        <h4>我将喜欢告诉了风</h4>
                        <h5>唐之风</h5>
                    </div>
                    <div class="m3">
                        <img src="img/eyes.jpg" width="20px" height="18px"/>
                        <p>856</p>
                    </div>
                </div>
                <div class="boxa box4">
                    <div class="name">
                        <h4>东宫</h4>
                        <h5>匪我思存</h5>
                    </div>
                    <div class="m4">
                        <img src="img/eyes.jpg" width="20px" height="18px"/>
                        <p>528</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="conBigTitle" style="width:10%;margin:auto;margin-top: 30px">精选圈子</div>
    <div class="jxk" style="width:75%;margin:auto;margin-left: 186px;margin-top: 30px">
        <div class="jxk_dyg">
            <div class="jxk_dyg_1">
                <div class="dyg1zy">
                    <a href=""><img src="img/jx1.jpg" width="70" height="70"></a>
                </div>
                <div class="deg1zy">
                    <h2><a href="">古代言情</a></h2>
                </div>
                <div class="dsg1zy">
                    <p>相望古言，相聚古言，古言–我们的家园</p>
                </div>
                <div class="dwg1zy">
                    <s class="fans"><img src="img/xtb1.jpg" width="32" height="28"></s>
                    <span style="left: 41px; top: 3px;">32w+</span>
                    <s class="cards"><img src="img/xtb2.jpg" width="32" height="28"></s>
                    <span>34207</span>
                </div>
            </div>
            <div class="jxk_dyg_2">
                <div class="dyg2zy">
                    <a href=""><img src="img/jx2.jpg" width="70" height="70"></a>
                </div>
                <div class="deg2zy">
                    <h2><a href="">现代言情</a></h2>
                </div>
                <div class="dsg2zy">
                    <p>Hey, 你的少女心♥掉在这里了...</p>
                </div>
                <div class="dwg2zy">
                    <s class="fans"><img src="img/xtb1.jpg" width="32" height="28"></s>
                    <span style="left: 41px; top: 3px;">19w+</span>
                    <s class="cards"><img src="img/xtb2.jpg" width="32" height="28"></s>
                    <span>15492</span>
                </div>
            </div>
            <div class="jxk_dyg_3">
                <div class="dyg3zy">
                    <a href=""><img src="img/jx3.jpg" width="70" height="70"></a>
                </div>
                <div class="deg3zy">
                    <h2><a href="">青春校园</a></h2>
                </div>
                <div class="dsg3zy">
                    <p>青嶂青溪直复斜，春雪空濛帘外寒；校量...</p>
                </div>
                <div class="dwg3zy">
                    <s class="fans"><img src="img/xtb1.jpg" width="32" height="28"></s>
                    <span style="left: 41px; top: 3px;">13w+</span>
                    <s class="cards"><img src="img/xtb2.jpg" width="32" height="28"></s>
                    <span>17319</span>
                </div>
            </div>
        </div>
        <div class="jxk_deg">
            <div class="zwbt"><img src="img/jx9.png" width="211" height="35"></div>
            <div class="jl">
                <div class="jl1">
                    <a href=""><img src="img/jx4.jpg" width="70" height="70"></a>
                    <h2><a href="">情感</a></h2>
                    <p>0部作品</p>
                </div>
                <div class="jl2">
                    <a href=""><img src="img/jx5.jpg" width="70" height="70"></a>
                    <h2><a href="">科幻</a></h2>
                    <p>0部作品</p>
                </div>
                <div class="jl3">
                    <a href=""><img src="img/jx6.jpg" width="70" height="70"></a>
                    <h2><a href="">悬疑推理</a></h2>
                    <p>0部作品</p>
                </div>
                <div class="jl4">
                    <a href=""><img src="img/jx7.jpg" width="70" height="70"></a>
                    <h2><a href="">武侠</a></h2>
                    <p>0部作品</p>
                </div>
                <div class="jl5">
                    <a href=""><img src="img/jx8.jpg" width="70" height="70"></a>
                    <h2><a href="">文学</a></h2>
                    <p>0部作品</p>
                </div>
            </div>
        </div>
    </div>
    <div class="v1_foot" style="margin-left: 430px">
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

