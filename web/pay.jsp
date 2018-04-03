<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/23
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付煲</title>
    <!-- Bootstrap core CSS -->
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="shortcut icon" href="static/images/icon.png" type="image/x-icon" />
</head>
<body>
<div class="row">
<div class="col-md-offset-3 col-md-6" style="margin-top:50px;">
    <p><span style="font-size:50px;">支付煲</span></p>
    <br/>
    <p><span style="font-size:20px;">待支付款项：缇可网订单</span></p>
    <p><span style="font-size:20px;">待支付金额：${order.totalPrice}</span></p>
    <p><span style="font-size:20px;" id="timer"></span></p>
    <br/><br/>
    <form class="form-horizontal" method="POST" action="pay.form">
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
                <button type="submit" class="btn btn-ld btn-primary btn-block">确认付款</button>
            </div>
        </div>
    </form>
</div>
<div class="col-md-3">
    <table border="1" style="margin-top: 100px; font-size: 20px; text-align: center;">
        <tr style="font-size: 25px; font-weight: 100;">
            <th>会员等级</th>
            <th>累计消费</th>
            <th>折扣</th>
        </tr>
        <tr>
            <td>0</td>
            <td>未消费</td>
            <td>无折扣</td>
        </tr>
        <tr>
            <td>1</td>
            <td>0~300</td>
            <td>98折</td>
        </tr>
        <tr>
            <td>2</td>
            <td>300~800</td>
            <td>96折</td>
        </tr>
        <tr>
            <td>3</td>
            <td>800~1500</td>
            <td>94折</td>
        </tr>
        <tr>
            <td>4</td>
            <td>1500~2500</td>
            <td>92折</td>
        </tr>
        <tr>
            <td>5</td>
            <td>2500~4000</td>
            <td>9折</td>
        </tr>
        <tr>
            <td>6</td>
            <td>4000~6000</td>
            <td>88折</td>
        </tr>
        <tr>
            <td>7</td>
            <td>6000以上</td>
            <td>85折</td>
        </tr>
    </table>
</div>
</div>
<script type="text/javascript">
    var maxtime = 1 * 60;
    function CountDown() {
        if (maxtime >= 0) {
            minutes = Math.floor(maxtime / 60);
            seconds = Math.floor(maxtime % 60);
            msg = "距离支付时限还有" + minutes + "分" + seconds + "秒";
            document.all["timer"].innerHTML = msg;
            --maxtime;
        } else{
            clearInterval(timer);
            window.location.href="http://localhost:8090/timeOver.form?orderId="+${order.orderid};
        }
    }
    timer = setInterval("CountDown()", 1000);
</script>
</body>
</html>