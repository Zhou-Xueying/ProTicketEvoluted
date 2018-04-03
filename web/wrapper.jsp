<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/27
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="wrapper">
    <div class="overlay"></div>
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation" style=" font-size:20px;">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand"><a href="#">Bootstrap 3</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=0">全部</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=1">演唱会</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=2">话剧歌剧</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=3">体育赛事</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=4">音乐会</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=5">舞蹈芭蕾</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=6">展览休闲</a></li>
            <li style="line-height:30px"><a href="toDisplay.form?type=7">曲艺杂谈</a></li>
        </ul>
    </nav>

    <div id="page-content-wrapper">
        <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
    </div>
</div>