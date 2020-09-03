<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        String path = request.getContextPath();
    %>
    <link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/search-form.css">
    <link href="<%=path%>/static/css/forumpark/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--theme-style-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>

    <link href="<%=path%>/static/css/forumpark/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script src="<%=path%>/static/js/forumpark/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/forumpark/jquery.easydropdown.js"></script>
    <!--script-->
    <style>
        td {
            text-align: center;
        }
    </style>
</head>
<body>
<!--header-->
<jsp:include page="../common/user/head.jsp"/>

<div class="container">
    <div class="banner-menu">

        <div class="shoes-grid">
            <div class="layui-inline wmuSlider example1 slide-grid" >
                <table class="layui-table" style="margin: 0px;">
                    <tbody>
                    <tr>
                        <td>当前头像</td>
                        <td>
                            <img id="hiphoto" src="http://tb.himg.baidu.com/sys/portrait/item/tb.1.4104e3d4.WPDFxvSZQzvSfh4fxTGA-w?t=1453303238">
                        </td>
                    </tr>
                    <tr>
                        <td>昵称</td>
                        <td>${user.userName}</td>
                    </tr>
                    <tr>
                        <td>账号</td>
                        <td>${user.userLoginName}</td>
                    </tr>
                    <tr>
                        <td>注册时间</td>
                        <td>${user.createDate}</td>
                    </tr>
                    <tr>
                        <td>用户状态</td>
                        <td>${user.status==1?'正常':'封禁'}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="sub-cate" style="position: fixed;left: 24.3%;width: 13%;">
            <div class=" top-nav rsidebar span_1_of_left">
                <h3 class="cate">个人中心</h3>
                <ul class="menu">
                    <ul class="kid-menu ">
                        <li><a href="${pageContext.request.contextPath}/user?action=toModifyUserInfo">修改个人信息</a></li>

                    </ul>
                </ul>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>

</body>
</html>