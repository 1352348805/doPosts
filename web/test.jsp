<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: leishen
  Date: 2020/8/22
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
    <script>
        layui.use('laypage', function(){
            //执行一个laypage实例
            layui.laypage.render({
                elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
                ,limit: 5
                ,count: ${dataCount} //数据总数，从服务端得到
                ,hash: 'xxx'
                ,curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
                    let page = location.search.match(/page=(\d+)/);
                    return page ? page[1] : 1;
                }(),
                jump: function(e, first){ //触发分页后的回调
                    if(!first){ //一定要加此判断，否则初始时会无限刷新
                        console.log(e);
                        location.href = '?page='+e.curr;
                    }
                }
            });
        });
    </script>
</head>
<body>
    <table border="1">
        <tr>
            <td>用户id</td>
            <td>用户昵称</td>
            <td>账号</td>
            <td>密码</td>
            <td>用户组</td>
        </tr>
        <c:forEach items="${userList}" var="item">
            <tr>
                <td>${item.userId}</td>
                <td>${item.userName}</td>
                <td>${item.userLoginName}</td>
                <td>${item.userPassword}</td>
                <td>${item.group}</td>
            </tr>
        </c:forEach>
    </table>
    <div id="page" style="text-align: center"></div>
</body>
</html>
