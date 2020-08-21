<%--
  Author: asuk
  DateTime: 2020/8/21 16:48
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
    <title>分类审核</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
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

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div>
                <div class="widget-body no-padding">
                    <table id="dt-table" class="table table-striped table-bordered table-hover" style="width:100%;font-size: 14px;">
                        <tr>
                            <th width="10%">申请分类名</th>
                            <th width="10%">申请父分类名</th>
                            <th width="10%">申请人</th>
                            <th width="10%">申请日期</th>
                            <th width="10%">是否通过</th>
                            <th width="10%">是否审核</th>
                            <th width="15%">审核人</th>
                            <th width="15%">审核日期</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>
</section>
<footer class="footer">
    版权归来贴项目组
</footer>
<input id="path" type="hidden" value="<%=path%>" />
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/jq.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();
    $(function () {
        $.post(path + '/admin',{action:'getCreateClassRequestList'},function (result) {
            if (result.code ==200) {
                let data = result.data.data;
                let html = "<tr>\n" +
                                "<th width=\"10%\">申请分类名</th>\n" +
                                "<th width=\"10%\">申请父分类名</th>\n" +
                                "<th width=\"10%\">申请人</th>\n" +
                                "<th width=\"10%\">申请日期</th>\n" +
                                "<th width=\"10%\">是否通过</th>\n" +
                                "<th width=\"10%\">是否审核</th>\n" +
                                "<th width=\"15%\">审核人</th>\n" +
                                "<th width=\"15%\">审核日期</th>\n" +
                            "</tr>";
                for (let i = 0;i < data.length; i++) {
                    html += "<tr>\n" +
                                "<th width=\"10%\">"+data[i].className+"</th>\n" +
                                "<th width=\"10%\">"+data[i].fatherClassId+"</th>\n" +
                                "<th width=\"10%\">申请人</th>\n" +
                                "<th width=\"10%\">"+data[i].requestDate+"</th>\n" +
                                "<th width=\"10%\">"+data[i].isProcess+"</th>\n" +
                                "<th width=\"10%\">"+data[i].isPass+"</th>\n" +
                                "<th width=\"15%\">审核人</th>\n" +
                                "<th width=\"15%\">"+data[i].reviewDate+"</th>\n" +
                            "</tr>";
                }
                $("#dt-table").html(html);
            }
        },'json');

    });
</script>
</body>
</html>