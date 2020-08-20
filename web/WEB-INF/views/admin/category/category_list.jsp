<%--
  Author: asuk
  DateTime: 2020/8/19 13:34
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>帖子分类列表</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="<%=path%>/static/css/treetable/jquery.treetable.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/treetable/jquery.treetable.theme.default.css"/>
</head>
<body>
<!--头部-->
<%@include file="../../common/admin/head.jsp" %>
<!--时间-->
<%@include file="../../common/admin/time.jsp" %>
<!--主体内容-->
<section class="publicMian ">
    <%@include file="../../common/admin/leftnav.jsp" %>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>

    <div class="right">

        <!-- 支撑高度 -->
        <div style="height: 30px">

        </div>

        <div align="left">
            <table style="width: 100%">
                <tr>
                    <td>
                    </td>
                    <td align="right">
                        <button class="layui-btn layui-btn-sm" onclick="location.href='<%=path%>/admin?action=toAdd'">
                            <i class="layui-icon">&#xe608;</i> 添加
                        </button>
                    </td>
                </tr>
            </table>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div>
                <div class="widget-body no-padding">
                    <table id="dt-table" class="table table-striped table-bordered table-hover" style="width:100%">
                        <tr>
                            <th width="30%">名称</th>
                            <th width="15%">分类级别</th>
                            <th width="15%">操作</th>
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
<script src="<%=path%>/static/js/libs/jquery.treetable.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script type="text/javascript">
    var path = $("#path").val();
    initMenuList();

    function initMenuList(){
        //递归拼接分类项
        function appendHtml(children) {
            let length = children.length;
            for(let i=0; i<length; i++){
                let d = children[i];
                let tr = "<tr data-tt-id='" + d['classId'] + "' data-tt-parent-id='" + d['classFatherId'] + "'>";
                let td1 = "<td>" + d['className'] +"</td>";
                tr += td1;
                var id = "<td>" + d['classLevel'] +"</td>";
                tr += id;
                var id = d['classId'];
                let level = d['classLevel'];
                let href = path + "/admin?action=toModify&classId=" + id;
                let edit = buttonEdit(href);
                let del = buttonDel(id,level);
                tr += "<td>"+edit + del+"</td>";
                tr += "</tr>"
                $("#dt-table").append(tr);
                appendHtml(children[i].children);
            }
        }

        $.ajax({
            type : 'get',
            url : path + '/postCategory',
            data : {action : 'getClassList'},
            dataType : 'json',
            async:false,
            success : function(data) {
                if (data.code == 200) {
                    appendHtml(data.data);
                }

            }
        });
    }

    layui.use('layer', function(){
        var layer = layui.layer;
    });

    function del(id,level){
        layer.confirm('确定要删除吗？', {
            btn : [ '确定', '取消' ]
        }, function() {
            let data = {
                action : 'delete',
                classId : id,
                level : level
            }
            $.ajax({
                type : 'post',
                url : path + '/admin',
                data : data,
                dataType: 'json',
                success : function(data) {
                    if (data.code == 200) {
                        layer.msg('删除成功!',{
                            time : 1000
                        });
                        location.reload();
                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        });
    }

    var option = {
        expandable : true,
        clickableNodeNames : true,
        onNodeExpand : function() {
            var d = this;
            console.log(d['classId']);
            console.log(d['classFatherId']);
        },
        onNodeCollapse : function() {
            var d = this;
            console.log(d['classId'] + "Collapse");
            console.log(d['classFatherId'] + "Collapse");
        }

    };

    $("#dt-table").treetable(option);
</script>
</body>
</html>
