<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: W x c
  Date: 2020/8/21
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<table border="1" width="80%">
    <tr>
        <th>头像</th>
        <th>账号</th>
        <th>密码</th>
        <th>昵称</th>
        <th>权限</th>
    </tr>
    <c:forEach items="${user}" var="cnm">
        <tr>
            <td>${cnm.favicon}</td>
            <td>${cnm.userLoginName}</td>
            <td>${cnm.userPassword}</td>
            <td>${cnm.userName}</td>
            <c:choose>
                <c:when test="${cnm.group==admin}">
                    管理员
                </c:when>
                <c:when test="${cnm.group!=admin}">
                /._*_.\
                </c:when>
            </c:choose>
            <td></td>
        </tr>
    </c:forEach>
</table>
<div>
    <span><a>首页</a></span>
    <span><a>上一页</a></span>
    <span><a>下一页</a></span>
    <span><a>尾页</a></span>
</div>
</body>
</html>
