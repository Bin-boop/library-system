<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加读者</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 100px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">添加读者</h3>
        </div>
        <div class="panel-body">
            <form action="reader_add_do" method="post" id="readeredit" >
                <div class="input-group" style="padding-top: 20px;">
                    <span>用户名 </span>
                    <input type="text" name="name" id="name"  >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span>用户密码</span>
                    <input  type="password"  name="password" id="password">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >确认密码</span>
                    <input  type="password" name="ruserPassword" id="ruserPassword">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >用户性别</span>
                    <input type="text"  name="sex" id="sex" >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span>出生日期</span>
                    <input type="text" class="Wdate"  id="birth" name="birth"
                           readonly="readonly" onclick="WdatePicker();">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >居住地址</span>
                    <input type="text"  name="address" id="address"  >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >通讯电话</span>
                    <input type="text"  name="phone" id="phone"  >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <input style="align-items: center" type="submit" value="添加" class="btn btn-success btn-sm"
                           class="text-left">

                </div>

                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#password").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>