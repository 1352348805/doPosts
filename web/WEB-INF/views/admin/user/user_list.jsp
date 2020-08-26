<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
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
        <table border="1" width="80%" id="dt-table">

        </table>
        <div id="page">
        </div>
    </div>
</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input id="path" type="hidden" value="<%=path%>" />
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
</body>
<script>
    var path = $("#path").val();

    loadRequestList({action:'userIndexANDSize'});
    layui.use('layer', function(){
        var layer = layui.layer;
    });
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        let count;

        $.ajaxSettings.async = false;
        $.post(path + '/admin',{action :'userCount'},function (result) {
            count = result.data;
        },'json');
        $.ajaxSettings.async = true;
        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,limit: 10
            ,count: count //数据总数，从服务端得到
            ,
            jump: function(e, first){ //触发分页后的回调
                if(!first){ //一定要加此判断，否则初始时会无限刷新
                    let pageIndex = e.curr; //当前页
                    let pageSize = e.limit;
                    let data = {
                        action:'userIndexANDSize',
                        pageIndex : pageIndex,
                        pageSize : pageSize
                    }
                    loadRequestList(data);
                }
            }
        });
    });
    function loadRequestList(data) {
        $.post(path + '/admin',data,function (result) {
            if (result.code ==200) {
                let data = result.data;
                let html = "<tr>\n" +
                    "                <th>头像</th>\n" +
                    "                <th>账号</th>\n" +
                    "                <th>密码</th>\n" +
                    "                <th>昵称</th>\n" +
                    "                <th>权限</th>\n" +
                    "                <th>操作</th>\n" +
                    "</tr>";
                for (let i = 0;i < data.length; i++) {
                    html += "<tr>\n" +
                        "<th width=\"10%\">"+data[i].favicon+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userLoginName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userPassword+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userName+"</th>\n" +
                        "<th width=\"10%\">";
                           if (data[i].group == 'admin') {
                               html += "管理员";
                           } else if (data[i].group == 'user') {
                               html += "用户";
                           }
                    html+="</th>"
                    html+="<th width=10%>\n" +
                        "    <button class=\"layui-btn layui-btn-xs\" title=\"修改\" onclick=\"window.location.href='<%=path%>/admin?action=update&userId="+data[i].userId+"'\">\n" +
                        "        <i class=\"layui-icon\">\n" +
                        "        </i>\n" +
                        "    </button>\n" +
                        "    <button class=\"layui-btn layui-btn-xs\" title=\"删除\" onclick=\"window.location.href='<%=path%>/admin?action=delete&userId="+data[i].userId+"'\">\n" +
                        "        <i class=\"layui-icon\">\n" +
                        "        </i>\n" +
                        "    </button>\n" +
                        "</th>"


                    html+="</tr>"
                }
                $("#dt-table").html(html);
            }
        },'json');
    };
</script>

</html>
