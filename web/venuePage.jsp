<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="static edu.nju.proticket.controller.VenueController.CURRENT_VENUE_NAME" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/2
  Time: 7:16
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
    <style type="text/css" media="screen">
        .event-dd{
            padding-left:200px;
            background-repeat:no-repeat;
        }
        dl{
            padding:0;
            margin:0;
            clear:left;
        }
        dl dt{
            float:left;
        }
        .price-li{
            list-style: none;
            display: inline-block;
            margin-right:15px;
        }
        a{
            color:#333;
        }
        .fake-b{
            padding: 0;
            margin: 0;
            background: none;
            border: none;
        }
    </style>
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
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">缇可网，您的票务专家 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                        ${sessionScope.CURRENT_VENUE_NAME}<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="toVenuePage.form?venueId=${sessionScope.CURRENT_VENUE_ID}">场馆主页</a></li>
                        <li><a href="toCheckTicket.form">检票入口</a></li>
                        <li><a href="toVenueStatistics.form">我的业绩</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="#" onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                                退出登录
                            </a>
                            <form:form id="logout-form" action="venueLogout.form" method="POST" style="display: none;"/>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">
    <div class="row">
        <div class="col-md-offset-1 col-md-4" style="border:1px; padding-right: 10px;">
            <p style="font-size: 30px; font-weight: 100">场馆信息</p>
            <a href="toUpdateVenueInfo.form?venueId=${venue.venueid}" class="btn btn-primary col-md-offset-7" style="margin-right:15px;">修改信息</a>
            <br/><hr/><br/>
            <p>编号：${venue.venueid}</p>
            <p>名称：${venue.venuename}</p>
            <p>规格：${venue.size}</p>
            <p>地址：${venue.address}</p>
            <p>联系方式：${venue.phone}</p>
        </div>
        <div class="col-md-6">
            <p style="font-size: 30px; font-weight: 100">活动列表</p>
            <a href="toCreateEvent.form" class="btn btn-primary col-md-offset-7" style="margin-right:15px;">发布新活动</a>
            <br/><hr/><br/>
            <dl id="events_dl"></dl>
        </div>
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
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") !== -1){
            var str = url.substr(1);
            strs = str.split("&");
            for(var i = 0; i < strs.length; i ++) {
                theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
            }
        }

        $.ajax({
            type: "GET",
            url: "getVenueEvents.form",
            data: theRequest,
            dataType: 'json',
            success: function (data) {
                console.log("ajax success");
                for(var i=0;i<data.length;i++){
                    var eventId = data[i].eventid;
                    var title = data[i].title;
                    var city = data[i].city;
                    var description = data[i].description;
                    var venueId = data[i].venueid;
                    var venueName = data[i].venueName;
                    var datetime = data[i].time;
                    var time = (new Date(parseFloat(datetime))).format("yyyy-MM-dd hh:mm:ss");
                    var price1 = data[i].price1;
                    var price2 = data[i].price2;
                    var price3 = data[i].price3;
                    var price4 = data[i].price4;
                    var price5 = data[i].price5;
                    var imgUrl = data[i].imgUrl;
                    addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5);
                }
            }
        });
    });

    function addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5){

        var logged = '${!empty(sessionScope.CURRENT_USER_NAME)}';
        console.log(logged);

        var dl = document.getElementById("events_dl");
        var dd = document.createElement("dd");
        dd.setAttribute("class","event-dd");
        var cssText = "background-image:url("+ imgUrl+");";
        dd.setAttribute("style",cssText);

        var a1 = document.createElement("a");
        a1.setAttribute("href","#");
        var h3 = document.createElement("h3");
        var cityAndTitle = "【"+city+"】"+title;
        h3.innerHTML = cityAndTitle;
        a1.appendChild(h3);
        dd.appendChild(a1);

        var br = document.createElement("br");
        dd.appendChild(br);

        var p1 = document.createElement("p");
        var span1 = document.createElement("span");
        span1.innerHTML = description;
        p1.appendChild(span1);
        dd.appendChild(p1);

        var p2 = document.createElement("p");
        var span2 = document.createElement("span");
        span2.innerHTML = venueName;
        p2.appendChild(span2);
        dd.appendChild(p2);

        var p3 = document.createElement("p");
        var span3 = document.createElement("span");
        span3.innerHTML = time;
        p3.appendChild(span3);
        dd.appendChild(p3);

        var p4 = document.createElement("p");
        p4.setAttribute("style","color:#f00");
        var span4 = document.createElement("span");
        span4.setAttribute("style","font-size:24px");
        span4.innerHTML = price1;
        var span5 = document.createElement("span");
        span5.innerHTML = "元起";
        p4.appendChild(span4);
        p4.appendChild(span5);
        dd.appendChild(p4);

        dl.appendChild(dd);
        var hr = document.createElement("hr");
        dl.appendChild(hr);
    }

    Date.prototype.format = function(format) {
        var o = {
            "M+" : this.getMonth() + 1,// month
            "d+" : this.getDate(),// day
            "h+" : this.getHours(),// hour
            "m+" : this.getMinutes(),// minute
            "s+" : this.getSeconds(),// second
            "q+" : Math.floor((this.getMonth() + 3) / 3),// quarter
            "S" : this.getMilliseconds()
            // millisecond
        };
        if (/(y+)/.test(format) || /(Y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for ( var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    };
</script>
</body>
</html>
