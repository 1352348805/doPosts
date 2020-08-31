<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <script src="<%=path%>/static/js/jquery.js"></script>
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            var path = $("#path").val();
            layui.use('layer', function(){
                let layer = layui.layer;
            });
            function login() {
                var userCode = $("#userCode").val();
                var userPassword = $("#userPassword").val();
                var data = {
                    action : 'login',
                    "userCode":userCode,
                    "userPassword":userPassword
                };

                $.post(path + "/admin",data,function (result) {
                    if (result.code == 200) {
                        location.href = path + '/admin?action=index';
                    }
                    else{
                        layer.msg(result.message, {
                            icon: 6, btn:['好的'],
                        });
                    }
                },"JSON");
            }

            $("#login_btn").click(login);

        });
    </script>
</head>
<body class="login_bg">
<input type="hidden" id="path" value="<%=path%>"/>
    <section class="loginBox">
        <header class="loginHeader">
            <h1>超市订单管理系统</h1>
        </header>
        <section class="loginCont">
	        <div class="loginForm">
				<div class="info"></div>
				<div class="inputbox">
                    <label for="userCode">用户名：</label>
					<input value="admin" type="text" class="input-text" id="userCode" name="userCode" placeholder="请输入用户名" required/>
				</div>
				<div class="inputbox">
                    <label for="userPassword">密码：</label>
                    <input value="1234567" type="password" id="userPassword" name="userPassword" placeholder="请输入密码" required/>
                </div>
				<div class="subBtn">
                    <input type="submit" id="login_btn" value="登录"/>
                    <input type="reset" value="重置"/>
                </div>
			</div>
        </section>
    </section>
</body>
</html>
