<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/18
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script src="js/index1.js"></script>
    <script type="text/javascript">
        //用户名
        function trip() {
            document.getElementById("userNameSpan").innerHTML = "<font color='red'>*</font>"
        }

        function checkUsername() {

            var userName = document.getElementById("name").value;

            if(userName == "") {
                document.getElementById("userNameSpan").innerHTML = "<font color='red'>x</font>"
            }
            else {
                document.getElementById("userNameSpan").innerHTML = "<font color='green'>✔</font>"
            }

        }
        //age
        function trip1() {
            document.getElementById("ageSpan").innerHTML = "<font color='red'>*</font>"
        }
        function pdage() {
            var age = document.getElementById("age").value;
            if(age == "") {
                document.getElementById("ageSpan").innerHTML = "<font color='red'>x</font>"
            }
            else {
                document.getElementById("ageSpan").innerHTML = "<font color='green'>✔</font>"
            }
        }
        //qq
        function trip2() {
            document.getElementById("qqSpan").innerHTML = "<font color='red'>*</font>"
        }
        function pdqq() {
            var qq = document.getElementById("qq").value;
            // var reg = new RegExp("^[0-9]*$");
            if(qq=="") {
                document.getElementById("qqSpan").innerHTML = "<font color='red'>*</font>"
            }
            else {
                document.getElementById("qqSpan").innerHTML = "<font color='green'>✔</font>"
            }
        }
        //邮箱
        function trip3() {
            document.getElementById("emailSpan").innerHTML = "<font color='red'>*</font>"
        }
        function pdemail() {
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
            var email = document.getElementById("email").value;
            if(!reg.test(email)) {
                document.getElementById("emailSpan").innerHTML = "<font color='red'>x</font>"
            }
            else {
                document.getElementById("emailSpan").innerHTML = "<font color='green'>✔</font>"
            }

        }

    </script>
</head>
<body>
<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>LOGIN</h2>
                        <br>
                        <p>欢迎来到 King Book</p>
                        <br>
                        <button class="btn_login" onClick="cambiar_login()">点击登录</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>SIGN UP</h2>
                        <br>
                        <p>没有账号，请先注册哦！</p>
                        <br>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">点击注册</button>
                    </div>
                </div>
            </div>

            <div class="cont_back_info">
                <div class="cont_img_back_grey"> <img src="po.jpg" alt="" /> </div>
            </div>
            <div class="cont_forms" >
                <div class="cont_img_back_"> <img src="po.jpg" alt="" /> </div>
                <form action="${pageContext.request.contextPath}/DengLuServlet" method="post">
                <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
                    <h2>LOGIN</h2>
                    <input type="text" name="username" placeholder="Email" />
                    <input type="password" name="passwd" placeholder="Password" />
                    <button class="btn_login" onClick="cambiar_login()">登录</button>
                </div>
                </form>
                <form action="${pageContext.request.contextPath}/JiaoYanServlet" method="post">
                <div  class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>SIGN UP</h2>
                    <input type="text" placeholder="用户名" name="name" id="name" onfocus="trip()" onblur="checkUsername()"/>
                    <span id="userNameSpan"></span>
                    <input type="password" placeholder="密码" name="qq" id="qq" onfocus="trip2()" onblur="pdqq()"/>
                    <span id="qqSpan"></span>
                    <input type="text" placeholder="年龄" name="age" id="age"  onfocus="trip1()" onblur="pdage()" />
                    <span id="ageSpan"></span>
                    <input type="text" placeholder="Email" name="email" id="email" onfocus="trip3()" onblur="pdemail()" />
                    <span id="emailSpan"></span>
                    <button class="btn_sign_up" onClick="cambiar_sign_up()">注册</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <br><br>
    <p style="color: white">${login}</p>
    <p style="color: white">${logins}</p>

</div>

<script src="js/index.js"></script>

</body>
</html>
