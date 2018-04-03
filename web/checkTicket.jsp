<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/3
  Time: 22:39
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
        </div>
    </div><!-- /.container-fluid -->
</nav>
<div class="content container" style="margin-top: 200px;margin-bottom: 100px; max-width:1300px;">
    <div class="col-md-offset-3">
        <form:form class="form-horizontal" method="POST" action="checkTicket.form" role="form">
        <div class="form-group">
            <label for="orderId" class="col-md-3 control-label">编号</label>
            <div class="col-md-4">
                <input id="orderId" type="text" class="form-control" name="orderId" value="" required>
            </div>
        </div>
            <br/><br/>
        <div class="form-group">
            <div class="col-md-3 col-md-offset-3">
                <button type="submit" class="btn btn-ld btn-primary btn-block">检票</button>
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
