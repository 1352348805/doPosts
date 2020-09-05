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
         <!-- 支撑高度 -->
         <div style="height: 30px">

         </div>
         <div class="layui-card-header layuiadmin-card-header-auto">
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                 <div>
                     <div class="widget-body no-padding">
                         <table id="dt-table" class="table table-striped table-bordered table-hover layui-form"
                                style="width:100%;font-size: 14px;">
                             <tr>
<%--                                 <th>头像</th>--%>
                                 <th>账号</th>
                                 <th>密码</th>
                                 <th>昵称</th>
                                 <th>权限</th>
                                 <th>操作</th>
                             </tr>
                         </table>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <div id="page"></div>
</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input id="path" type="hidden" value="<%=path%>" />
<input id="role" type="hidden" value="${sessionScope.user.group}">
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

    function del(id) {
        layer.confirm('确定要删除吗？', {
            btn : [ '确定', '取消' ]
        }, function () {
            location.href='<%=path%>/admin?action=delete&userId='+id;
        });
    }

    function loadRequestList(data) {
        let role = $("#role").val();
        $.post(path + '/admin',data,function (result) {
            if (result.code ==200) {
                let data = result.data;
                let html = "<tr>\n" +
                    // "                <th>头像</th>\n" +
                    "                <th>账号</th>\n" +
                    "                <th>密码</th>\n" +
                    "                <th>昵称</th>\n" +
                    "                <th>权限</th>\n" +
                    "                <th>操作</th>\n" +
                    "</tr>";
                for (let i = 0;i < data.length; i++) {
                    html += "<tr>\n" +
                        // "<th width=\"10%\">"+data[i].favicon+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userLoginName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userPassword+"</th>\n" +
                        "<th width=\"10%\">"+data[i].userName+"</th>\n" +
                        "<th width=\"10%\">";
                           if (data[i].group == 'admin') {
                               html += "管理员";
                           }
                           // else if (data[i].group ==null || data[i].group.length ==0) {
                           //     html += "用户";
                           // }
                           else if (data[i].group =='user') {
                               html += "用户";
                           }
                           else if (data[i].group =='root') {
                               html += "超级管理员";
                           }
                    html+="</th>";
                    html+="<th width=10%>\n";
                    if (role == 'root') {

                        if (data[i].group !='root') {
                            html+="    <button style=\"background-color: #5994d6;\" class=\"layui-btn layui-btn-xs\" title=\"修改\" onclick=\"window.location.href='<%=path%>/admin?action=update&userId="+data[i].userId+"'\">\n" +
                                "        <i class=\"layui-icon\">\n" +
                                "        </i>\n" +
                                "    </button>\n";
                            html += "    <button style=\"background-color: #5994d6;\" class=\"layui-btn layui-btn-xs\" title=\"删除\" onclick=\"del("+data[i].userId+")\">\n" +
                                "        <i class=\"layui-icon\">\n" +
                                "        </i>\n" +
                                "    </button>\n";
                        }
                    }
                    if (role == 'admin') {
                        if (data[i].group =='user') {
                            html+="    <button style=\"background-color: #5994d6;\" class=\"layui-btn layui-btn-xs\" title=\"修改\" onclick=\"window.location.href='<%=path%>/admin?action=update&userId="+data[i].userId+"'\">\n" +
                                "        <i class=\"layui-icon\">\n" +
                                "        </i>\n" +
                                "    </button>\n";
                            html += "    <button style=\"background-color: #5994d6;\" class=\"layui-btn layui-btn-xs\" title=\"删除\" onclick=\"del("+data[i].userId+")\">\n" +
                                "        <i class=\"layui-icon\">\n" +
                                "        </i>\n" +
                                "    </button>\n";
                        }
                    }

                    html +="</th>";


                    html+="</tr>"
                }
                $("#dt-table").html(html);
            }
        },'json');
    };
</script>

</html>
