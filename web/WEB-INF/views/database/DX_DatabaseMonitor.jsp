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
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
    <style id="LAY_layadmin_theme">.layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}.layui-layout-admin .layui-logo{background-color:#20222A !important;}</style>
</head>
<body>
<div class="layui-card-body" style="padding: 0 0 0 0">
    <ul class="layui-nav" lay-filter="component-nav">
        <li class="layui-nav-item"><a href="javascript:">接口调用统计</a></li>
        <li class="layui-nav-item">
            <a href="javascript:">产品<span class="layui-nav-more"></span></a>
            <dl class="layui-nav-child layui-anim layui-anim-upbit">
                <dd><a href="javascript:">选项1</a></dd>
                <dd><a href="javascript:">选项2</a></dd>
                <dd><a href="javascript:">选项3</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:">大数据</a></li>
        <li class="layui-nav-item">
            <a href="javascript:">解决方案<span class="layui-nav-more"></span></a>
            <dl class="layui-nav-child layui-anim layui-anim-upbit">
                <dd class="layui-this"><a href="javascript:">移动模块</a></dd>
                <dd class=""><a href="javascript:">后台模版</a></dd>
                <dd class=""><a href="javascript:">选中项</a></dd>
                <dd class=""><a href="javascript:">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:">社区</a></li>
        <span class="layui-nav-bar" style="left: 20px; top: 55px; width: 0px; opacity: 0;"></span>
    </ul>
</div>
</body>
</html>
