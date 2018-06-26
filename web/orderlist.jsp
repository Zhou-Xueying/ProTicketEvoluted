<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/23
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
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
        a{
            color:#333;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>


    <jsp:include page="wrapper.jsp"/>

    <div class="main-container">
        <div class="container" style="text-align:left">
            <div class="col-md-offset-2 col-md-8">
                <div class="row main-container-row" style="position: relative">
                    <div class="row row-title">
                        <div class="col-md-3"><p class="title-page">我的订单</p></div>
                    </div>
                    <hr/>
                    <dl id="order-dl"></dl>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">
<div class="text-center">
    <nav>
        <ul class="pagination">
            <li><a href="<c:url value="toThePage.form?page=1"/>">首页</a></li>
            <li><a href="<c:url value="toThePage.form?page=${sessionScope.page-1>1?sessionScope.page-1:1}"/>">&laquo;</a></li>

            <c:forEach begin="1" end="${sessionScope.totalPages}" varStatus="loop">
                <c:set var="active" value="${loop.index==sessionScope.page?'active':''}"/>
                <li class="${active}"><a
                        href="<c:url value="toThePage.form?page=${loop.index}"/>">${loop.index}</a>
                </li>
            </c:forEach>
            <li>
                <a href="<c:url value="toThePage.form?page=${sessionScope.page+1<sessionScope.totalPages?sessionScope.page+1:sessionScope.totalPages}"/>">&raquo;</a>
            </li>
            <li><a href="<c:url value="toThePage.form?page=${sessionScope.totalPages}"/>">尾页</a></li>
        </ul>
    </nav>
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
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "getOrderList.form",
            dataType: 'json',
            success: function (data) {
                var page=<%=session.getAttribute("page")%>
                var totalUsers =data.length;
                var usersPerPage=5;
                var beginIndex = (page - 1) * usersPerPage;
                var endIndex = beginIndex + usersPerPage;
                if (endIndex > totalUsers){ endIndex = totalUsers;}


                for(var i=beginIndex;i<endIndex;i++){
                    var orderId = data[i].orderid;
                    var title = data[i].title;
                    var price = data[i].price;
                    var ticketNum = data[i].ticketnumber;
                    var totalPrice = data[i].totalPrice;
                    var dateTime = data[i].datetime;
                    var time = (new Date(parseFloat(dateTime))).format("yyyy-MM-dd hh:mm:ss");
                    var status = data[i].condition;
                    var imgUrl = data[i].imgUrl;
                    addEventDiv(orderId, title, time, price, ticketNum, totalPrice, status, imgUrl);
                }

            }
        });
    });

    function addEventDiv(orderId, title, time, price, ticketNum, totalPrice, status, imgUrl){

        var dl = document.getElementById("order-dl");
        var dd = document.createElement("dd");
        dd.setAttribute("class","event-dd");

        var cssText = "background-image:url("+ imgUrl+");background-size:180px 242px;";
        dd.setAttribute("style",cssText);

        var a1 = document.createElement("a");
        a1.setAttribute("href","#");
        var h3 = document.createElement("h3");
        h3.innerHTML = title;
        a1.appendChild(h3);
        dd.appendChild(a1);

        var br = document.createElement("br");
        dd.appendChild(br);
        dd.appendChild(br);
        dd.appendChild(br);

        var p1 = document.createElement("p");
        var span1 = document.createElement("span");
        span1.innerHTML = "场次：" + time;
        p1.appendChild(span1);
        dd.appendChild(p1);

        var p2 = document.createElement("p");
        var span2 = document.createElement("span");
        span2.innerHTML = "票面：" + price + "元";
        p2.appendChild(span2);
        dd.appendChild(p2);

        var p3 = document.createElement("p");
        var span3 = document.createElement("span");
        span3.innerHTML = "数量：" + ticketNum + "张";
        p3.appendChild(span3);
        dd.appendChild(p3);

        var p4 = document.createElement("p");
        var span4 = document.createElement("span");
        span4.innerHTML = "总价：" + totalPrice + "元";
        p4.appendChild(span4);
        dd.appendChild(p4);

        var p5 = document.createElement("p");
        var span5 = document.createElement("span");
        if(status===0){
            span5.innerHTML = "订单状态：待支付";
        }else if(status===1){
            span5.innerHTML = "订单状态：已支付";
        }else if(status===-1){
            span5.innerHTML = "订单状态：已取消";
        }else{
            span5.innerHTML = "订单状态：已使用";
        }
        p5.appendChild(span5);
        if(status===0){
            var a2 = document.createElement("a");
            a2.setAttribute("href","#");
            a2.setAttribute("class","btn btn-primary");
            a2.setAttribute("style","position:absolute;right:25px;");
            a2.innerHTML = "去付款";
            var onclick1 = "window.location.href='http://localhost:8090/toPay.form?orderId="+orderId+"';";
            a2.setAttribute("onclick",onclick1);
            p5.appendChild(a2);
        }else if(status===1){
            var a3 = document.createElement("a");
            a3.setAttribute("href","#");
            a3.setAttribute("class","btn btn-danger");
            a3.setAttribute("style","position:absolute;right:25px;");
            a3.innerHTML = "申请退款";
            var onclick2 = "window.location.href='http://localhost:8090/toGetMoneyBack.form?orderId="+orderId+"';";
            a3.setAttribute("onclick",onclick2);
            p5.appendChild(a3);
        }
        dd.appendChild(p5);
        dd.appendChild(br);

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
