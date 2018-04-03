<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/23
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缇可网，您的票务专家</title>
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
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">

    <jsp:include page="wrapper.jsp"/>

    <div id="box">
        <div class="slide">
            <ul>
                <li class="revolve-li"><a href="#"><img src="static/images/1.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="#"><img src="static/images/2.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="#"><img src="static/images/3.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="#"><img src="static/images/5.jpg" alt=""></a></li>
                <li class="revolve-li"><a href="#"><img src="static/images/6.jpg" alt=""></a></li>
            </ul>
            <div class="arraw">
                <a href="javascript:;" class="next"></a>
                <a href="javascript:;" class='prev'></a>
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
// console.log('aaa')
        animate(arraw, {opacity: 100});
    });
    box.addEventListener('mouseout', function(){
// console.log('aaa')
        animate(arraw, {opacity: 0});
    });

    var next = document.querySelector('.next');
    var prev = document.querySelector('.prev');
    var timer = null;
    var flag = true;
    next.addEventListener('click', function(){
// alert('next');
// console.log(json);
// console.log('================')
        clearInterval(timer);
        if(flag == true){
            move(true);
            flag = false;
        }
//console.log(json);
    });
    next.addEventListener('mouseleave', function(){

        clearInterval(timer);
//alert('next')
        run();
//console.log(json);

    });
    prev.addEventListener('click', function(){
        clearInterval(timer);
// alert('prev')
        if(flag == true){
            move(false);
            flag = false;
        }
    });
    prev.addEventListener('mouseleave', function(){
// alert('prev')
// clearInterva(timer);
        run();
    });

    move();
    run();
    function run(){
        clearInterval(timer);
        timer = setInterval(function(){
// console.log('run')
            if(flag == true){
                flag = false;
                move(true);
            }
// console.log(json)
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
            // console.log('sss')
            for(var k in json){
                // var leader = parseInt(getStyle(obj, k));
                var leader = 0;
                if(k == 'opacity'){
                    leader = Math.round(getStyle(obj, k)*100) || 100;
                }else {
                    // console.log(json[k]);
                    leader = parseInt(getStyle(obj, k)) || 0;
                };
//         console.log(leader);
                // json[k]是目标位置
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
                // console.log('stop')
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