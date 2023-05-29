<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <style>
        #login{
            height: 50%;
            width: 28%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
        }

        .form-group {
            margin-bottom: 0;
        }
        * {
            padding:0;
            margin:0;
        }
    </style>
</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<h2 style="text-align: center; color: white; font-family: '华文新魏'; font-size: 500%">图 书 管 理 系 统</h2>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <strong class="panel-title">请登录</strong>
        <a href="register" class="panel-title">请注册</a>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-primary  btn-block">登录
        </button>
    </div>
</div>
    <script>

        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#username').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus();
        $("#loginButton").click(function () {
            var username =$("#username").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');
            if (username == '') {
                $("#info").text("警告：账号不能为空！");
            }
            else if( passwd ==''){
                $("#info").text("警告：密码不能为空！");
            }

            else {

                $.ajax({
                    type: "POST",
                    url: "loginCheck",
                    data: {
                        username:username,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            alert("警告：账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            alert("登陆成功");
                            window.parent.location.href = "admin_books.html";

                        } else if (data.stateCode.trim() === "2") {
                            if(remember){
                                rememberLogin(username,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            alert("登陆成功");
                            window.parent.location.href = "reader_books.html";

                        }
                    }
                });
            }
        })

    </script>
</div>

</body>
</html>
