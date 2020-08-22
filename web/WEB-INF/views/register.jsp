<%--
  Author: asuk
  DateTime: 2020/8/18 23:35
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
    <title>注册</title>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
    <style>
        body{
            background-size: cover;
            background-repeat: no-repeat;
        }

        .layadmin-user-login-main{
          border: 1px;
        }
        .layadmin-user-login layadmin-user-display-show{
            border: 1px;
        }
    </style>
</head>
<body style="overflow:-Scroll;overflow-x:hidden;">
<video src="/doPosts/static/video/edit.mp4" style="z-index: -1; width:100%;height: 100%;object-fit: cover;" position: absolute; loop="loop" autoplay="autoplay"
       muted="muted" type="video/mp4"></video>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="position: absolute;left: 33%;top: -100px">
    <div class="layadmin-user-login-main" >
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>欢迎注册来贴吧</h2>
            <p>灵感 , 来源于有趣的人</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
                <input type="text" id="LAY-user-login-userName" name="userLoginName" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="userPassword" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
                <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-nickname"></label>
                <input type="text" name="userName" id="LAY-user-login-nickname" lay-verify="nickname" placeholder="昵称" class="layui-input">
            </div>
            <div class="layui-form-item">
                <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议" checked>
            </div>
            <div class="layui-form-item">
                <button id="but-register" class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号注册</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="<%=path%>/user?action=toLogin" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
            </div>
        </div>
    </div>

    <jsp:include page="common/admin/footer.jsp" />

</div>

<script>
    $(function () {
        layui.use('layer', function () {
            let layer = layui.layer;
        })
    });

    function CheckInput() {
        let userLoginName = $("#LAY-user-login-userName").val();
        let userPassword = $("#LAY-user-login-password").val();
        let repass = $("#LAY-user-login-repass").val();
        let nike = $("#LAY-user-login-nickname").val();
        if (userLoginName == null || userLoginName.length == 0) {
            layer.msg('请输入用户名', {
                time: 2000
            });
            return false;
        }
        if (userPassword == null || userPassword.length == 0) {
            layer.msg('请输入密码', {
                time: 2000
            });
            return false;
        }
        if(repass==null || repass.length==0){
            layer.msg('请再次输入您的密码',{
                time: 2000
            });
            return false;
        }
        if (nike == null || nike.length == 0) {
            layer.msg('请输入昵称--《例如:李阳是猪、李阳小贱人、、等等》', {
                time: 2000
            });
            return false;
        }
        if (userPassword != repass) {
            layer.msg('两次密码不一致', {
                time: 2000
            });
            return false;
        }
        return true;
    }

    $("#but-register").click(function () {
        if (!CheckInput()) {
            return false;
        }
        $.ajax({
            url: "/doPosts/user",
            type: "post",
            data: {
                action: "registerUser",
                'loginName': $("#LAY-user-login-userName").val(),
                'password': $("#LAY-user-login-password").val(),
                'repass': $("#LAY-user-login-repass").val(),
                'name': $("#LAY-user-login-nickname").val()
            },
            success: function (jsonStr) {
                if (jsonStr.code === 200) {
                    layer.msg("注册成功！,请返回登录页面", {
                        icon: 6, btn: ['好的'],
                    });
                } else if (jsonStr.code === 500) {
                    layer.msg("注册失败，可能该用户已存在！", {
                        icon: 6, btn: ['好的'],
                    });
                }
                console.log(jsonStr);
            },
            dataType: "json"
        })
        return false;
    })
</script>

<%--<script>--%>
<%--    layui.config({--%>
<%--        base: '../../layuiadmin/' //静态资源所在路径--%>
<%--    }).extend({--%>
<%--        index: 'lib/index' //主入口模块--%>
<%--    }).use(['index', 'user'], function(){--%>
<%--        var $ = layui.$--%>
<%--            ,setter = layui.setter--%>
<%--            ,admin = layui.admin--%>
<%--            ,form = layui.form--%>
<%--            ,router = layui.router();--%>

<%--        form.render();--%>

<%--        //提交--%>
<%--        form.on('submit(LAY-user-reg-submit)', function(obj){--%>
<%--            var field = obj.field;--%>

<%--            //确认密码--%>
<%--            if(field.password !== field.repass){--%>
<%--                return layer.msg('两次密码输入不一致');--%>
<%--            }--%>

<%--            //是否同意用户协议--%>
<%--            if(!field.agreement){--%>
<%--                return layer.msg('你必须同意用户协议才能注册');--%>
<%--            }--%>

<%--            //请求接口--%>
<%--            admin.req({--%>
<%--                url: layui.setter.base + 'json/user/reg.js' //实际使用请改成服务端真实接口--%>
<%--                ,data: field--%>
<%--                ,done: function(res){--%>
<%--                    layer.msg('注册成功', {--%>
<%--                        offset: '15px'--%>
<%--                        ,icon: 1--%>
<%--                        ,time: 1000--%>
<%--                    }, function(){--%>
<%--                        location.hash = '/user/login'; //跳转到登入页--%>
<%--                    });--%>
<%--                }--%>
<%--            });--%>

<%--            return false;--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
