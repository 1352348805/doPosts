<%--
  Author: asuk
  DateTime: 2020/8/18 18:50
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>登入 - @asuk</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2 style= "font-family:Stencil ; color: white" >.来贴吧.</h2>
            <p style="color: #ebf4f9">一个有趣的论坛</p>
        </div>
        <form action="<%=path%>/user" method="post" class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <input type="hidden" name="action" value="login" />
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <!--<div class="layui-form-item">-->
            <!--<div class="layui-row">-->
            <!--<div class="layui-col-xs7">-->
            <!--<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>-->
            <!--<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">-->
            <!--</div>-->
            <!--<div class="layui-col-xs5">-->
            <!--<div style="margin-left: 10px;">-->
            <!--<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <!--          <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>-->
            </div>

            <div style="padding-top: 0px;" class="layui-trans layui-form-item layadmin-user-login-other">
                <a href="<%=path%>/user?action=toRegister" class="layadmin-user-jump-change layadmin-link layui-hide-xs">没有账号?点击去注册</a>
            </div>

            <div class="layui-form-item">
                <button id="login-submit" class="layui-btn layui-btn-fluid">登 入</button>
            </div>
            <!--        <div class="layui-trans layui-form-item layadmin-user-login-other">-->
            <!--          <label>社交账号登入</label>-->
            <!--          <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>-->
            <!--          <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>-->
            <!--          <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>-->
            <!--          -->
            <!--          <a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>-->
            <!--        </div>-->
        </form>
    </div>

    <jsp:include page="common/admin/footer.jsp" />

    <!--<div class="ladmin-user-login-theme">
      <script type="text/html" template>
        <ul>
          <li data-theme=""><img src="{{ layui.setter.base }}style/res/bg-none.jpg"></li>
          <li data-theme="#03152A" style="background-color: #03152A;"></li>
          <li data-theme="#2E241B" style="background-color: #2E241B;"></li>
          <li data-theme="#50314F" style="background-color: #50314F;"></li>
          <li data-theme="#344058" style="background-color: #344058;"></li>
          <li data-theme="#20222A" style="background-color: #20222A;"></li>
        </ul>
      </script>
    </div>-->

</div>
<input id="path" type="hidden" value="<%=path%>" />
<script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript">
    var bodyBgs = [];
    bodyBgs[0] = "<%=path%>/static/images/backgroundList/bg1.jpg";
    bodyBgs[1] = "<%=path%>/static/images/backgroundList/bg2.jpg";
    bodyBgs[2] = "<%=path%>/static/images/backgroundList/bg3.jpg";
    bodyBgs[3] = "<%=path%>/static/images/backgroundList/bg4.jpg";
    var randomBgIndex = Math.round( Math.random() * 3 );
    $("body").css("background-image","url("+bodyBgs[randomBgIndex]+")");
</script>
<script>

    $(function () {
        let path = $("#path").val();
      layui.use('layer', function(){
        let layer = layui.layer;
      });

      function CheckInput() {
        let username = $("#LAY-user-login-username").val();
        let password = $("#LAY-user-login-password").val();
        if (username == "" || username.length == 0) {
            layer.msg('请输入用户名',{
                time: 1000
            });
            return false;
        } else if (password == "" || password.length == 0) {
            layer.msg('请输入密码',{
                time: 1000
            });
            return false;
        }
        return true;
      }

      $("#login-submit").click(CheckInput);
    });
$("#login-submit").click(
    function () {
        let username = $("#LAY-user-login-username").val();
        let password = $("#LAY-user-login-password").val();
        $.ajax({
            url:"<%=path%>/user",
            method:"post",
            data:{
                action:"login",
                "username":username,
                "password":password
            },
            success:function (jsonStr) {
                if(jsonStr.code === 200){
                    location.href="<%=path%>/index.jsp";
                }else if(jsonStr.code === 500){
                    layer.msg("用户名或密码不正确！", {
                        icon: 6, btn:['好的'],
                    });
                }
                console.log(jsonStr);
            },
            dataType:"json"
        })
        return false;
    }
)


</script>
</body>
</html>
