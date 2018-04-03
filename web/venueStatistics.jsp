<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/3
  Time: 23:24
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
    <link href="static/css/mypage.css" rel="stylesheet">
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
            <%
                request.setCharacterEncoding("UTF-8");
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                        ${sessionScope.CURRENT_VENUE_NAME}<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="toVenuePage.form?venueId=${sessionScope.CURRENT_VENUE_ID}">场馆主页</a></li>
                        <li><a href="toCheckTicket.form">检票入口</a></li>
                        <li><a href="toVenueStatistics.form">场馆业绩</a></li>
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
        <div class="col-md-offset-3 col-md-7">
            <div class="row row-title">
                <div class="col-md-5"><p class="title-page">场馆业绩</p></div>
            </div>
            <hr/>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-4">发布的活动总数</label>
                    ${venue.eventcount}
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4">交易完成的订单总数</label>
                    ${venue.ordercount}
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4">交易完成的票数</label>
                    ${venue.ticketcount}
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4">总收入</label>
                    ${venue.income}
                </div>
            </form>
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
</body>
</html>
