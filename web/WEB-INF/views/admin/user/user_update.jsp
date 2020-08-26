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
<div>
    <table>
        <p>ID:<input name="userId" readonly="readonly" id="userid" value="${sb.userId}"></p>
        <p>账号:<input name="userLoginName" type="text" id="userLoginName" value="${sb.userLoginName}"></p>
        <p>密码:<input name="userPassword" type="text" id="userPassword" value="${sb.userPassword}"></p>
        <p>昵称:<input name="userName" type="text" id="userName" value="${sb.userName}"></p>
        <p>权限:
            <select name="${sb.group}" id="group">
                <option value="管理员">管理员</option>
                <option value="user">user</option>
                <option value="奥特曼打爹摇" style="background-color: rgba(219,160,200,0.88)">奥特曼爹打瑶</option>
                <option value="我是李二狗">我是李二狗</option>
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

            }, error: function () {
                alert("11-0");
            }

        })
    });


    $(function () {
        layui.use('layer', function () {
            let layer = layui.layer;

        })
    });

    function CheckInput() {
        let userName = $("#userName").val();
        let userLoginName = $("#userLoginName").val();
        let userPassword = $("#userPassword").val();
        let group = $("#group").val();
        if (userLoginName == null || userLoginName.length == 0) {
            layer.msg('请输入你的账号', {
                time: 2000
            });
            return false;
        }
        if (userPassword == null || userPassword.length == 0) {
            layer.msg('请输入你的密码', {
                time: 2000
            });
            return false;
        }
        if (userName == null || userName.length == 0) {
            layer.msg('请输入你的昵称', {
                time: 2000
            });
            return false;
        }

        //  $("#buttons").click(function () {
        //      if (!CheckInput()) {
        //          return false;
        //      }
        //
        // })
    }
</script>
</html>
