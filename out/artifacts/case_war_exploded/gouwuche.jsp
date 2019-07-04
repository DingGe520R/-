<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/16
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>King 书城</title>
</head>
<style type="text/css">
    .gouwu{
        width: 1000px;
        height:220px;
        background-color: #FCFCFC;
        margin: auto;
        margin-top: 30px;
    }
    .img{
        float: left;
        margin-left: 20px;
        margin-top: 30px;
        background-color: white;
        box-shadow: 3px 3px 3px grey;
    }
    .xian{
        float: left;
        width: 800px;
        margin-left: 20px;
        border-top: 1px solid #8bc34a;
        margin-top: 60px;
    }
    .name{
        float: left;
        margin-left: 30px;
        margin-top:30px;
        width: 150px;
        height: 30px;
    }
    .jiage{
        float: left;
        margin-left: 200px;
        margin-top:30px;
        color: grey;
        font-size: 14px;
    }
    .count{
        font-size: 18px;
        float: left;
        margin-left: 70px;
        margin-top:30px;
        width: 80px;
        height: 24px;
        border: solid 1px gainsboro;
        text-align: center;
    }
    .count span{
        margin: auto;
        background-color: white;
        border-left: solid 1px gainsboro;
        border-right: solid 1px gainsboro;
        width:28px;
        height: 24px;
        display:inline-block;
    }
    .price{
        float: left;
        margin-left: 70px;
        margin-top:30px;
        font-size: 14px;
    }
    .delete{
        float: left;
        margin-left: 60px;
        margin-top:30px;
        font-size: 14px;
        color: #f26552;
    }
    .delete a:hover{
        font-size: 18px;
        color: red;
        cursor:pointer;
    }
    a:hover{
        cursor:pointer;
    }
    .jiesuan{
        width: 1000px;
        height:100px;
        background-color: #FCFCFC;
        margin: auto;
        margin-top: 50px;
        line-height: 100px;
    }
    .zongshu{
        float: left;
        margin-left: 70px;
    }
    .zongshu span{
        color: red;
    }
    .zongjia{
        float: left;
        width: 230px;
        height: 30px;
        margin-left:240px;
    }
    .zongjia span{
        font-size: 21px;
        color: red;
    }
    .fukuan{
        float: left;
        margin-left:50px;
        width: 120px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        margin-top: 30px;
        border: solid 1px #f26552;
        font-size: 20px;
        background-color: #f26552;
        color: white;
    }
   .delete a{
        color: #f26552;
    }
   a{
       text-decoration: none;
   }
    .xuan{
        float: left;
        margin-top: 100px;
        margin-left: 20px;
    }
    .tops{
        width: 1000px;
        margin: auto;
        color: grey;
        margin-top: 30px;
    }
    .qx{
        margin-left: 10px;
    }
    .sp{
        margin-left:150px;
    }
    .dj{
        margin-left:260px;
    }
    .sl{
        margin-left:50px;
    }
    .je{
        margin-left: 100px;
    }
    .cz{
        margin-left: 30px;
    }
    .quanxuan{
        float: left;
        margin-top: 45px;
        margin-left: 10px;
    }
    .allxuan{
        float: left;
        margin-left: 10px;
        color: grey;
    }
    .pil{
        float: left;
        margin-left: 20px;
        color: grey;
    }
    .pil:hover{
        color:#f26552 ;
    }
</style>
<link rel="stylesheet" href="css/gouwuche.css">
<link rel="stylesheet"  href="css/Fenlei.css"/>
<script type="text/javascript">
    //点击减少按钮
    function less(id) {
        //点击减一
        var x1 = document.getElementById("num"+id);
        var shu=parseInt(x1.innerHTML);
        if(shu==1)return;
        var cha=shu;
        shu--;
        cha= cha-shu;
        x1.innerText=shu;
        //计算总数
        var totalNum=document.getElementById("totalNum");
        var allcount=parseInt(totalNum.innerHTML);
        totalNum.innerText=allcount-cha;
        //计算单价
        var x2=document.getElementById("danjia"+id) //获取单价
        var price=document.getElementById("jiage"+id)  //每本书的总价
        var danjia=parseFloat(x2.innerHTML);//单价
        var prices=parseFloat(price.innerHTML);//总价
        var j=prices;
        danjia=danjia.toFixed(2);
        var sum=shu*danjia; //计算每本书总价格
        sum=sum.toFixed(2);
        price.innerText = sum;
        var totalPrice=document.getElementById("totalPrice");//全部书总价
        var allprice=parseFloat(totalPrice.innerHTML);//转为浮点型
        //计算总价
        var he=parseFloat(allprice-(cha*danjia));
        he=he.toFixed(2);
        totalPrice.innerText=he;
    }
    //点击增加按钮
    function  add(id) {
        //点击加一
        var x1 = document.getElementById("num"+id);
        var shu=parseInt(x1.innerHTML);
        var cha=shu;
        shu++;
        cha= shu-cha;
        x1.innerText=shu;
        //计算总数
        var totalNum=document.getElementById("totalNum");
        var allcount=parseInt(totalNum.innerHTML);
        totalNum.innerText=cha+allcount;
        //计算单价
        var x2=document.getElementById("danjia"+id) //获取单价
        var price=document.getElementById("jiage"+id)  //每本书的总价
        var danjia=parseFloat(x2.innerHTML);//单价
        var prices=parseFloat(price.innerHTML);//总价
        var j=prices;
        danjia=danjia.toFixed(2);
        var sum=shu*danjia; //计算每本书总价格
        sum=sum.toFixed(2);
        price.innerText = sum;
        var totalPrice=document.getElementById("totalPrice");//全部书总价
        var allprice=parseFloat(totalPrice.innerHTML);//转为浮点型
        //计算总价
        var he=parseFloat((sum-j)+allprice);
        he=he.toFixed(2);
        totalPrice.innerText=he;
    }
    function dianji() {
        confirm("确实要删除吗？")
    }
    //单选框事件
    function  check(id) {
        var check=document.getElementById("check"+id);
        if(check.checked==false) {
            var x1 = document.getElementById("num" + id);//获取每本书数量
            if (x1 == 1) return;
            var shu = parseInt(x1.innerHTML);
            var totalNum = document.getElementById("totalNum");//获取总数
            var allcount = parseInt(totalNum.innerHTML);
            totalNum.innerText = allcount - shu;
            var price = document.getElementById("jiage" + id)  //每本书的总价
            var price = parseFloat(price.innerHTML);
            var totalPrice = document.getElementById("totalPrice");//全部书总价
            var allprice = parseFloat(totalPrice.innerHTML);
            var he=parseFloat(allprice - price);
            he=he.toFixed(2);
            totalPrice.innerText =he ;
        }
        else {
            var x1 = document.getElementById("num" + id);//获取每本书数量
            // if (x1 == 1) return;
            var shu = parseInt(x1.innerHTML);
            var totalNum = document.getElementById("totalNum");//获取总数
            var allcount = parseInt(totalNum.innerHTML);
            totalNum.innerText = allcount+shu;

            var price = document.getElementById("jiage" + id)  //每本书的总价
            var prices = parseFloat(price.innerHTML);
            var totalPrice = document.getElementById("totalPrice");//全部书总价
            var all = parseFloat(totalPrice.innerHTML);
            var he=parseFloat(all+prices);
            he=he.toFixed(2);
            totalPrice.innerText =he ;
        }
    }
    window.onload = function(){
        //显示总数
     var num=document.getElementsByName("nums");
     var allcount=0;
     for(var i=0;i<num.length;i++){
         var shu=parseInt(num[i].innerHTML);
         allcount+=shu;
     }
     var totalNum=document.getElementById("totalNum");//获取总数
     totalNum.innerText=allcount;
         //显示总价
        var price=document.getElementsByName("price");
        var allprice=0;
        for(var i=0;i<price.length;i++){
            var shu=parseFloat(price[i].innerHTML);
            allprice+=shu;
        }
        allprice=allprice.toFixed(2);
        var totalPrice=document.getElementById("totalPrice");//全部书总价
        totalPrice.innerText=allprice;

        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function(){
            if(confirm("您确定要删除选中条目吗？")){

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    if(cbs[i].checked){
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if(flag){//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        }
        /**
         *点击全选事件
         */
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function(){
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("uid");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;

            }
        }
        document.getElementById("firstCbs").onclick = function(){
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("uid");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;

            }
        }

    }
    /**
     * 去结算
     */
    function fukuan() {
        //获取所有的物品
        var cbs = document.getElementsByName("uid");
        var num =[];
        var ids=[];
        for (var i = 0; i < cbs.length; i++) {
            var count = {};//在里面定义对象
            count= document.getElementById("num"+cbs[i].value).innerHTML;
            var id={};
            id=cbs[i].value;
            num.push(count);
            ids.push(id);
        }
        location.href="${pageContext.request.contextPath}/addOrderServlet?num="+num+"&ids="+ids;
    }
</script>
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

<form id="form" action="${pageContext.request.contextPath}/delSelectShopServlet" method="post">
    <div class="tops">
        <input type="checkbox" class="qx"  id="firstCb" checked="checked"> 全选
        <span class="sp">商品信息</span>
        <span class="dj">单价（元）</span>
        <span class="sl">数量</span>
        <span class="je">金额（元）</span>
        <span class="cz">操作</span>
    </div>
    <c:forEach items="${shops}" var="shop" varStatus="s">
        <div class="gouwu">
            <input type="checkbox" name="uid" value="${shop.id}" id="check${shop.id}" checked="checked" class="xuan" onclick="check(${shop.id})">
            <div class="img">
                <img src="img/${shop.book_picture}" style="width: 120px;height: 150px;">
            </div>
            <div class="xian"></div>
            <div class="name">${shop.bookname}</div>
            <div class="jiage">￥<span id="danjia${shop.id}">${shop.book_price}</span></div>
            <div class="count">
                <a class="sub" name="sub" onclick="less(${shop.id})">-</a>
                <span name="nums"  id="num${shop.id}" >1</span>
                <a class="add" name="add" onclick="add(${shop.id})" >+</a>
            </div>
            <div class="price">￥<span id="jiage${shop.id}" name="price">${shop.book_price}</span></div>
            <div class="delete">
                <a href="${pageContext.request.contextPath}/delShopSelect?id=${shop.id}" onclick="dianji()">删除</a>
            </div>
        </div>
    </c:forEach>
    <div class="jiesuan">
        <input type="checkbox" class="quanxuan"  id="firstCbs" checked="checked"> <span class="allxuan" >全选</span>
        <a class="pil" href="javascript:void(0);" id="delSelected">批量删除</a>
        <div class="zongshu">已选择&nbsp;&nbsp;<span id="totalNum">0</span>&nbsp;&nbsp;件商品</div>
        <div class="zongjia">总计：<span>¥&nbsp;</span><span id="totalPrice">0</span></div>
        <div class="fukuan" onclick="fukuan()" >去结算</div>
    </div>
</form>

<div class="dwug">
    <div class="dwug_v1_foot">
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
