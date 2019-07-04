<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改图书信息</h3>
    <form action="${pageContext.request.contextPath}/updateBookServlet" method="post">

        <!--  隐藏域 提交id-->
        <input type="hidden" name="id" value="${book.id}">

        <div class="form-group">
            <label for="name">书名：</label>
            <%--readonly="readonly" 姓名不能修改--%>
            <input type="text" class="form-control" id="name" name="bookname"  value="${book.bookname}" readonly="readonly"  />
        </div>

        <div class="form-group">
            <label for="name">作者：</label>
            <input type="text" class="form-control"  name="book_author"  value="${book.book_author}"  />
        </div>

        <div class="form-group">
            <label for="age">出版社：</label>
            <input type="text" class="form-control" value="${book.publish}" id="age"  name="publish"  />
        </div>

        <div class="form-group">
            <label for="age">价格：</label>
            <input type="text" class="form-control" value="${book.book_price}"  name="book_price"  />
        </div>

        <div class="form-group">
            <label for="qq">简介：</label>
            <input type="text" id="qq" class="form-control" value="${book.book_intro}" name="book_intro" />
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" id="email" class="form-control" value="${book.book_picture}" name="book_picture" />
        </div>
        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text"  class="form-control" value="${book.book_type}" name="book_type" />
        </div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
</html>