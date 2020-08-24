<%--
  Created by IntelliJ IDEA.
  User: 17868
  Date: 2020/8/22
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>DX_Database 监控主页</title>
    <link rel="icon" href="<%=path%>/static/images/database/database.ico">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
    <script>
        function mouseOnTitle(titleDom) {
            let title = $(titleDom);
            let left = title.offsetLeft;
            console.log(title.text());
            console.log(left);
        }
    </script>
</head>
<body>
<div class="layui-card-body" style="padding: 0 0 0 0">
    <ul class="layui-nav" lay-filter="component-nav">
        <li style="display: inline-block; width:164px;position: relative;vertical-align: middle;margin-right: 25px;margin-left: 6px;text-align: -webkit-match-parent;">
            <div>
                <img src="<%=path%>/static/images/database/database.png" alt="???" height="30" width="30">
                <div style="color: white;font-size: 14px;line-height: 58px;text-align: -webkit-match-parent;display: inline-block">DX_Database数据库</div>
            </div>
        </li>
        <li class="layui-nav-item layui-this" onmouseover="mouseOnTitle(this)"><a href="javascript:">概览</a></li>
        <li class="layui-nav-item"><a href="javascript:">SQL监控</a></li>
        <li class="layui-nav-item ">
            <a href="javascript:">数据库接口调用统计</a>
        </li>
        <li class="layui-nav-item"><a href="javascript:">数据库</a></li>
        <span class="layui-nav-bar" style="left: 150px; top: 55px; width: 0; opacity: 0;"></span>
    </ul>
</div>
<div id="content" style="height: 100%; width: 100%;">
    <div id="overview" style="height: 100%; width: 100%;" ></div>
    <div id="sql_monitor" style="height: 100%; width: 100%;display: none;" ></div>
    <div id="interface_monitor" style="height: 100%; width: 100%;display: none;" ></div>
    <div id="database" style="height: 100%; width: 100%;display: none;" ></div>
</div>
</body>
</html>
