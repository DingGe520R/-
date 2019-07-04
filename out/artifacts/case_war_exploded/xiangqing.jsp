<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/14
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>King 书城</title>
    <%--<link href="css/XiangQing.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="css/xiangqing.css">
    <link rel="stylesheet"  href="css/Fenlei.css"/>
    <style type="text/css">
        body{
            background-color: gainsboro;
        }
        .xiangqing{
            width: 1000px;
            height: 350px;
            background: #fff;
            clear: both;
            margin: auto;
            position: relative;
            top:50px;
        }
        .bookl{
            width: 270px;
            float: left;
            text-align: center;
            margin-top: 60px;
            margin-left: -15px;
        }
        .bookl img{
            box-shadow: 3px 3px 3px grey;
        }
        .xian{
            height: 340px;
            float: left;
            border-right: 1px solid gainsboro;
        }
        .bookr{
            width: 700px;
            float: left;
        }
        .bookrtop{
           margin-top: 20px;
            height: 80px;
            width: 700px;
            border-bottom: 1px solid gainsboro;
        }
        .name{
            height: 50px;
            margin-left: 20px;
            font-size: 22px;
        }
        .jianshao{
           position: relative;
            top: -30px;
        }
        .jianshao span{
            font-size: 13px;
            margin-left: 20px;
            color: grey;
        }
        .bookrcon{
            margin-top: 20px;
            height: 90px;
            width: 700px;
            border-bottom: 1px solid gainsboro;
        }
        .jiage{
            font-size: 13px;
            margin-left: 20px;
            height: 50px;
        }
.green{
    float: left;
    margin-left: 20px;
    margin-top: -20px;
    background-color:#8bc34a;
    width:100px ;
    height: 30px;
    border-radius: 5px;
    text-align: center;
    line-height: 30px;
    color: white;
    font-size: 14px;
}
        .red{
            float: left;
            margin-left: 30px;
            margin-top: -20px;
            background-color:#f26552;
            width:90px ;
            height: 30px;
            border-radius: 5px;
            text-align: center;
            line-height: 30px;
            color: white;
            font-size: 14px;
        }
        .bookrbot{
            margin-left: 20px;
            width: 700px;
            height: 80px;
            color: grey;
            line-height: 25px;
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
        a:hover{
            color: #f26552;
        }
        .go{
            color: white;
        }
        .go:hover{
            color: white;
           font-size: 16px;
        }
        a{
            text-decoration: none;
            color: black;
        }

    </style>
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

<div class="xiangqing" >
    <div class="bookl">
        <img src="img/${book.book_picture}">
    </div>
    <div class="xian"></div>
    <div class="bookr">
        <div class="bookrtop">
            <p class="name"><a>${book.bookname}</a></p>
            <p class="jianshao">
                <span>作者：${book.book_author}</span>
                <span>出版社：${book.publish}</span>
            </p>
        </div>
        <div class="bookrcon">
            <p class="jiage">价格：${book.book_price}</p>
            <p class="gogo">
             <div class="green">
                <a href="${pageContext.request.contextPath}/TjcgServlet?id=${book.id}" class="go">加入购物车</a>
             </div>
                <div class="red"> <a class="go" href="${pageContext.request.contextPath}/zf.jsp">直接购买</a></div>
            </p>
        </div>
        <div class="bookrbot">
            ${book.book_intro}
        </div>
        </div>
    </div>
</div>

    <div class="sqCon" style="margin-top: 100px;margin-left:260px">
    <div class="bookCir">
    <div class="title">
    <p> <span class="shuquan">书圈</span> <span class="line">|</span> <span class="rs">共999人，142条</span> </p>
    <a style=" text-decoration: none;" href="javascript:;" class="comBtn" btn="topic_add" data-has_fu_text="0" data-cid="book_11814090"> <span>&nbsp;我来说两句</span></a> </div>
    <div class="allCom" style="display: block;">
    <ul>
    <li> <span class="headImg"> <img src="img/s1.jpg" width="42" height="42"></span>
    <div class="allCom">
    <div class="ComMan">
    <p>*诱惑*</p>
    <span>6天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">好</a></span> </span> </div>
    <div class="attend"> <a href="javascript:;" btn="like"
    data-num="0"
    data-liked="0"
    data-tid="151282232"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> <span class="up" btn="content_hide_more" style="display: none;"><i>收起</i><s></s></span> </div>
    </div>
    </li>
    <li> <span class="headImg"> <img src="img/s2.jpg" width="42" height="42"> </span>
    <div class="allCom">
    <div class="ComMan">
    <p>春枝花野</p>
    <span>6天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">意犹未尽</a></span> </span> </div>
    <div class="attend"> <a href="javascript:;" btn="like"
    data-num="1"
    data-liked="0"
    data-tid="151276906"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> <span class="up" btn="content_hide_more" style="display: none;"><i>收起</i><s></s></span> </div>
    </div>
    </li>
    <li> <span class="headImg"> <img src="img/s3.jpg" width="42" height="42"> </span>
    <div class="allCom">
    <div class="ComMan">
    <p>快乐小宝贝love</p>
    <span>10天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xxx.png"> <img src="img/xxx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">很好看，令人羡慕的爱情</a></span> </span> </div>
    <div class="attend"> <a href="javascript:;" btn="like"
    data-num="0"
    data-liked="0"
    data-tid="151046360"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> <span class="up" btn="content_hide_more" style="display: none;"><i>收起</i><s></s></span> </div>
    </div>
    </li>
    <li> <span class="headImg"> <img src="img/s4.jpg" width="42" height="42"> </span>
    <div class="allCom">
    <div class="ComMan">
    <p>i12****7691</p>
    <span>12天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xxx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">没有别的小说那种玛丽苏，很平淡，也很感动</a></span> </span> </div>
    <div class="attend"> <a href="javascript:;" btn="like"
    data-num="0"
    data-liked="0"
    data-tid="150949488"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> <span class="up" btn="content_hide_more" style="display: none;"><i>收起</i><s></s></span> </div>
    </div>
    </li>
    <li> <span class="headImg"> <img src="img/s5.jpg" width="42" height="42"> </span>
    <div class="allCom">
    <div class="ComMan">
    <p>PEI</p>
    <span>13天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">太唯美了，</a></span> </span> </div>
    <div class="attend"> <a style=" text-decoration: none;" href="javascript:;" btn="like"
    data-num="0"
    data-liked="0"
    data-tid="150902949"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> <span class="up" btn="content_hide_more" style="display: none;"><i>收起</i><s></s></span> </div>
    </div>
    </li>
    <li> <span class="headImg"> <img src="img/s6.jpg" width="42" height="42"> </span>
    <div class="allCom">
    <div class="ComMan">
    <p>放肆i</p>
    <span>15天前</span> </div>
    <div class="ComStar"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xx.png"> <img src="img/xxx.png"> </div>
    <div class="comTxt" > <span> <s>书评</s> <span><a style=" text-decoration: none;" href="">我很羡慕这样的爱情，结局也挺美好的</a></span> </span> </div>
    <div class="attend"> <a href="javascript:;" btn="like"
    data-num="0"
    data-liked="0"
    data-tid="150814991"
    data-cid="book_11814090"
    class="zan click">
    <!--<s class="zan"></s>-->
    <img src="img/zan.gif"> <i>&nbsp;</i> </a> <span class="line"></span> <a style=" text-decoration: none;" href=""> <img src="img/hf.gif"> <i>&nbsp;</i> </a> </div>
    </div>
    </li>
    </ul>
    </div>
    </div>
    <div class="conR">
    <div class="seen">
    <div class="seeTit"> <span class="title">看过的人还看</span></div>
    </div>
    <div class="seeWrap">
    <div class="s1"><a style=" text-decoration: none;" href=""><img src="img/k1.jpg" width="110" height="140"></a></div>
    <div class="s2"><a style=" text-decoration: none;" href="">云边有个小卖部</a></div>
    <div class="s3"><span>张嘉佳</span></div>
    <div class="s4">
    <div class="s41"><img src="img/eye.jpg" width="17" height="19"></div>
    <div class="s42">450</div>
    </div>
    </div>
    <div class="seeWrap1">
    <div class="e1"><a style=" text-decoration: none;" href=""><img src="img/k2.jpg" width="110" height="140"></a></div>
    <div class="e2"><a style=" text-decoration: none;" href="">蓝海战略2</a></div>
    <div class="e3"><span>W.钱.金</span></div>
    <div class="e4">
    <div class="e41"><img src="img/eye.jpg" width="17" height="19"></div>
    <div class="e42">500</div>
    </div>
    </div>
    <div class="seeWrap2">
    <div class="n1"><a style=" text-decoration: none;" href=""><img src="img/k3.jpg" width="110" height="140"></a></div>
    <div class="n2"><a style=" text-decoration: none;" href="">金庸作品集</a></div>
    <div class="n3"><span>金庸</span></div>
    <div class="n4">
    <div class="n41"><img src="img/eye.jpg" width="17" height="19"></div>
    <div class="n42">780</div>
    </div>
    </div>
    <div class="seeWrap3">
    <div class="g1"><a style=" text-decoration: none;" href=""><img src="img/k4.jpg" width="110" height="140"></a></div>
    <div class="g2"><a style=" text-decoration: none;" href="">漫画中国史</a></div>
    <div class="g3"><span>陈磊</span></div>
    <div class="g4">
    <div class="g41"><img src="img/eye.jpg" width="17" height="19"></div>
    <div class="g42">999</div>
    </div>
    </div>
    </div>
    <div class="tlrx">同类热销榜</div>
    <div class="container">
    <div class="boxa box1">
    <div class="name">
    <span style="font-size: 13px">以婚之名，赠尔深情</span>
    <p style="font-size: 12px">东风自在</p>
    </div>
    <div class="m1"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>689</p>
    </div>
    </div>
    <div class="boxa box2">
    <div class="name">
    <span style="font-size: 13px">簪中录合集</span>
    <p style="font-size: 12px">侧侧轻寒</p>
    </div>
    <div class="m2"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>924</p>
    </div>
    </div>
    <div class="boxa box3">
    <div class="name">
    <span style="font-size: 13px">岳麓书院浪漫史</span>
    <p style="font-size: 12px">商夏周</p>
    </div>
    <div class="m3"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>800</p>
    </div>
    </div>
    <div class="boxa box4">
    <div class="name">
    <span style="font-size: 13px">小娇妻</span>
    <p style="font-size: 12px">洛心辰</p>
    </div>
    <div class="m4"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>528</p>
    </div>
    </div>
    <div class="boxa box5">
    <div class="name">
    <span style="font-size: 13px">双阙</span>
    <p style="font-size: 12px">海清拿天鹅</p>
    </div>
    <div class="m5"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>856</p>
    </div>
    </div>
    <div class="boxa box6">
    <div class="name">
    <span style="font-size: 13px">以他之姓</span>
    <p style="font-size: 12px">旧时绵绵</p>
    </div>
    <div class="m6"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>458</p>
    </div>
    </div>
    <div class="boxa box7">
    <div class="name">
    <span style="font-size: 13px">少年的你</span>
    <p style="font-size: 12px">玖月晞</p>
    </div>
    <div class="m7"> <img src="img/eye.jpg" width="20px" height="18px"/>
    <p>666</p>
    </div>
    </div>
    </div>
    </div>


    <div class="v1_foot" style="margin-top: 1300px">
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
