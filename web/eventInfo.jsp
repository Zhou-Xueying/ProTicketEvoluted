<%@ page import="static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_ID" %>
<%--
  Created by IntelliJ IDEA.
  User: sky-PC
  Date: 2018/6/21
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style type="text/css" media="screen">
        .event-dd{
            padding-left:80px;
            background-repeat:no-repeat;
        }
        .img1 {
            z-index: -1;
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-filter: blur(5px); /* Chrome, Safari, Opera */
            filter: blur(5px);
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
        .book_row_num input {
            display: inline-block;
            width: 36px;
            font-size: 18px;
            text-align: center;
            display: inline-block;
            height: 100%;
            color: #ff6a69;
        }
        .number-input-wrapper {
            width: 115px;
            height: 42px;
            line-height: 32px;
            border-radius: 12px;
            border: solid 2px #1abc9c;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
            white-space: nowrap;
            display: inline-block;
            cursor: pointer;
        }
        .price-button { /* 按钮美化 */
            position: relative;
            margin: 0px 5px 20px;
            width: 80px; /* 宽度 */
            height: 35px; /* 高度 */
            border-radius: 12px;
            border: solid 2px #415b76;
            background: white; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: black; /* 字体颜色 */
            font-size: 16px; /* 字体大小 */
        }
        .buyticket-top {
            margin-left: 0px;
            margin-bottom: 10px;
            width: 140px;
            line-height: 44px;
            font-size: 20px;
            font-weight: 500;
            color: #fff;
            text-align: center;
            cursor: pointer;
            height: 44px;
            border-radius: 12px;
            background-image: linear-gradient(to bottom,#1abc9c,#1bc5a3);
            /*box-shadow: 0 4px 9px 0 #5bc0de;*/
            filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0, startColorstr=#1abc9c, endColorstr=#1bc5a3);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">

    <div class="main-container">
        <div class="container" style="text-align:left">
            <div class="row main-container-row" style="margin-top: 0px;background: white;">
                <div class="col-md-3" style="margin-top: 20px">
                    <dl id="event_pic" style="margin-bottom: 20px"></dl>
                </div>
                <div class="col-md-7" style="margin-left: 60px;margin-top: 20px;">
                    <dl id="event_dl"></dl>
                    <dl id="event_price"></dl>
                    <dl id="tikect_num">
                        <dd class="event-dd">
                            <div class="list-box">
                                <h4 style="display: inline-block;">
                                    <p style="font-weight: 500;">&nbsp;选择数量:&nbsp;&nbsp;</p>
                                </h4>
                                <div class="book_row_num" style="display: inline-block;">
                                    <div class="number-input-wrapper">
                                        <span id="reduce-one" onclick="minus()" style="font-size: 32px;color: #1bc5a3 " >-</span>
                                        <input value="1"  id="buy-num" style="border-style:none;cursor: default;height: 32px;color: #1abc9c;font-weight: 800;">
                                        <span id="add-one" onclick="add()" style="font-size: 32px;color: #1abc9c">+</span>
                                    </div>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl id="money_pay">
                        <dd class="event-dd">
                            <div class="list-box" style="display: inline-block">
                                <h4 class="summation-label" style="display: inline-block;">
                                    <p style="font-weight: 500;">&nbsp;合计:&nbsp;&nbsp;</p>
                                </h4>
                                <span id="sumpay" style="display: inline-block;"></span>
                                <span id="perprice" style="display: inline-block"></span>
                            </div>
                        </dd>
                    </dl>
                    <dd class="event-dd" style="display: inline-block">
                        <button class="buyticket-top" id="js-preorder" type="button" style="display: inline-block" onclick="successpay()">立即支付</button>
                        <div id="js-preorder-btn" style="display: inline-block"></div>
                    </dd>
                </div>
                <br>
            </div>
            <div class="row main-container-row" style="margin-top: 20px;margin-bottom: 20px;background: white;">
                <div id="intro_panel" style="margin-left: 5% ;width: 90%">
                    <div class="intro-main-row">
                        <div class="panel panel-info" style="border: none;">
                            <div class="panel-heading" style="background-color: white">
                                <h3 class="panel-title" style="color: #1abc9c;font-size: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;演出介绍</h3>
                            </div>
                            <div class="panel-body" style="font-size: 18px">
                                <ul id="txt_content">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="modal.jsp"/>

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
        console.log("document.ready 1");
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
        var url = location.search;
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
            url: "getEventDetail.form",
            data: theRequest,
            dataType: 'json',
            success: function (data) {
                console.log("ajax success");
                var eventId = data.eventid;
                var title = data.title;
                var city = data.city;
                var description = data.description;
                var venueId = data.venueid;
                var venueName = data.venueName;
                var datetime = data.time;
                var time = (new Date(parseFloat(datetime))).format("yyyy-MM-dd hh:mm:ss");
                var price1 = data.price1;
                var price2 = data.price2;
                var price3 = data.price3;
                var price4 = data.price4;
                var price5 = data.price5;
                var imgUrl = data.imgUrl;
                var expanded = data.expanded;
                addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5, expanded);
                var button = document.getElementsByClassName("price-button")[0];
                button.click();
            }
        });
    });

    function addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5, expanded){

        var back = document.getElementsByClassName("content container")[0];
        back.setAttribute("style","background-image: url("+imgUrl+")");

        var pic = document.getElementById("event_pic");
        var a = document.createElement("a");
        a.setAttribute("href","#");
        a.setAttribute("class","event_post");
        var img = document.createElement("img");
        img.setAttribute("src",imgUrl);
        img.setAttribute("width",280);
        img.setAttribute("height",380);
        img.setAttribute("style","border-radius: 25px;box-shadow: 0 4px 16px 0 #ccc;margin-left: 80px");
        a.appendChild(img);
        pic.appendChild(a);

        var dl = document.getElementById("event_dl");
        var dd = document.createElement("dd");
        dd.setAttribute("class","event-dd");
        var p0 = document.createElement("p");
        var span0 = document.createElement("span");
        span0.setAttribute("style","font-size: 25px;")
        var cityAndTitle = title;
        span0.innerHTML = cityAndTitle;
        p0.appendChild(span0);
        dd.appendChild(p0);
        var br = document.createElement("br");
        dd.appendChild(br);

        var p1 = document.createElement("p");
        var span1 = document.createElement("span");
        span1.setAttribute("style","font-size: 18px;")
        if(!(description==="None")){
            span1.innerHTML = "&nbsp;"+description;
        }
        else{
            span1.innerHTML = "&nbsp;视听盛宴，尽情期待~";
        }
        p1.appendChild(span1);
        dd.appendChild(p1);

        var p2 = document.createElement("p");
        var span2 = document.createElement("span");
        span2.setAttribute("style","font-size: 18px;")
        if(venueName.length<12) {
            span2.innerHTML = "&nbsp;地点：" + venueName + "&nbsp;&nbsp;&nbsp;" + "&nbsp;时间：" + time;
        }
        else{
            span2.innerHTML = "&nbsp;地点：" + venueName + "<br >" + "&nbsp;时间：" + time;
        }
        p2.appendChild(span2);
        dd.appendChild(p2);

        dl.appendChild(dd);
        var hr = document.createElement("hr");
        hr.setAttribute("style","margin-left: 20px;");
        dl.appendChild(hr);

        var price = document.getElementById("event_price")
        var ddd = document.createElement("dd");
        ddd.setAttribute("class","event-dd");

        var h4 = document.createElement("h4");
        h4.setAttribute("style","display:inline-block;")
        var p5 = document.createElement("p");
        p5.setAttribute("style","font-weight:500;")
        p5.innerHTML = "&nbsp;选择票面：";
        h4.appendChild(p5);
        ddd.appendChild(h4);

        var priceArray = new Array(price1,price2,price3,price4,price5);
        for(var i=0;i<5;i++) {
            var button = document.createElement("button");
            button.setAttribute("type","button");
            button.setAttribute("class","price-button");
            button.setAttribute("style","display: inline-block;")
            button.setAttribute("onclick","calculatePay("+priceArray[i]+","+i+")");
            button.innerHTML = priceArray[i]+" 元";
            ddd.appendChild(button);
        }

        price.appendChild(ddd);

        var content = document.getElementById("txt_content");
        content.innerHTML = expanded;
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

    var numMax = 10;
    var numMin = 1;
    function minus() {
        var num_e = document.getElementById("buy-num");
        var num = num_e.getAttribute("value");
        var origin = num;
        if(num>numMin){
            num_e.setAttribute("value",--num);
        }
        var pay = document.getElementById("sumpay").innerHTML.split("&nbsp;")[0];
        calculatePay(pay/origin,numMax);
    }
    function add() {
        var num_e = document.getElementById("buy-num");
        var num = num_e.getAttribute("value");
        var origin = num;
        if(num<numMax){
            num_e.setAttribute("value",++num);
        }
        var pay = document.getElementById("sumpay").innerHTML.split("&nbsp;")[0];
        calculatePay(pay/origin,numMax);
    }
    function calculatePay(chosenPrice,id) {
        if(id!=numMax){
            var button = document.getElementsByClassName("price-button");
            for(var i=0;i<button.length;i++){
                button[i].setAttribute("style","border: solid 2px #415b76;")
            }
            button[id].setAttribute("style","border: solid 2px #1abc9c;");
        }
        var num = document.getElementById("buy-num").getAttribute("value");
        var payment = chosenPrice*num;
        var pay = document.getElementById("sumpay");
        pay.setAttribute("style","color: #1abc9c;font-size: 22px;");
        pay.innerHTML = payment+"&nbsp;元&nbsp;"

        var perprice = document.getElementById("perprice");
        perprice.setAttribute("style","color: #333333;font-size: 16px;");
        perprice.innerHTML = chosenPrice+"&nbsp;元/张";
        canceltip();
    }
    function successpay() {

        var pay = document.getElementById("js-preorder-btn");
        pay.setAttribute("style","color: red;font-size: 20px;display: inline-block");
        var logged = '${!empty(sessionScope.CURRENT_USER_NAME)}';
        console.log(logged);
        var ticketnumber = document.getElementById("buy-num").getAttribute("value");
        var price = document.getElementById("sumpay").innerHTML.split("&nbsp;")[0]/ticketnumber;
        if(ticketnumber)
        if(logged=="true"){
            var memberid = '${sessionScope.CURRENT_USER_ID}';
            var eventid = location.search.split("=")[1];
            var venueid = "1000003";
            var ticketnumber = document.getElementById("buy-num").getAttribute("value");
            var price = document.getElementById("sumpay").innerHTML.split("&nbsp;")[0]/ticketnumber;
            $.ajax({
                type: "POST",
                url: "makeOrderWithoutSeatChoice.form",
                dataType: 'json',
                data: {'memberid':memberid,'eventid':eventid,'venueid':venueid,'ticketnumber':ticketnumber,'price':price},
            })
            pay.innerHTML = "&nbsp;&nbsp;你已支付成功！";
        }
        else{
            var a2 = document.createElement("a2");
            a2.setAttribute("data-toggle","modal");
            a2.setAttribute("data-target","#loginModal");
            pay.appendChild(a2);
            a2.click();
        }
    }
    function canceltip(){
        var pay = document.getElementById("js-preorder-btn");
        pay.innerHTML = "";
    }
</script>

</body>
</html>
