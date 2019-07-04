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
    <script type="text/javascript">
        //用户名
        function trip() {
            document.getElementById("userNameSpan").innerHTML = "<font color='red'>用户名应该用数字或者字母组成！</font>"
        }

        function checkUsername() {
            var userName = document.getElementById("name").value;
            if(userName == "") {
                document.getElementById("userNameSpan").innerHTML = "<font color='red'>用户名不能为空！</font>"
            }
            else {
                document.getElementById("userNameSpan").innerHTML = "<font color='green'>用户名可用！</font>"
            }

        }
        //age
        function trip1() {
            document.getElementById("ageSpan").innerHTML = "<font color='red'>年龄不能为空！</font>"
        }
        function pdage() {
            var age = document.getElementById("age").value;
            if(age == "") {
                document.getElementById("ageSpan").innerHTML = "<font color='red'>年龄不能为空！</font>"
            }
            else {
                document.getElementById("ageSpan").innerHTML = "<font color='green'>年龄可用！</font>"
            }
        }
        //qq
        function trip2() {
            document.getElementById("qqSpan").innerHTML = "<font color='red'>qq不能为空！</font>"
        }
        function pdqq() {
            var qq = document.getElementById("qq").value;
            var reg = new RegExp("^[0-9]*$");
            if(!reg.test(qq)) {
                document.getElementById("qqSpan").innerHTML = "<font color='red'>qq格式不正确</font>"
            } else {
                document.getElementById("qqSpan").innerHTML = "<font color='green'>qq可用！</font>"
            }
        }
        //邮箱
        function trip3() {
            document.getElementById("emailSpan").innerHTML = "<font color='red'>邮箱不能为空！</font>"
        }
        function pdemail() {
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
            var email = document.getElementById("email").value;
            if(!reg.test(email)) {
                document.getElementById("emailSpan").innerHTML = "<font color='red'>邮箱格式不正确</font>"
            }
            else {
                document.getElementById("emailSpan").innerHTML = "<font color='green'>邮箱可用！</font>"
            }

        }
    </script>
</head>
<body>
<div class="container">
    <center><h3>添加联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input  type="text" class="form-control" onfocus="trip()" onblur="checkUsername()" id="name" name="name" placeholder="请输入姓名">
            <span id="userNameSpan"></span>
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="gender" value="男" checked="checked"/>男
            <input type="radio" name="gender" value="女"/>女
        </div>


        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text"  class="form-control" onfocus="trip1()" onblur="pdage()" id="age" name="age" placeholder="请输入年龄">
            <span id="ageSpan"></span>
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <input  type="text" id="address" class="form-control"   name="address" placeholder="请输入详细地址">
        </div>

        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text"   class="form-control" onfocus="trip2()" onblur="pdqq()" id="qq" name="qq" placeholder="请输入QQ号码"/>
            <span id="qqSpan"></span>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text"   class="form-control" onfocus="trip3()" onblur="pdemail()"  id="email" name="email" placeholder="请输入邮箱地址"/>
            <span id="emailSpan"></span>
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