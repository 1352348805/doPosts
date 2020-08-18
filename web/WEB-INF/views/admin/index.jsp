<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>来贴管理系统</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css" />
</head>
<body>
<!--头部-->
    <%@include file="../common/head.jsp"%>
<!--时间-->
<%@include file="../common/time.jsp"%>
 <!--主体内容-->
 <section class="publicMian ">
     <%@include file="../common/leftnav.jsp"%>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
	<div class="right">
        <img class="wColck" src="<%=path%>/static/images/admin/clock.jpg" alt=""/>
        <div class="wFont">
<%--            <h2>${sessionScope.user.userName }</h2>--%>
            <p>欢迎来到来贴管理系统!</p>
        </div>
    </div>
</section>
<footer class="footer">
    版权归来贴项目组
</footer>
<script type="text/javascript" src="<%=path%>/static/js/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
</body>
</html>