<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/8/28
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
%>
<html>
<head>
    <title>图片上传</title>
</head>
<body>

<form method="post" action="<%=path%>/test.jsp" id="form1" enctype="multipart/form-data" class="contact-form">
    <div>
							<span> <label> 单张照片* </label>
							</span> <span> <input name="src" type="file"/>
							</span>
    </div>

    <div>
							<span> <input type="submit" value="提交" name="tijiao">
							</span>
    </div>
</form>

</body>
</html>
