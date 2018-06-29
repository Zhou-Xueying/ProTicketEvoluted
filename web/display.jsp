<%@ page import="static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_ID" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/23
  Time: 14:19
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
        html, body {
            width: 100%;
        }
        ul li {
            list-style: none;
        }
        *{
            margin:0;
            padding:0;
        }
        #box {
            width: 1200px;
            margin: 20px auto;
        }
        .slide {
            height: 500px;
            position: relative;
        }
        .slide ul {
            height: 100%;
        }
        .slide li {
            position: absolute;
            left:200px;
            top:0;
        }
        .slide li img{
            width: 100%;
        }
        .arraw {
            opacity: 0;
        }
        .arraw a {
            width: 70px;
            height: 110px;
            display: block;
            position: absolute;
            top: 50%;
            margin-top: -55px;
            z-index: 999;
        }
        .next {
            background: url(static/images/right.png) no-repeat;
            right: -10px;
            /*opacity: .5;*/
            /*filter: alpha(opacity=50);*/
        }
        .prev {
            background: url(static/images/left.png) no-repeat;
            left: -10px;
        }
    </style>
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
        .price-li{
            list-style: none;
            display: inline-block;
            margin-right:15px;
        }
        a{
            color:#333;
        }
        .type-li{
            display:inline-block;
            font-size:25px;
            padding-right:30px;
        }
        a:hover{
            color:#FF0000;
        }
        a:focus{
            color:#FF0000;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>
<jsp:include page="modal.jsp"/>

<div class="content container" style="margin-top: 75px;margin-bottom: 60px; max-width:1600px;">

    <div>
        <ul>
            <li class="type-li"><a href="toDisplay.form?type=0" id="type-0">首页</a></li>
            <li class="type-li"><a href="toDisplay.form?type=1" id="type-1">演唱会</a></li>
            <li class="type-li"><a href="toDisplay.form?type=2" id="type-2">话剧歌剧</a></li>
            <li class="type-li"><a href="toDisplay.form?type=3" id="type-3">体育赛事</a></li>
            <li class="type-li"><a href="toDisplay.form?type=4" id="type-4">音乐会</a></li>
            <li class="type-li"><a href="toDisplay.form?type=5" id="type-5">舞蹈芭蕾</a></li>
            <li class="type-li"><a href="toDisplay.form?type=6" id="type-6">展览休闲</a></li>
            <li class="type-li"><a href="toDisplay.form?type=7" id="type-7">曲艺杂谈</a></li>
        </ul>
    </div>

    <hr/>

    <%--<c:if test="${sessionScope.type eq 0}">--%>
    <div id="box">
        <div class="slide">
            <ul>
                <li class="revolve-li"><a href="toShowEventInfo.form?eventId=145"><img src="static/images/1.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="toShowEventInfo.form?eventId=20"><img src="static/images/2.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="toShowEventInfo.form?eventId=20"><img src="static/images/3.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="toShowEventInfo.form?eventId=20"><img src="static/images/5.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="toShowEventInfo.form?eventId=20"><img src="static/images/6.jpg" alt=""></a></li>
            </ul>
            <div class="arraw">
                <a href="javascript:;" class="next"></a>
                <a href="javascript:;" class='prev'></a>
            </div>
        </div>
    </div>
    <%--</c:if>--%>

    <div class="main-container">
        <div class="container" style="text-align:left;">
            <div class="row main-container-row" style="position: relative">
                <div class="col-md-offset-1 col-md-10" id="events-div">
                </div>
            </div>
        </div>

        <div class="container" style="text-align:left; margin-top:0;">
            <div class="row main-container-row" style="position: relative">
                <div class="col-md-offset-8 col-md-4">
                    <ul class="pagination" id="pagination">
                        <li><a href="#" onclick="if(sessionStorage.getItem('currentPage')!=1){changePage(parseInt(sessionStorage.getItem('currentPage'))-1)}">&laquo;</a></li>
                        <%--<li><a href="#">1</a></li>--%>
                        <%--<li><a href="#">&raquo;</a></li>--%>
                    </ul>
                </div>
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
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") !== -1){
            var str = url.substr(1);
            sessionStorage.setItem("type",str.split('=')[1]);
            strs = str.split("&");
            for(var i = 0; i < strs.length; i ++) {
                console.log(strs[i].split("=")[0]);
                console.log(strs[i].split("=")[1]);
                theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
            }
        }else{
            sessionStorage.setItem("type",0);
            theRequest["type"]=0;
        }

        $.ajax({
            type: "GET",
            url: "getEventList.form",
            data: theRequest,
            dataType: 'json',
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            },
            success: function (data) {
                console.log("ajax success");
                var slideBox = document.getElementById("box");
                if(parseInt(sessionStorage.getItem("type"))!==0){
                    slideBox.setAttribute("style","display:none");
                }else{
                    console.log("=");
                    slideBox.setAttribute("style","");
                }
                console.log(sessionStorage.getItem("type"));
                var type_num = "type-"+sessionStorage.getItem("type");
                var type_a = document.getElementById(type_num);
                type_a.setAttribute("style","color:#FF0000;");
                sessionStorage.setItem("currentPage",1);
                var max = data.length/20;
                if(data.length%20!==0){
                    max = max + 1;
                }
                sessionStorage.setItem("maxPage",max);
                for(var i=1;i<=max;i++){
                    addPagination(i);
                }
                addPagination(0);
                for(i=0; i< data.length;){
                    add_dl(i);
                    i = i+2;
                }
                for(i=0;i<data.length;i++){
                    var eventId = data[i].eventid;
                    var title = data[i].title;
                    var city = data[i].city;
                    var description = data[i].description;
                    var venueId = data[i].venueid;
                    var venueName = data[i].venueName;
                    var datetime = data[i].time;
                    var time = (new Date(parseFloat(datetime))).format("yyyy-MM-dd hh:mm:ss");
                    var price1 = data[i].price1;
                    var imgUrl = data[i].imgUrl;
                    addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1,i);
                }
                changePage(1);
            }
        });
    });

    function addPagination(i) {
        var ul = document.getElementById("pagination");
        var li = document.createElement("li");
        var a = document.createElement("a");
        a.setAttribute("href", "#");
        if (i === 0) {
            a.innerHTML = "&raquo;";
            var onclick = "if(sessionStorage.getItem('currentPage')!=sessionStorage.getItem('maxPage')){changePage(parseInt(sessionStorage.getItem('currentPage'))+1)}";
            a.setAttribute("onclick",onclick);
        } else {
            a.innerHTML = i;
            onclick = "changePage("+i+")";
            a.setAttribute("onclick",onclick);
            var page_id = "page_"+i;
            a.setAttribute("id", page_id);
        }
        li.appendChild(a);
        ul.appendChild(li);
    }

    function add_dl(i){
        var div = document.getElementById("events-div");
        var dl = document.createElement("dl");
        var j = i/2+1;
        var dl_id = "dl_"+j;
        dl.setAttribute("class","event_dl");
        dl.setAttribute("id",dl_id);
        dl.setAttribute("style","display:none");
        div.appendChild(dl);
    }

    function addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price, i){

        var j = parseInt(i/2) + 1;
        var dl_id = "dl_"+j;
        var dl = document.getElementById(dl_id);

        var dd = document.createElement("dd");
        dd.setAttribute("class","event-dd");
        var cssText = "background-image:url("+ imgUrl+");background-size:180px 242px;width:450px;float:left;min-height:300px;";
        if(i%2 !== 0){
            cssText = "background-image:url(" + imgUrl + ");background-size:180px 242px;width:450px;float:right;min-height:300px;";
        }
        dd.setAttribute("style",cssText);

        var a1 = document.createElement("a");
        a1.setAttribute("href","toShowEventInfo.form?eventId="+eventId);
        var span = document.createElement("span");
        span.setAttribute("style","font-size:20px");
//        var cityAndTitle = "【"+city+"】"+title;
//        span.innerHTML = cityAndTitle;
        span.innerHTML = title;
        a1.appendChild(span);
        dd.appendChild(a1);

        var br = document.createElement("br");

        var p1 = document.createElement("p");
        p1.setAttribute("style","margin-top:25px");
        var span1 = document.createElement("span");
        span1.innerHTML = description;
        span1.setAttribute("style","color:#888888;text-shadow: none;");
        p1.appendChild(span1);
        dd.appendChild(p1);
        dd.appendChild(br);

        var p2 = document.createElement("p");
        var span2 = document.createElement("span");
        span2.innerHTML = venueName;
        p2.appendChild(span2);
        dd.appendChild(p2);

        var p3 = document.createElement("p");
        var span3 = document.createElement("span");
        span3.innerHTML = time;
        p3.appendChild(span3);
        dd.appendChild(p3);

        var p4 = document.createElement("p");
        p4.setAttribute("style","color:#f00");
        var span4 = document.createElement("span");
        span4.setAttribute("style","font-size:24px");
        span4.innerHTML = price;
        var span5 = document.createElement("span");
        span5.innerHTML = "元起";
        p4.appendChild(span4);
        p4.appendChild(span5);
        dd.appendChild(p4);

        dl.appendChild(dd);
    }

    function changePage(after) {
        var dls = document.getElementsByClassName("event_dl");
        for(var t=0; t<dls.length; t++){
            dls[t].setAttribute("style","display:none");
        }
        for( i=(after-1)*10+1; i<=after*10; i++){
            var dl_id = "dl_"+i;
            if(document.getElementById(dl_id)==null)break;
            dl = document.getElementById(dl_id);
            dl.setAttribute("style","");
        }
        sessionStorage.setItem("currentPage",after);
        for(i=1;i<=sessionStorage.getItem("maxPage");i++){
            var page_id = "page_"+i;
            var page_a = document.getElementById(page_id);
            page_a.setAttribute("style","");
        }
        page_id = "page_"+after;
        page_a = document.getElementById(page_id);
        page_a.setAttribute("style","color:#FF0000;");
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
<script>
    var box = document.querySelector('#box');
    var slide = document.querySelector('.slide');
    var arraw = document.querySelector('.arraw');
    var lis = document.querySelectorAll('.revolve-li');
    var json = [  //  包含了5张图片里面所有的样式
        {   //  1
            width:400,
            top:20,
            left:100,
            opacity:20,
            z:2,
            id:1
        },
        {  // 2
            width:600,
            top:70,
            left:50,
            opacity:60,
            z:3,
            id:2
        },
        {   // 3
            width:800,
            top:100,
            left:200,
            opacity:100,
            z:4,
            id:3
        },
        {  // 4
            width:600,
            top:70,
            left:550,
            opacity:60,
            z:3,
            id:4
        },
        {   //5
            width:400,
            top:20,
            left:650,
            opacity:20,
            z:2,
            id:5
        }
    ];
    box.addEventListener('mouseover', function(){
        animate(arraw, {opacity: 100});
    });
    box.addEventListener('mouseout', function(){
        animate(arraw, {opacity: 0});
    });

    var next = document.querySelector('.next');
    var prev = document.querySelector('.prev');
    var timer = null;
    var flag = true;
    next.addEventListener('click', function(){
        clearInterval(timer);
        if(flag == true){
            move(true);
            flag = false;
        }
    });
    next.addEventListener('mouseleave', function(){

        clearInterval(timer);
        run();

    });
    prev.addEventListener('click', function(){
        clearInterval(timer);
        if(flag == true){
            move(false);
            flag = false;
        }
    });
    prev.addEventListener('mouseleave', function(){
        run();
    });

    move();
    run();
    function run(){
        clearInterval(timer);
        timer = setInterval(function(){
            if(flag == true){
                flag = false;
                move(true);
            }
        },500);
    }

    function move(x){
        if(x != undefined){
            if(x){
                json.push(json.shift());
            }else{
                json.unshift(json.pop());
            };
        };

        for(var i = 0; i<json.length; i++){
            animate(lis[i],{
                width: json[i].width,
                top: json[i].top,
                left: json[i].left,
                opacity: json[i].opacity,
                zIndex: json[i].z
            },function(){flag = true;})
        };
    }

    function animate(obj, json, callback){
// 先停止定时器
        clearInterval(obj.timers);
        obj.timers = setInterval(function(){
            var stoped = true;
            for(var k in json){
                var leader = 0;
                if(k == 'opacity'){
                    leader = Math.round(getStyle(obj, k)*100) || 100;
                }else {
                    leader = parseInt(getStyle(obj, k)) || 0;
                };
                var step = (json[k]-leader)/10;
                step = step > 0? Math.ceil(step) : Math.floor(step);
                leader = leader + step;
                if(k == 'opacity'){
                    obj.style[k] = leader/100;
                    obj.style['filter'] = 'alpha(opacity='+ leader +')';
                }else if(k == 'zIndex'){
                    obj.style['zIndex'] = json[k];
//                    console.log(666);
                }else{
                    obj.style[k] = leader + "px";
                }
                if(leader != json[k]){
                    stoped = false;
                }
            };
            if(stoped){
                clearInterval(obj.timers);
                callback && callback();
            };
        },50);
    };
    //获取属性值
    function getStyle(obj, attr){
        if(obj.currentStyle){
            return obj.currentStyle[attr];
        }else{
            return window.getComputedStyle(obj, null)[attr];
        };
    };
</script>
</body>
</html>