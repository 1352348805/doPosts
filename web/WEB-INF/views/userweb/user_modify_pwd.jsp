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
                            <td>旧密码：</td>
                            <td>
                                <input type="password" name="oldpassword" id="oldpassword" value="">
                                <font style="float: right;" color="red"></font>
                            </td>
                        </tr>
                        <tr>
                            <td>新密码：</td>
                            <td>
                                <input type="password" name="oldpassword" id="newpassword" value="">
                                <font color="red"></font>
                            </td>
                        </tr>
                        <tr>
                            <td>确认新密码：</td>
                            <td>
                                <input type="password" name="oldpassword" id="rnewpassword" value="">
                                <font color="red"></font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button id="save" style="background-color: #5994d6;" class="layui-btn" >
                                    <i class="layui-icon">&#xe608;</i> 修改
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <jsp:include page="../common/user/user_center_leftnar.jsp" />
        <div class="clearfix"> </div>
    </div>
</div>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/jquery-form.js"></script>
<script>
    var path = $("#path").val();
    layui.use('layer', function(){
        var layer = layui.layer;
    });

    $(function () {
        var isTrue = false;
        function checkInput() {
            let oldpwd = $("#oldpassword").val();
            if (oldpwd.trim() == '') {
                $("#oldpassword").val('');
                $("#oldpassword").next().html('旧密码不能为空')
                return false;
            }
            return true;
        }


        $("#oldpassword").blur(function () {
            let oldpwd = $("#oldpassword").val();
            let data = {
                action : 'checkPwd',
                oldpassword : oldpwd
            }
            $.post(path + '/user',data,function (result) {
                if (result.code == 200) {
                    isTrue = true;
                    $("#oldpassword").next().css('color','green');
                    $("#oldpassword").next().html('√')
                    return true;
                } else {
                    layer.msg(result.message);
                    return false;
                }
            },'json');
        });

        $("#save").click(function () {
            if (isTrue) {
                let oldpwd = $("#oldpassword").val();
                let newpwd = $("#newpassword").val();
                let rnewpwd = $("#rnewpassword").val();
                if (newpwd.trim() == '') {
                    layer.msg("新密码不能为空");
                    return;
                }
                $("#newpassword").next().html('');
                if (rnewpwd.trim() != newpwd.trim() ) {
                    layer.msg("两次密码不一致");
                    return;
                }
                let data = {
                    action : 'changePwd',
                    oldpassword : oldpwd,
                    newpassword : newpwd
                }
                $.post(path + '/user',data,function (result) {
                    if (result.code == 200) {
                        layer.msg('修改成功',{
                            time : 1000
                        },function () {
                            location.reload();
                        });
                    } else {
                        layer.msg(result.message);
                    }
                },'json');
            }

        });



    });
</script>
</body>
</html>