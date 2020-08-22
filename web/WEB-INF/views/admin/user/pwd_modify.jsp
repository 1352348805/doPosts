<%--
  后台主页
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
<head lang="en">
    <meta charset="UTF-8">
    <title>来贴管理系统</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css" />
</head>
<body>
<!--头部-->
    <%@include file="../../common/admin/head.jsp"%>
<!--时间-->
<%@include file="../../common/admin/time.jsp"%>
 <!--主体内容-->
 <section class="publicMian ">
     <%@include file="../../common/admin/leftnav.jsp"%>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <div class="right">
         <div class="location">
             <strong>你现在所在的位置是:</strong>
             <span>密码修改页面</span>
         </div>
         <div class="providerAdd">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <div class="info">${message}</div>
             <div class="">
                 <label for="oldPassword">旧密码：</label>
                 <input type="password" name="oldpassword" id="oldpassword" value="">
                 <font color="red"></font>
             </div>
             <div>
                 <label for="newPassword">新密码：</label>
                 <input type="password" name="newpassword" id="newpassword" value="">
                 <font color="red"></font>
             </div>
             <div>
                 <label for="rnewpassword">确认新密码：</label>
                 <input type="password" name="rnewpassword" id="rnewpassword" value="">
                 <font color="red"></font>
             </div>
             <div class="providerAddBtn">
                 <!--<a href="#">保存</a>-->
                 <input type="button" name="save" id="save" value="保存" class="input-button">
             </div>
         </div>
     </div>
</section>
<footer class="footer">
    版权归来贴项目组
</footer>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
</body>
</html>