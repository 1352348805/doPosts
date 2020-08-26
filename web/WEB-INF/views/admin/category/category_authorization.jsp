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

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div>
                <div class="widget-body no-padding">
                    <table id="dt-table" class="table table-striped table-bordered table-hover layui-form" style="width:100%;font-size: 14px;">
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
    <!-- 存放分页的容器 -->
    <div id="page" style="text-align: center;position:fixed; height:100px;width:100%;bottom:10%;"></div>


</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input id="path" type="hidden" value="<%=path%>" />
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/jq.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();

    loadRequestList({action:'getCreateClassRequestList'});
    layui.use('layer', function(){
        var layer = layui.layer;
    });
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        let count;

        $.ajaxSettings.async = false;
        $.post(path + '/admin',{action :'getCreateClassRequestCount'},function (result) {
            count = result.data;
        },'json');
        $.ajaxSettings.async = true;
        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,limit: 10
            ,theme: '#5994d6'
            ,count: count //数据总数，从服务端得到
            ,
            jump: function(e, first){ //触发分页后的回调
                if(!first){ //一定要加此判断，否则初始时会无限刷新
                    let pageIndex = e.curr; //当前页
                    let pageSize = e.limit;
                    let data = {
                        action:'getCreateClassRequestList',
                        pageIndex : pageIndex,
                        pageSize : pageSize
                    }
                    loadRequestList(data);
                }
            }
        });
    });

    function PassStatusChange(obj,id) {
        $obj = $(obj);
        let v = $obj.prev().val();
        if (v == 1) {
            $obj.prev().val(v=0);
            $obj.removeClass('layui-form-onswitch');
        } else {
            $obj.prev().val(v=1);
            $obj.addClass('layui-form-onswitch');
        }
        $obj = $obj.parents("th").next().children().eq(0).children().eq(0).children().eq(1)
            .addClass('layui-form-onswitch layui-checkbox-disbaled layui-disabled');
        let data = {
            action : 'passStatusChange',
            requestId : id,
            isPass : v
        }
        $.post(path + '/admin',data,function (result) {
            if (result.code == 200) {
                layer.msg(result.message);
            } else {
                layer.msg(result.message);
            }
        },'json');
    }

    function AuthorizationStatusChange(obj,id) {
        $obj = $(obj);
        let v = $obj.prev().val();
        if (v == 0) {
            $obj.prev().val(v=1);
            $obj.addClass('layui-form-onswitch layui-checkbox-disbaled layui-disabled');
        }
        let data = {
            action : 'processStatusChange',
            requestId : id,
            isProcess : v
        }
        $.post(path + '/admin',data,function (result) {
            if (result.code == 200) {
                layer.msg(result.message);
            } else {
                layer.msg(result.message);
            }
        },'json');
    }


    function loadRequestList(data) {
        $.post(path + '/admin',data,function (result) {
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
                        "<th width=\"10%\">"+data[i].fatherClassName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].requestName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].requestDate+"</th>\n" +
                        "<th width=\"10%\">" +
                        "<div class=\"layui-card-body layui-row layui-col-space10\">\n" +
                        "        <div class=\"layui-col-md12\">\n" +
                        "            <input type=\"checkbox\" name=\"xxx\" value=\"";
                    if (data[i].isPass) {
                        html += "1\" lay-skin=\"switch\">\n" +
                            "            <div class=\"layui-unselect layui-form-switch layui-form-onswitch\" lay-skin=\"_switch\" onclick=\"PassStatusChange(this,"+data[i].requestId+")\"><em></em><i></i></div>\n";
                    } else {
                        html += "0\" lay-skin=\"switch\">\n" +
                            "            <div class=\"layui-unselect layui-form-switch\" lay-skin=\"_switch\" onclick=\"PassStatusChange(this,"+data[i].requestId+")\"><em></em><i></i></div>\n";

                    }
                    html += "        </div>\n" +
                        "    </div>";
                    html +=
                        "<th width=\"10%\">" +
                        "<div class=\"layui-card-body layui-row layui-col-space10\">\n" +
                        "        <div class=\"layui-col-md12\">\n" +
                        "            <input type=\"checkbox\" name=\"xxx\" value=\"";
                    if (data[i].isProcess) {
                        html += "1\" lay-skin=\"switch\">\n" +
                            "            <div class=\"layui-unselect layui-form-switch layui-form-onswitch layui-checkbox-disbaled layui-disabled\" lay-skin=\"_switch\" onclick=\"AuthorizationStatusChange(this,"+data[i].requestId+")\"><em></em><i></i></div>\n";
                    } else {
                        html += "0\" lay-skin=\"switch\">\n" +
                            "            <div class=\"layui-unselect layui-form-switch\" lay-skin=\"_switch\" onclick=\"AuthorizationStatusChange(this,"+data[i].requestId+")\"><em></em><i></i></div>\n";

                    }
                    html += "        </div>\n" +
                        "    </div>" +
                        "</th>\n" +
                        "<th width=\"15%\">";

                    if (data[i].reviewerName != null) {
                        html += data[i].reviewerName;
                    }
                    html += "</th>\n" +
                        "<th width=\"15%\">";
                    if (data[i].reviewDate != null) {
                        html += data[i].reviewDate;
                    }
                    html+="</th>\n" +
                        "</tr>";
                }
                $("#dt-table").html(html);
            }
        },'json');
    };
</script>
</body>
</html>