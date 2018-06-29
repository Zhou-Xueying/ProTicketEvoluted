<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/23
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>

<head>
    <title>缇可网，您的票务专家</title>
    <!-- Bootstrap core CSS -->
    <link rel="shortcut icon" href="static/images/icon.png" type="image/x-icon" />
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href='static/css/font-awesome.min.css' rel="stylesheet">
    <link href='static/css/animate.min.css' rel="stylesheet">
    <link href="static/css/cover.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
    <link href="static/css/sidebar.css" rel="stylesheet">
    <link href="static/css/mypage.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">

    <div class="col-md-offset-3 col-md-7">
        <div class="row row-title">
            <div class="col-md-3"><p class="title-page">个人信息</p>
                </div>
            <div class="col-md-offset-8">
                <a href="#" class="btn btn-sm btn-primary" id="edit">编辑个人信息</a>
                <form:form id="delete-form" action="deleteUser.form" method="POST" style="display: none;"/>
            </div>
        </div>
        <hr/>
        <form:form class="form-horizontal" method="POST" action="updateName.form">
            <div class="form-group">
                <label class="control-label col-md-2">邮箱</label>
                    ${member.email}
            </div>
            <div class="form-group">
                <label for="name" class="control-label col-md-2">用户名</label>
                <dd>${member.username}</dd>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">累计消费</label>
                    ${member.consumptions}
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">积分</label>
                    <%--<fmt:formatNumber value="${member.consumptions/10}" pattern="#" type="number"/>--%>
                    ${member.consumptions/10}
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">会员等级</label>
                    ${member.level}
            </div>
            <div class="col-md-6 col-md-offset-3">
                <button type="submit" id="enter" class="btn btn-ld btn-primary btn-block" style="display:none">保存个人信息</button>
            </div>
        </form:form>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">修改用户名</h4>
            </div>
            <div class="modal-body">
                <%--<form:form class="form-horizontal" method="POST" action="updateName.form">--%>
                <%--<div class="form-group">--%>
                <%--<label for="name" class="col-md-4 control-label">当前用户名</label>--%>
                <%--<div class="col-md-6">--%>
                <%--${member.username}--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                <%--<label for="name" class="col-md-4 control-label">新的用户名</label>--%>
                <%--<div class="col-md-6">--%>
                <%--<input id="name" type="text" class="form-control" name="name" value="" required autofocus>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                <%--<div class="col-md-6 col-md-offset-3">--%>
                <%--<button type="submit" class="btn btn-ld btn-primary btn-block">确定</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</form:form>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<footer style="text-align: center; margin: 10px;">
    <div class="container">
        <p>Copyright © 2018 ProTicket NJU Software</p>
    </div>
</footer>
<!-- Bootstrap core JavaScript-->
<!-- Placed at the end of the document so the pages load faster -->
<script src="static/jquery/jquery.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="/static/jquery/jquery.js"><\/script>')</script>
<script src="static/bootstrap/js/bootstrap.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

<script type="text/javascript">
    $(document).ready(function () {
        var trigger = $('.hamburger'),
            overlay = $('.overlay'),
            isClosed = false;

        trigger.click(function () {
            hamburger_cross();
        });

        function hamburger_cross() {

            if (isClosed == true) {
                overlay.hide();
                trigger.removeClass('is-open');
                trigger.addClass('is-closed');
                isClosed = false;
            } else {
                overlay.show();
                trigger.removeClass('is-closed');
                trigger.addClass('is-open');
                isClosed = true;
            }
        }

        $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
        });
    });
</script>
<script type="text/javascript">
    function del() {
        var msg = "此操作不可撤回，确定要注销账号吗？";
        if (confirm(msg)){
            return true;
        }else{
            return false;
        }
    }
</script>
<script>
    var statu = 0;
    var edit = document.getElementById('edit');
    var item = document.getElementsByTagName('dd');
    var item_length = item.length;
    var item_value = new Array(item_length);
    var enter=document.getElementById('enter');

    for(i = 0; i < item_length; i++){
        item_value[i] = item[i].innerHTML;
    }

    edit.onclick =function(){
        if(statu == 0){
            edit.style.display='none';
            enter.style.display = "block";
            for(i = 0; i < item_length; i++){
                item[i].innerHTML = '<input type="txt" class="item_input" name="name" value="'+item_value[i]+'">';
            }
            statu = 1;
        }else{
            var item_input = document.getElementsByClassName('item_input');
            for(i = 0; i < item_length; i++){
                item_value[i] = item_input[i].value;
            }
            for(i = 0; i < item_length; i++){
                item[i].innerHTML = item_value[i];
            }
            statu = 0
        }
        return false;
    }
</script>
</body>
