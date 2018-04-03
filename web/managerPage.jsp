<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/2
  Time: 7:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缇可网</title>
    <link rel="shortcut icon" href="static/images/icon.png" type="image/x-icon" />
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href='static/css/font-awesome.min.css' rel="stylesheet">
    <link href='static/css/animate.min.css' rel="stylesheet">
    <link href="static/css/cover.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse  navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" style="color:#fff">ProTicket</a>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="welcome.form">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>
<div class="content container" style="margin-top: 100px;margin-bottom: 100px; max-width:1300px;">
    <div class="col-md-offset-2">
        <table border="1" style="margin-top: 50px; font-size: 20px; text-align: center;" id="table">
            <tr style="font-size: 25px; font-weight: 100;">
                <th>场馆编号</th>
                <th>名称</th>
                <th>地址</th>
                <th>规格</th>
                <th>电话</th>
                <th>操作</th>
            </tr>
        </table>
    </div>
</div>
<footer style="text-align: center; margin: 10px;">
    <div class="container">
        <p>Copyright © 2018 ProTicket NJU Software</p>
    </div>
</footer>
<script src="static/jquery/jquery.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="/static/jquery/jquery.js"><\/script>')</script>
<script src="static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        console.log("document.ready");
        $.ajax({
            url:'getApplication.form',
            dataType:'json',
            type:'GET',
            success:function (data) {
                console.log("success");
                for(var i=0;i<data.length;i++) {
                    var venueId = data[i].venueid;
                    var venueName = data[i].venuename;
                    var address = data[i].address;
                    var size = data[i].size;
                    var phone = data[i].phone;
                    appendDiv(venueId,venueName,address,size,phone);
                }
            }
        });
        function appendDiv(venueId,venueName,address,size,phone){
            console.log("appendDiv");
            var table = document.getElementById("table");
            var tr = document.createElement("tr");
            var td1 = document.createElement("td");
            td1.innerHTML = venueId;
            var td2 = document.createElement("td");
            td2.innerHTML = venueName;
            var td3 = document.createElement("td");
            td3.innerHTML = address;
            var td4 = document.createElement("td");
            td4.innerHTML = size;
            var td5 = document.createElement("td");
            td5.innerHTML = phone;
            var td6 = document.createElement("td");
            var a1 = document.createElement("a");
            a1.setAttribute("class","btn btn-primary");
            a1.innerHTML = "通过";
            console.log(venueId);
            var onclick1 =  "alert('审批通过'); window.location.href='http://localhost:8090/passVenueApplication.form?venueId="+venueId+"';";
            a1.setAttribute("onclick", onclick1);
            var a2 = document.createElement("a");
            a2.setAttribute("class","btn btn-danger");
            a2.innerHTML = "驳回";
            var onclick2 =  "alert('已驳回'); window.location.href='http://localhost:8090/refuseVenueApplication.form?venueId="+venueId+"';";
            a2.setAttribute("onclick",onclick2);
            td6.appendChild(a1);
            td6.appendChild(a2);
            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);
            tr.appendChild(td5);
            tr.appendChild(td6);
            table.appendChild(tr);
        }
    });
</script>
</body>
</html>
