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
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
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
        <div id="box" class="layui-table-box" style="overflow: auto;height: 100%; padding: 20px;">

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
    function str2utf8(str) {
        encoder = new TextEncoder('utf8');
        return encoder.encode(str);
    }
    function add0(m){return m<10?'0'+m:m }
    function format(shijianchuo)
    {
//shijianchuo是整数，否则要parseInt转换
        var time = new Date(shijianchuo);
        var y = time.getFullYear();
        var m = time.getMonth()+1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
    }
    function parseUserAgent(str) {
        let clientType = "";
        let terminalType = "";
        if (str.indexOf('iPhone') !== -1) {
            terminalType = 'iPhone';
        } else if(str.indexOf('iPod') !== -1) {
            terminalType = 'iPod';
        } else if(str.indexOf('iPad') !== -1) {
            terminalType = 'iPad';
        } else if(str.indexOf('Linux') !== -1) {
            terminalType = '安卓';
        } else if(str.indexOf('Windows') !== -1) {
            terminalType = 'Windows';
        } else {
            terminalType = '未知';
        }

        if (str.indexOf('Chrome') !== -1) {
            clientType = "Chrome";
        } else if (str.indexOf('MSIE') !== -1) {
            clientType = "IE";
        } else if (str.indexOf('Safari') !== -1) {
            clientType = "Safari";
        } else if (str.indexOf('Firefox') !== -1) {
            clientType = "火狐";
        } else if (str.indexOf('Maxthon') !== -1) {
            clientType = "Maxthon";
        } else if (str.indexOf('Tencent') !== -1) {
            clientType = "腾讯";
        } else if (str.indexOf('MetaSr') !== -1) {
            clientType = "搜狗";
        }
        else {
            clientType = "未知";
        }

        return clientType + " -- " + terminalType;
    }
    function loadLogData() {
        $.post(path + '/admin?action=userLogList',function (result) {
            let data = result.data;
            for (let i = 0; i < data.length; i++) {
                let item = data[i];
                let html = '<div>';
                html += '<table class="layui-table layui-bg-gray">';
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
                html += '终端类型';
                html += '</td>';
                html += '<td colspan="3">';
                html += parseUserAgent(item[item.length-1].userAgent);
                html += '</td>';
                html += '</tr>';

                html += '<tr>';
                html += '<td>';
                html += 'IP地址';
                html += '</td>';
                html += '<td>';
                html += '请求地址';
                html += '</td>';
                html += '</td>';
                html += '<td>';
                html += '请求参数';
                html += '</td>';
                html += '<td>';
                html += '操作时间';
                html += '</td>';
                html += '</tr>';
                for (let j = 0; j < item.length; j++) {
                    html += '<tr>';
                    html += '<td>';
                    html += item[j].ip;
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
                    html += '<td>';
                    html += format(item[j].requestTimestamp);
                    html += '</td>';
                    html += '</tr>';
                }
                html += '</table>';
                html += '</div>';
                html += '<br/>';
                $("#box").append(html);
            }
        },'json');
    }
    function dynamicLoad() {
        $("#box").html("");
        loadLogData();
    }
    $(function () {
        $.post(path + "/admin",{action:'clearInactiveData'});
        loadLogData();
        setInterval(dynamicLoad,10000);
    });
</script>
</body>
</html>