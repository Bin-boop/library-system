<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑读者信息《 ${readerInfo.readerId}》</title>
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
<div id="header" style="padding-bottom: 80px"></div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑读者信息《 ${readerInfo.readerId}》</h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do.html?readerId=${readerInfo.readerId}" method="post" id="readeredit" >

                <div class="input-group" style="padding-top: 20px;">
                    <span>用户名 </span>
                    <input type="text" name="name" id="name" value="${readerInfo.name}" >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >用户性别</span>
                    <input type="text"  name="sex" id="sex" value="${readerInfo.sex}" >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span>出生日期</span>
                    <input type="text" class="Wdate"  id="birth" name="birth"
                           readonly="readonly" onclick="WdatePicker();" value="${readerInfo.birth}">
                    <span></span>

                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >居住地址</span>
                    <input type="text"  name="address" id="address"  value="${readerInfo.address}" >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >通讯电话</span>
                    <input type="text"  name="phone" id="phone" value="${readerInfo.phone}"  >
                    <span></span>
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#readeredit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整读者信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>