<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <div style="padding-top: 0px;height: 200px;background: url('${pageContext.request.contextPath }/static/images/head/gnydy.png') no-repeat">
        <div class="container-fluid">

            <div class="mobile-menu-overlay"></div>

            <nav role="navigation" class="probootstrap-nav hidden-xs" style="padding-right: 60px;margin:20px 100px 0px 0px;float: right;">
                <ul class="probootstrap-main-nav" style="text-shadow: 0 1px 1px rgba(0,0,0,.3);">
                    <c:choose>
                        <c:when test="${user == null}">
                            <li><a id="blink" href="${pageContext.request.contextPath }/user?action=toLogin" style="color: red" >登录</a></li>
                            <li><a href="${pageContext.request.contextPath }/user?action=toRegister" style="color: red">注册</a></li>
                        </c:when>
                        <c:otherwise>
                            <li style="color: red;">欢迎你: ${user.userName}</li>
                            <li style="color: #fff;"><a href="${pageContext.request.contextPath }/user?action=index">首页</a></li>
                            <li style="color: #fff;"><a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${user.userId}">个人中心</a></li>
                            <li style="color: #fff;"><a href="${pageContext.request.contextPath }/user?action=exit">退出</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <div class="extra-text visible-xs">
                    <ul class="social-buttons">
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-facebook"></i></a></li>
                        <li><a href="#"><i class="icon-instagram2"></i></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>