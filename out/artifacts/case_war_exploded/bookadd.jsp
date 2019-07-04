<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- HTML5文档-->
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
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <center><h3>添加图书页面</h3></center>
    <form action="${pageContext.request.contextPath}/addBookServlet" method="post">
        <div class="form-group">
            <label for="name">书名：</label>
            <input  type="text" class="form-control"  id="name" name="bookname" placeholder="请输入书名">
            <span id="userNameSpan"></span>
        </div>

        <div class="form-group">
            <label>作者：</label>
            <input  type="text" class="form-control"   name="book_author" placeholder="请输入作者">
            <span ></span>
        </div>


        <div class="form-group">
            <label for="age">出版社：</label>
            <input type="text"  class="form-control"  name="publish" placeholder="请输入出版社">

        </div>

        <div class="form-group">
            <label for="age">价格：</label>
            <input type="text"  class="form-control"  id="age" name="book_price" placeholder="请输入价格">
        </div>

        <div class="form-group">
            <label for="qq">简介：</label>
            <input type="text"   class="form-control"  id="qq" name="book_intro" placeholder="请输入简介"/>
            <span id="qqSpan"></span>
        </div>

        <div class="form-group">
            <label for="email">图片：</label>
            <input type="text"   class="form-control"   id="email" name="book_picture" placeholder="请输入图片"/>
            <span id="emailSpan"></span>
        </div>
        <div class="form-group">
            <label for="email">类型：</label>
            <input type="text"   class="form-control"   name="book_type" placeholder="请输入图书类型"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回" />
        </div>
    </form>
</div>
</body>
</html>