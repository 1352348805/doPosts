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
                <form id="u-m-form" enctype="multipart/form-data" action="javascript:;" method="post">
                    <table class="layui-table" style="margin: 0px;">
                        <tbody>
                        <tr>
                            <td>当前头像</td>
                            <td>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" src="http://tb.himg.baidu.com/sys/portrait/item/tb.1.4104e3d4.WPDFxvSZQzvSfh4fxTGA-w?t=1453303238" id="test-upload-normal-img">
                                    <p id="test-upload-demoText"></p>
                                </div>
                                <div style="padding-left: 40%;"><input id="pic" onchange="selectPic(this)" type="file" accept="undefined" name="file"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>昵称</td>
                            <td><input type="text" value="${user.userName}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button onclick="modifyUser()" style="background-color: #5994d6;" class="layui-btn" >
                                    <i class="layui-icon">&#xe608;</i> 修改
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
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
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/jquery-form.js"></script>
<script>
    var path = $("#path").val();
    function selectPic(ths) {
        if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ths.value)) {
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
            ths.value = "";
            return false;
        }
        var fileSize = 0;
        if (!ths.files) {
            var filePath = ths.value;
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            var file = fileSystem.GetFile(filePath);
            fileSize = file.Size;
        } else {
            fileSize = ths.files[0].size;
        }
        var size = fileSize / 1024;
        if (size > 5000) {
            alert("上传的不能大于5M！");
            ths.value = "";
            return false;
        }

        var url = null;
        var fileObj = document.getElementById("pic").files[0];
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(fileObj);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(fileObj);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(fileObj);
        }
        $("#test-upload-normal-img").attr("src", url);
    }

    function modifyUser() {

        var options = {

            // 规定把请求发送到那个URL

            url: path + "/user?action=modifyUserInfo",

            // 请求方式

            type: "post",

            // 服务器响应的数据类型

            dataType: "json",

            // 请求成功时执行的回调函数

            success: function(data, status, xhr) {


            }

        };

        $("#u-m-form").ajaxSubmit(options);

    }
</script>
</body>
</html>