<%@ page import="static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_ID" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        .fake-b{
            padding: 0;
            margin: 0;
            background: none;
            border: none;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="content container" style="margin-top: 65px;margin-bottom: 100px; max-width:1600px;">

    <jsp:include page="wrapper.jsp"/>

    <div class="main-container">
        <div class="container" style="text-align:left">
            <div class="row main-container-row" style="position: relative">
                <div class="col-md-offset-2 col-md-8">
                    <dl id="events_dl"></dl>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">无选座购票</h4>
                </div>
                <form:form class="form-horizontal" method="POST" action="makeOrderWithoutSeatChoice.form">
                    <input type="hidden" name="memberid" id="member_id"/>
                    <input type="hidden" name="eventid" id="event_id"/>
                    <input type="hidden" name="venueid" id="venue_id"/>
                    <input type="hidden" name="seatchoice" value="0"/>
                    <div class="modal-body">
                        <div class="form-group">
                            <dl>
                                <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型</dt>
                                <dd>
                                    <ul class="price-ul">
                                        <li class="price-li">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="price" id="optionsRadios1" value="price1" checked>
                                                        <input type="button" id="price1" class="fake-b"/>
                                                </label>
                                            </div>
                                        </li>
                                        <li class="price-li">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="price" id="optionsRadios2" value="price2" >
                                                        <input type="button" id="price2" class="fake-b"/>
                                                </label>
                                            </div>
                                        </li>
                                        <li class="price-li">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="price" id="optionsRadios3" value="price3">
                                                        <input type="button" id="price3" class="fake-b"/>
                                                </label>
                                            </div>
                                        </li>
                                        <li class="price-li">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="price" id="optionsRadios4" value="price4">
                                                    <input type="button" id="price4" class="fake-b"/>
                                                </label>
                                            </div>
                                        </li>
                                        <li class="price-li">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="price" id="optionsRadios5" value="price5">
                                                    <input type="button" id="price5" class="fake-b"/>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </dd>
                            </dl>
                            <dl>
                                <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="ticNum">数量</label></dt>
                                <dd>
                                    <span>
                                        <%--<input type="text" value="1" maxlength=2 name="ticketnumber">--%>
                                        <select class="form-control choice" id="ticNum" name="ticketnumber" required>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                                            <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                                            <option>15</option>
                        <option>16</option>
                        <option>17</option>
                        <option>18</option>
                        <option>19</option>
                        <option>20</option>
                    </select>
                                    </span>
                                    <span style="margin-left:15px;">最大20张</span>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <button type="submit" class="btn btn-ld btn-primary btn-block">购买</button>
                            </div>
                        </div>
                    </div>
                </form:form>
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
       var url = location.search; //获取url中"?"符后的字串
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
            url: "getEventList.form",
            data: theRequest,
            dataType: 'json',
            success: function (data) {
                console.log("ajax success");
                for(var i=0;i<data.length;i++){
                    var eventId = data[i].eventid;
                    var title = data[i].title;
                    var city = data[i].city;
                    var description = data[i].description;
                    var venueId = data[i].venueid;
                    var venueName = data[i].venueName;
                    var datetime = data[i].time;
                    var time = (new Date(parseFloat(datetime))).format("yyyy-MM-dd hh:mm:ss");
                    var price1 = data[i].price1;
                    var price2 = data[i].price2;
                    var price3 = data[i].price3;
                    var price4 = data[i].price4;
                    var price5 = data[i].price5;
                    var imgUrl = data[i].imgUrl;
                    addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5);
                }
            }
        });
   });

   function addEventDiv(eventId, imgUrl, city, title, description, venueName, venueId, time, price1, price2, price3, price4, price5){

       var logged = '${!empty(sessionScope.CURRENT_USER_NAME)}';
       console.log(logged);

        var dl = document.getElementById("events_dl");
        var dd = document.createElement("dd");
        dd.setAttribute("class","event-dd");
        var cssText = "background-image:url("+ imgUrl+");";
        dd.setAttribute("style",cssText);

        var a1 = document.createElement("a");
        a1.setAttribute("href","#");
        var h3 = document.createElement("h3");
        var cityAndTitle = "【"+city+"】"+title;
        h3.innerHTML = cityAndTitle;
        a1.appendChild(h3);
        dd.appendChild(a1);

        var br = document.createElement("br");
        dd.appendChild(br);

        var p1 = document.createElement("p");
        var span1 = document.createElement("span");
        span1.innerHTML = description;
        p1.appendChild(span1);
        dd.appendChild(p1);

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
        span4.innerHTML = price1;
        var span5 = document.createElement("span");
        span5.innerHTML = "元起";
        p4.appendChild(span4);
        p4.appendChild(span5);
        dd.appendChild(p4);

        var p5 = document.createElement("p");
        var a2 = document.createElement("a");
        a2.setAttribute("href","#");
        a2.setAttribute("class","btn btn-primary");
        a2.setAttribute("style","margin-right:15px");
        a2.innerHTML = "立即购票";
       if(logged==="true"){
           a2.setAttribute("data-toggle","modal");
           a2.setAttribute("data-target","#purchaseModal");
           var onclick = "openModal("+eventId+","+venueId+","+price1+","+price2+","+price3+","+price4+","+price5+")";
           a2.setAttribute("onclick",onclick);
       }else {
           a2.setAttribute("onclick","alert('请先登录！')");
       }
//        var a3 = document.createElement("a");
//        a3.setAttribute("href","#");
//        a3.setAttribute("class","btn btn-primary");
//        a3.innerHTML = "选座购票";
//       if(logged==="true"){}else {
//           a3.setAttribute("onclick","alert('请先登录！')");
//       }
        p5.appendChild(a2);
//        p5.appendChild(a3);
        dd.appendChild(p5);

        dl.appendChild(dd);
        var hr = document.createElement("hr");
        dl.appendChild(hr);
    }

   function openModal(eventId, venueId, price1, price2, price3, price4, price5){
       $('#event_id').val(eventId);
       $('#venue_id').val(venueId);
       var memberId = '<%=(Integer) request.getSession().getAttribute("CURRENT_USER_ID")%>';
       $('#member_id').val(memberId);
       $('#optionsRadios1').val(price1);
       $('#optionsRadios2').val(price2);
       $('#optionsRadios3').val(price3);
       $('#optionsRadios4').val(price4);
       $('#optionsRadios5').val(price5);
       $('#price1').val(price1);
       $('#price2').val(price2);
       $('#price3').val(price3);
       $('#price4').val(price4);
       $('#price5').val(price5);
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