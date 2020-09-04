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
                            <c:choose>
                                <c:when test="${user.favicon!=null &&user.favicon!=''}">
                                    <img class="layui-upload-img" src="${pageContext.request.contextPath }${user.favicon}" id="test-upload-normal-img">
                                </c:when>
                                <c:otherwise>
                                    <img class="layui-upload-img" src="${pageContext.request.contextPath }/static/images/user_default_icon.png" id="test-upload-normal-img">
                                </c:otherwise>
                            </c:choose>
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
        <jsp:include page="../common/user/user_center_leftnar.jsp" />
        <div class="clearfix"> </div>
    </div>
</div>

</body>
</html>