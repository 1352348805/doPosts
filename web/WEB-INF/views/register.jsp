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
    <title>注册 </title>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
</head>
<script src="<%=path%>/static/js/jquery.js"></script>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>来贴用户注册</h2>
            <p>灵感 , 来源于有趣的人</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
                <input type="text" name="userLoginName" id="LAY-user-login-userName" placeholder="用户名" class="layui-input">
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
        $("#but-register").click(function () {
           $.ajax({
               url:"<%=path%>/user",
               type:"post",
               data:{
                   action:"registerUser",
                   loginName:$("#LAY-user-login-userName").val(),
                   password:$("#LAY-user-login-password").val(),
                   repass:$("#LAY-user-login-repass").val(),
                   name:$("#LAY-user-login-nickname").val()
               },
               success: function (jsonStr) {
                   var result=eval("("+jsonStr+")")
                   showMessage(result.message);

               }
           })
        })
    })
    
</script>
<script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
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
