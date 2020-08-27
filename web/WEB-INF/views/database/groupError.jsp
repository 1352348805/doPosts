<%--
  Created by IntelliJ IDEA.
  User: 17868
  Date: 2020/8/26
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>DX_Database 监控主页</title>
    <link rel="icon" href="<%=path%>/static/images/database/database.ico">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
</head>
<body style="overflow:hidden" ondragstart="return false" onselectstart="return false"
    onresize="{
        loginBody.css('left', body.innerWidth()/2 - 500/2);
        loginBody.css('top', body.innerHeight()/2 - 500/2);
    }"
>
    <div style="margin: 0; border: 0; padding: 0; height: 100%; width: 100%;">
        <div id="loginBody" style="position: absolute; margin: 0; border: 0; padding: 0; height: 500px; width: 500px; background-color: rgba(255,255,255,0.5); border-radius: 15px;"></div>
        <div style="position: absolute; margin: 0; border: 0; padding: 0; height: 100%; width: 100%; box-shadow: 2px 2px 2px 2px rgba(0,0,0,.3); z-index: -1; filter: blur(4px);">
            <img src="<%=path%>/static/images/database/bg.jpg" alt="???">
        </div>
        <script>
            loginBody = $('#loginBody');
            body = $(document.body);
            loginBody.css('left', body.innerWidth()/2 - 500/2);
            loginBody.css('top', body.innerHeight()/2 - 500/2);
        </script>
    </div>
</body>
</html>
