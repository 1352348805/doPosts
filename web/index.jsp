<%@ page import="com.doposts.utils.DatabaseUtil" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/8/18
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test-page</title>
</head>
<body>
    <%
        Connection con = null;
        try {
           con = DatabaseUtil.getConnection();
            out.print("连接数据库成功：" + con);
        } catch (Exception e) {
            out.print("数据库连接错误，请检查配置文件！！！");
        } finally {
            DatabaseUtil.close(con);
        }

    %>
</body>
</html>
