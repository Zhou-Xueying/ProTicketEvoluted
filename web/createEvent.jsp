<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/3
  Time: 2:54
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
    <link href="static/css/bootstrap-datetimepicker.css">
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
        <form:form class="form-horizontal" method="POST" action="createEvent.form" role="form">
            <div class="form-group">
                <label for="name" class="col-md-4 control-label">名称</label>
                <div class="col-md-6">
                    <input id="name" type="text" class="form-control" name="title" value="" required autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-md-4 control-label">城市</label>
                <div class="col-md-6">
                    <input id="address" type="text" class="form-control" name="city" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="time" class="col-md-4 control-label">时间</label>
                <div class="col-md-6 input-group date" id="datetimepicker">
                    <input id="time" type="text" name="time" readonly class="form_datetime">
                </span>
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-md-4 control-label">类型</label>
                <div class="col-md-6">
                    <select class="form-control choice" id="type" name="type" required>
                        <option>演唱会</option>
                        <option>话剧歌剧</option>
                        <option>体育赛事</option>
                        <option>音乐会</option>
                        <option>舞蹈芭蕾</option>
                        <option>展览休闲</option>
                        <option>曲艺杂谈</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-md-4 control-label">活动简介</label>
                <div class="col-md-6">
                    <textarea id="description" class="form-control description" type="text"
                              name="description"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="price1" class="col-md-4 control-label">票面一</label>
                <div class="col-md-6">
                    <input id="price1" type="text" class="form-control" name="price1" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="amout1" class="col-md-4 control-label">数量</label>
                <div class="col-md-6">
                    <input id="amout1" type="text" class="form-control" name="amount1" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="price2" class="col-md-4 control-label">票面二</label>
                <div class="col-md-6">
                    <input id="price2" type="text" class="form-control" name="price2" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="amount2" class="col-md-4 control-label">数量</label>
                <div class="col-md-6">
                    <input id="amount2" type="text" class="form-control" name="amount2" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="price3" class="col-md-4 control-label">票面三</label>
                <div class="col-md-6">
                    <input id="price3" type="text" class="form-control" name="price3" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="amount3" class="col-md-4 control-label">数量</label>
                <div class="col-md-6">
                    <input id="amount3" type="text" class="form-control" name="amount3" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="price4" class="col-md-4 control-label">票面四</label>
                <div class="col-md-6">
                    <input id="price4" type="text" class="form-control" name="price4" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="amount4" class="col-md-4 control-label">数量</label>
                <div class="col-md-6">
                    <input id="amount4" type="text" class="form-control" name="amount4" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="price5" class="col-md-4 control-label">票面五</label>
                <div class="col-md-6">
                    <input id="price5" type="text" class="form-control" name="price5" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label for="amount5" class="col-md-4 control-label">数量</label>
                <div class="col-md-6">
                    <input id="amount5" type="text" class="form-control" name="amount5" value="" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button type="submit" class="btn btn-ld btn-primary btn-block">发布</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
<script src="static/jquery/jquery.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="/static/jquery/jquery.js"><\/script>')</script>
<script src="static/bootstrap/js/bootstrap.js"></script>
<script src="static/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
</script>
</body>
</html>
