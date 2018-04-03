<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/3
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
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
        </div>
    </div><!-- /.container-fluid -->
</nav>
<div class="content container" style="margin-top: 100px;margin-bottom: 100px; max-width:1300px;">
    <div>
        <form:form class="form-horizontal" method="POST" action="updateVenue.form" role="form">
            <input type="hidden" name="venueId" value="${venue.venueid}">
            <div class="form-group">
                <label for="name" class="col-md-4 control-label">名称</label>
                <div class="col-md-6">
                    <input id="name" type="text" class="form-control" name="name" value="${venue.venuename}" required autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-md-4 control-label">地址</label>
                <div class="col-md-6">
                    <input id="address" type="text" class="form-control" name="address" value="${venue.address}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="size" class="col-md-4 control-label">场馆规格</label>
                <div class="col-md-6">
                    <input id="size" type="text" class="form-control" name="size" value="${venue.size}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-md-4 control-label">联系电话</label>
                <div class="col-md-6">
                    <input id="phone" type="text" class="form-control" name="phone" value="${venue.phone}" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button type="submit" class="btn btn-ld btn-primary btn-block">提交修改申请</button>
                </div>
            </div>
        </form:form>
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
