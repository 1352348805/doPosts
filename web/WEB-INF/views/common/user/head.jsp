<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <div style="padding-top: 0px;height: 200px; background: url('${pageContext.request.contextPath }/static/images/head/gnydy.png') no-repeat">
        <div class="container-fluid">

            <div class="mobile-menu-overlay"></div>

            <nav role="navigation" class="probootstrap-nav hidden-xs" style="padding-right: 60px;margin-right: 100px;float: right;">
                <ul class="probootstrap-main-nav">
                    <c:choose>
                        <c:when test="${user == null}">
                            <li><a href="${pageContext.request.contextPath }/user?action=toLogin" >登录</a></li>
                            <li><a href="${pageContext.request.contextPath }/user?action=toRegister">注册</a></li>
                        </c:when>
                        <c:otherwise>
                            <li style="color: #fff;">欢迎你: ${user.userName}</li>
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
