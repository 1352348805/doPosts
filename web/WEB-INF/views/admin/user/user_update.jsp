<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: W x c
  Date: 2020/8/25
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
</head>
<body>
<table>
    <tr>
        <th>ID:<input name="userId" readonly="readonly" id="userid" value="${sb.userId}"> </th>
        <th>账号:<input name="userLoginName" type="text" id="userLoginName" value="${sb.userLoginName}"></th>
        <th>密码:<input name="userPassword" type="text" id="userPassword" value="${sb.userPassword}"></th>
        <th>昵称:<input name="userName" type="text" id="userName" value="${sb.userName}"></th>
        <th>权限:
            <select name="${sb.group}" id="group" >
                <option value="管理员">管理员</option>
                <option value="user">user</option>
                <option value="奥特曼打爹摇" style="background-color: rgba(219,160,200,0.88)">奥特曼爹打瑶</option>
                <option value="我是李二狗">我是李二狗</option>
            </select></th>
    </tr>
    <button value="修改" type="submit" id="buttons">修改</button>
</table>
</body>
<script>
   $(function () {
       layui.use('layer',function () {
           let layer=layui.layer;
     
       })
   });
   function CheckInput() {
       let userName=$("#userName").val();
       let userLoginName=$("#userLoginName").val();
       let userPassword=$("#userPassword").val();
       let group=$("#group").val();
       if (userLoginName==null || userLoginName.length==0){
           layer.msg('请输入你的账号',{
               time: 2000
           });
           return false;
       }
       if (userPassword==null || userPassword.length==0){
           layer.msg('请输入你的密码',{
               time: 2000
           });
           return false;
       }
       if (userName==null || userName.length==0){
           layer.msg('请输入你的昵称',{
               time: 2000
           });
           return false;
       }

       $("#buttons").click(function () {
            if (!CheckInput()){
                return false;
            }
           $.ajax({
               url: "<%=path%>admin/user/user_update",
               type: "post",
               data: {
                   action: "upate",
                   'userLoginName': $("#userLoginName").val(),
                   'userPassword': $("#userPassword").val(),
                   'userName': $("#userName").val()
               },
               success: function (jsonStr) {
                   if (jsonStr.code === 200) {
                       layer.msg("已修改！,请返回页面", {
                           icon: 6, btn: ['好的'],
                       });
                   } else if (jsonStr.code === 500) {
                       layer.msg("修改失败！，可能该用户已存在！", {
                           icon: 6, btn: ['好的'],
                       });
                   }
                   console.log(jsonStr);
               },
               dataType: "json"
           })
           return  false;
       })
   }
</script>
</html>
