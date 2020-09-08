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
    <style>
        table td{border:1px solid black}
    </style>
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
        <div id="box" style="overflow: auto;height: 100%; padding: 20px;">

        </div>
    </div>
</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();
    $(function () {
        $.post(path + '/admin?action=userLogList',function (result) {
            let data = result.data;
            for (let i = 0; i < data.length; i++) {
                let item = data[i];
                let html = '<div style="overflow: auto;float:left;margin-right:20px;width: 700px;height: 300px;border: black 1px solid;">';
                html += '<table>';
                html += '<tr>';
                html += '<td>';
                html += '用户ID';
                html += '</td>';
                html += '<td colspan="3">';
                html += item[i].id;
                html += '</td>';
                html += '</tr>';

                html += '<tr>';
                html += '<td>';
                html += 'IP地址';
                html += '</td>';
                html += '<td>';
                html += '上一次请求地址';
                html += '</td>';
                html += '<td>';
                html += '本次请求地址';
                html += '</td>';
                html += '</td>';
                html += '<td>';
                html += '请求参数';
                html += '</td>';
                html += '</tr>';
                for (let j = 0; j < item.length; j++) {
                    html += '<tr>';
                    html += '<td>';
                    html += item[j].ip;
                    html += '</td>';
                    html += '<td>';
                    if (item[j].referer != null) {
                        html += item[j].referer;
                    }
                    html += '</td>';
                    html += '<td>';
                    html += item[j].requestUri;
                    html += '</td>';
                    html += '<td>';
                    for (m in item[j].requestParameterMap) {
                        if ('$ref' != m) {
                            html += '['+ m + ':'+ item[j].requestParameterMap[m] + ']';
                        }
                    }
                    html += '</td>';
                    html += '</tr>';
                    //alert(item[i].id);
                }
                html += '</table>';
                html += '</div>';
                $("#box").append(html);
            }
        },'json');
    });
</script>
</body>
</html>