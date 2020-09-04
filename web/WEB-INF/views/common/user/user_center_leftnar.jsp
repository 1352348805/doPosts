<%--
  Author: asuk
  DateTime: 2020/9/4 13:52
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sub-cate" style="position: fixed;left: 24.3%;width: 13%;">
    <div class=" top-nav rsidebar span_1_of_left">
        <h3 class="cate">个人中心</h3>
        <ul class="menu">
            <ul class="kid-menu ">
                <li><a href="${pageContext.request.contextPath}/user?action=toModifyUserInfo">修改个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/user?action=toModifyUserPwd">修改密码</a></li>

            </ul>
        </ul>
    </div>
</div>
