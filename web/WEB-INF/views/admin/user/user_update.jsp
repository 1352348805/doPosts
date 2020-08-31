<%--
  分类修改
  Author: asuk
  DateTime: 2020/8/20 16:01
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>分类修改</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
</head>
<body>
<!--头部-->
<%@include file="../../common/admin/head.jsp" %>
<!--时间-->
<%@include file="../../common/admin/time.jsp" %>
<!--主体内容-->
<section class="publicMian ">
    <%@include file="../../common/admin/leftnav.jsp" %>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <div class="right" style="text-align: center;">
        <input type="hidden" value="<%=request.getHeader("Referer")%>" id="hiddenid"/>
        <div class="layui-inline" >
            <table class="layui-table" style="margin: 20% auto;">
                <tbody>
                <tr>
                    <td colspan="2" style="text-align: center;font-size: 20px;">
                        修改用户信息
                    </td>
                </tr>

<%--                <tr>--%>
<%--                    <td align="right">账号</td>--%>
<%--                    <td style="font-family:'宋体';">--%>
<%--                        <input type="text" name="userLoginName" value="${sb.userLoginName}" class="add_ipt" id="name">--%>
<%--                    </td>--%>
<%--                </tr>--%>
                <tr>
                    <td align="right">
                        密码
                    </td>
                    <td>
                        <input type="text" id="userPassword" value="${sb.userPassword}" class="add_ipt">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        昵称
                    </td>
                    <td>
                        <input type="text" id="userName" value="${sb.userName}" class="add_ipt">
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">分类级别</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="type" style="background-color:#f6f6f6;" id="group">
                            <option value="admin" >超级管理员</option>
                            <option value="user">用户</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <button style="background-color: #5994d6;margin-left: 40%;" id="buttons" class="layui-btn layui-btn-sm">
                            <i class="layui-icon">&#xe608;</i> 修改
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    layui.use('layer', function(){
        let layer = layui.layer;
    });

    $("#buttons").click(function () {

        $.ajax({
            url: "<%=path%>/admin?action=updateTwa",
            type: "post",
            data: {
                'userLoginName': $("#userLoginName").val(),
                'userPassword': $("#userPassword").val(),
                'userName': $("#userName").val(),
                'group': $("#group").val(),
                'userId': ${sb.userId}
            },
            dataType: "json",
            success: function (jsonStr) {
                if(200 == jsonStr.code){
                    layer.msg("修改成功", {
                        icon: 6, btn:['好的'],
                    },function () {
                        <!--返回上一级页面-->
                        window.location.href=$("#hiddenid").val();
                    });
                }
                else{

                }
            }, error: function () {
                alert("修改失败,可能是用户名已存在");
            }
        })
    });
</script>

</body>
</html>
