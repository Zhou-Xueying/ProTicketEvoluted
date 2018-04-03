<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="edu.nju.proticket.model.Order" %>
<%@ page import="com.mysql.cj.mysqlx.protobuf.MysqlxCrud" %><%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/2
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缇可网</title>
    <link rel="shortcut icon" href="static/images/icon.png" type="image/x-icon" />
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付煲</title>
    <!-- Bootstrap core CSS -->
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<%
    double money = (Double)request.getAttribute("money");
    request.removeAttribute("money");
%>
<div class="row">
    <div class="col-md-offset-3 col-md-6" style="margin-top:50px;">
    <p><span style="font-size:50px;">支付煲</span></p>
    <br/>
    <p><span style="font-size:20px;">您的订单金额为：${order.totalPrice}</span></p>
    <p><span style="font-size:20px;">您可获得的退款金额为：<%=money%></span></p>
    <br/><br/>
    <form:form class="form-horizontal" method="POST" action="refund.form">
        <input type="hidden" name="orderId" value="${order.orderid}" required autofocus>
        <div class="form-group">
            <label for="name" class="col-md-1 control-label">账号</label>
            <div class="col-md-4">
                <input id="name" type="text" class="form-control" name="accountId" value="" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-md-1 control-label">密码</label>
            <div class="col-md-4">
                <input id="password" type="password" class="form-control" name="password" required>
            </div>
        </div>
        <br/>
        <input type="hidden" name="price" value="${order.totalPrice}"/>
        <div class="form-group">
            <div class="col-md-2 col-md-offset-2">
                <button type="submit" class="btn btn-ld btn-primary btn-block">确认退款</button>
            </div>
        </div>
    </form:form>
</div>
    <div class="col-md-3">
        <table border="1" style="margin-top: 200px; font-size: 20px; text-align: center;">
            <tr style="font-size: 25px; font-weight: 100;">
                <th>申请退票时距离演出的时间</th>
                <th>可退款比例</th>
            </tr>
            <tr>
                <td>两周以上</td>
                <td>全款</td>
            </tr>
            <tr>
                <td>一周至两周之间</td>
                <td>90%</td>
            </tr>
            <tr>
                <td>三日至一周</td>
                <td>80%</td>
            </tr>
            <tr>
                <td>三日以内</td>
                <td>不退款</td>
            </tr>
        </table>
    </div>

</div>
</body>
</html>
