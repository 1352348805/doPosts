<%--
  Author: asuk
  DateTime: 2020/9/4 13:52
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sub-cate" style="position: fixed;left: 24.3%;width: 13%;">
    <div class=" top-nav rsidebar span_1_of_left">
        <h3 class="cate">
            ${u.userId eq user.userId ? '个人中心':'Ta的主页'}
        </h3>
        <ul class="menu">
            <ul class="kid-menu ">
                <c:if test="${u.userId eq user.userId}">
                    <li><a href="${pageContext.request.contextPath}/user?action=toModifyUserInfo">修改个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user?action=toModifyUserPwd">修改密码</a></li>
                </c:if>
            </ul>
        </ul>
    </div>
</div>
