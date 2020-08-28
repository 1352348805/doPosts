<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
</head>
<body>
<div>                           <!--跳转上一级页面 -->
    <input type="hidden" value="<%=request.getHeader("Referer")%>" id="hiddenid"/>
    <table>
<%--        <p style="visibility:hidden">ID:<input type="hidden" name="userId" readonly="readonly" id="userid" value="${sb.userId}"></p>--%>
        <p>账号:<input name="userLoginName" type="text" id="userLoginName" value="${sb.userLoginName}"></p>
        <p>密码:<input name="userPassword" type="text" id="userPassword" value="${sb.userPassword}"></p>
        <p>昵称:<input name="userName" type="text" id="userName" value="${sb.userName}"></p>
        <p>权限:
            <select id="group">
                <option value="admin" >超级管理员</option>
                <option value="user">用户</option>
                <option value="">用户</option>
            </select>
        </p>
        <p>
            <button value="修改" type="submit" id="buttons">修改</button>
        </p>
    </table>
</div>
</body>
<script src="<%=path%>/static/js/jquery-3.3.1.min.js"></script>
<script>

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
            success: function (jsonStr) {
                if("false" == jsonStr){
                    alert("当前用户名已存在");
                }
                else{
                   alert("修改成功"+$("#hiddenid").val());
                }
                <!--返回上一级页面-->
                window.location.href=$("#hiddenid").val();
            }, error: function () {
                alert("修改失败,可能是用户名已存在");
            }
        })
    });
</script>
</html>
