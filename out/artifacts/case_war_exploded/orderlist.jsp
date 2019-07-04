<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>

    <style type="text/css">
        td, th {
            text-align: center;
        }
        /*body{*/
        /*height: 750px;*/
        /*!*background: radial-gradient(200% 100% at bottom center, #f7f7b6, #e96f92, #CD96CD, #B452CD);*!*/
        /*!*background: radial-gradient(220% 105% at top center, #B452CD 1%, #CD96CD 40%, #e96f92 65%, #f7f7b6 );*!*/
        /*background: radial-gradient(200% 100% at bottom center, #f7f7b6, #e96f92, #75517d, #1b2947);*/
        /*background: radial-gradient(220% 105% at top center, #1b2947 10%, #75517d 40%, #e96f92 65%, #f7f7b6);*/
        /*}*/
    </style>

    <script>
        function deleteUser(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/delBookServlet?id="+id;
            }
        }

        window.onload = function(){
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
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center; font-size: 30px;margin-bottom: 20px">订单信息列表</h3>
    <div style="float: left; margin-bottom: 20px">
        <form class="form-inline" action="${pageContext.request.contextPath}/findBookByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2" >书名</label>
                <input type="text" name="bookname" value="${condition.bookname[0]}" class="form-control" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputName3" >作者</label>
                <input type="text" name="book_author" value="${condition.book_author[0]}" class="form-control" id="exampleInputName3" >
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2" >出版社</label>
                <input type="text" name="publish" value="${condition.publish[0]}" class="form-control" id="exampleInputEmail2"  >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <%--<div style="float: right;margin: 5px;">--%>
    <%--&lt;%&ndash;${pageContext.request.contextPath}  绝对路径 &ndash;%&gt;--%>
    <%--<a class="btn btn-primary" href="${pageContext.request.contextPath}/bookadd.jsp">添加图书</a>--%>
    <%--<a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>--%>
    <%--</div>--%>
    <form id="form" action="${pageContext.request.contextPath}/" method="post">
        <table border="1" class="table table-bordered table-hover" style="margin-top: 20px">
            <tr class="success" style="margin-top: 20px">
                <%--<th><input type="checkbox" id="firstCb"></th>--%>
                <th>编号</th>
                <th style="width: 120px">书名</th>
                <th style="width: 100px">作者</th>
                <th style="width: 80px">出版社</th>
                <th style="width: 80px">价格</th>
                <th style="width: 500px">简介</th>
                <th style="width: 50px">图片</th>
                <th style="width: 50px">类型</th>
                <th style="width: 50px">用户 id</th>
                <th style="width: 50px">数量</th>
                <%--<th>操作</th>--%>
            </tr>
            <c:forEach items="${orders}" var="order" varStatus="s">
                <tr>
                        <%--<td><input type="checkbox" name="uid" value="${shop.id}"></td>--%>
                    <td>${s.count}</td>
                    <td>${order.bookname}</td>
                    <td>${order.book_author}</td>
                    <td>${order.publish}</td>
                    <td>${order.book_price}</td>
                    <td>${order.book_intro}</td>
                    <td>${order.book_picture}</td>
                    <td>${order.book_type}</td>
                    <td>${order.userid}</td>
                    <td>${order.num}</td>
                    <%--<td>--%>
                            <%--&lt;%&ndash;<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findBookServlet?id=${book.id}">修改</a>&nbsp;&ndash;%&gt;--%>
                        <%--<a class="btn btn-default btn-sm" href="javascript:deleteUser(${order.id});">删除</a>--%>
                    <%--</td>--%>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div>
        <%--<nav aria-label="Page navigation">--%>
        <%--<ul class="pagination">--%>
        <%--&lt;%&ndash;点击左侧按钮向前移动一页&ndash;%&gt;--%>
        <%--<c:if test="${pb.currentPage == 1}">--%>
        <%--<li class="disabled">--%>
        <%--</c:if>--%>

        <%--<c:if test="${pb.currentPage != 1}">--%>
        <%--<li>--%>
        <%--</c:if>--%>
        <%--<a href="${pageContext.request.contextPath}/findBookByPageServlet?currentPage=${pb.currentPage - 1}&rows=10&bookname=${condition.bookname[0]}&book_author=${condition.book_author[0]}&publish=${condition.publish[0]}" aria-label="Previous">--%>
        <%--<span aria-hidden="true">&laquo;</span>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--&lt;%&ndash;分页状态&ndash;%&gt;--%>
        <%--<c:forEach begin="1" end="${pb.totalPage}" var="i" >--%>
        <%--&lt;%&ndash;选中改变状态&ndash;%&gt;--%>
        <%--<c:if test="${pb.currentPage == i}">--%>
        <%--<li class="active">--%>
        <%--<a href="${pageContext.request.contextPath}/findBookByPageServlet?currentPage=${i}&rows=10&bookname=${condition.bookname[0]}&book_author=${condition.book_author[0]}&publish=${condition.publish[0]}">${i}</a>--%>
        <%--</li>--%>
        <%--</c:if>--%>
        <%--<c:if test="${pb.currentPage != i}">--%>
        <%--<li>--%>
        <%--<a href="${pageContext.request.contextPath}/findBookByPageServlet?currentPage=${i}&rows=10&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>--%>
        <%--</li>--%>
        <%--</c:if>--%>
        <%--</c:forEach>--%>


        <%--<li>--%>
        <%--<a href="${pageContext.request.contextPath}/findBookByPageServlet?currentPage=${pb.currentPage + 1}&rows=10&bookname=${condition.bookname[0]}&book_author=${condition.book_author[0]}&publish=${condition.publish[0]}" aria-label="Next">--%>
        <%--<span aria-hidden="true">&raquo;</span>--%>
        <%--</a>--%>
        <%--</li>--%>

        <%--<span style="font-size: 20px;margin-left: 5px;">--%>
        <%--共${pb.totalCount}条记录，共${pb.totalPage}页--%>
        <%--</span>--%>

        <%--</ul>--%>
        <%--</nav>--%>
    </div>
</div>
</body>
</html>
