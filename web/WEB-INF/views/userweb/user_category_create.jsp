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

    <link href="<%=path%>/static/css/forumpark/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script src="<%=path%>/static/js/forumpark/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
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
            <div class="layui-inline wmuSlider example1 slide-grid">
                <form id="u-m-form" enctype="multipart/form-data" action="javascript:;" method="post">
                    <table class="layui-table" style="margin: 0px;">
                        <tbody>
                        <tr>
                            <td>分类一</td>
                            <td>
                                <select class="jj" name="categoryLevel1" style="background-color:#f6f6f6;" id="categoryLevel1"
                                        onchange="queryCategoryList(this,'categoryLevel2');">
                                    <option value="0">请选择...</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>分类二</td>
                            <td>
                                <select class="jj" name="categoryLevel1" style="background-color:#f6f6f6;" id="categoryLevel2">
                                    <option value="0">请选择...</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>吧名</td>
                            <td><input type="text" id="className" name="className"/></td></td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td width="135" align="right">二级分类</td>--%>
<%--                            <td>--%>
<%--                                <select class="jj" name="categoryLevel2" style="background-color:#f6f6f6;" id="categoryLevel2" disabled="disabled">--%>
<%--                                    <option value="${postClassList[1].classId}" selected="selected">${postClassList[1].className}</option>--%>
<%--                                </select>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        <tr>
                            <td colspan="2">
                                <button onclick="requestAdd()" class="layui-btn" >
                                    <i class="layui-icon">&#xe608;</i> 申请
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
                <h3 class="cate">
                    建吧申请
                </h3>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery-form.js"></script>
<script>
    var path = $("#path").val();
    layui.use('layer', function(){
        var layer = layui.layer;
    });
    $(function () {
        ajaxQuery(0,'categoryLevel1');
    });

    function ajaxQuery(parentId,selectId) {
        $.ajax({
            url: path + "/postCategory",
            type: "post",
            data: {
                action: "queryCategoryList",
                parentId: parentId
            },
            dataType : 'json',
            success: function (result) {
                if (result.code == 200) {
                    var options = "<option value=''>" + "请选择..." + "</option>";
                    for (var i = 0; i < result.data.length; i++) {
                        var option = "<option value=" + result.data[i].classId + ">" + result.data[i].className + "</option>";
                        options = options + option;
                    }
                    $("#" + selectId).html(options);
                }
            }
        });
    }

    function queryCategoryList(obj, selectId) {
        var parentId = $(obj).val();
        ajaxQuery(parentId,selectId);
    }

    //添加分类方法
    function requestAdd() {
        let className = $("#className").val();
        let parentId;
        //判断一级是否为空
        let level1 = $("#categoryLevel1").val();
        if (level1 == '') {
            layer.msg('请选择一级分类');
            return;
        }
        //判断二级是否为空
        let level2 = $("#categoryLevel2").val();
        if (level2 == '') {
            layer.msg('请选择二级分类');
            return;
        }
        parentId = level2;

        if (className.trim() == '') {
            layer.msg('请填写分类名称');
            return;
        }
        let data = {
            action : 'requestCategory',
            className : className,
            parentId : parentId
        }
        $.post(path + '/user',data,function (result) {
            if (result.code == 200) {
                layer.msg('申请成功!请等待管理员审核',{
                    time : 1000
                },function () {
                    location.href = path + '/user?action=toCategoryCreate';
                });
            }  else if (result.code == 403) {
                alert("未登录,请登录后再操作");
                window.location.href="<%=path%>/user?action=toLogin";
            } else {
                layer.msg(result.message);
            }
        },'json');
    }
</script>
</body>
</html>