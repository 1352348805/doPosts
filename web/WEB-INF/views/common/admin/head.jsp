<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/3
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="publicHeader">
    <h1>来贴管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${sessionScope.user.userName }</span> , 欢迎你！</p>
        <a href="<%=path%>/admin?action=exit">退出</a>
    </div>
</header>