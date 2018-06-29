<%@ page import="static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_NAME" %>
<%@ page import="java.util.Enumeration" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/27
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a class="navbar-brand" href="toDisplay.form?type=0" style="color:#fff">ProTicket</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="toDisplay.form?type=0">缇可网，您的票务专家 <span class="sr-only">(current)</span></a></li>
            </ul>
            <c:choose>
                <c:when test="${!empty(sessionScope.CURRENT_USER_NAME)}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                                ${sessionScope.CURRENT_USER_NAME} <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="toMyPage.form">个人中心</a>
                                </li>
                                <li>
                                    <a href="toMyOrderList.form">我的订单</a>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <a href="#" onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                                        退出登录
                                    </a>
                                    <form:form id="logout-form" action="logout.form" method="POST" style="display: none;"/>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" data-toggle="modal" data-target="#loginModal">登录</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#signinModal">注册</a></li>
                        <%--<li class="dropdown">--%>
                            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">--%>
                                <%--其他 <span class="caret"></span>--%>
                            <%--</a>--%>
                            <%--<ul class="dropdown-menu">--%>
                                <%--<li>--%>
                                    <%--<a href="#" data-toggle="modal" data-target="#venueModal">合作场馆入口</a>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#" data-toggle="modal" data-target="#managerModal">管理人员入口</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>