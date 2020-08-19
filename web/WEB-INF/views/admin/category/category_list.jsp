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
        <div style="height: 10px">

        </div>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div>
                <div class="widget-body no-padding">
                    <table id="dt-table" class="table table-striped table-bordered table-hover" style="width:100%">
                        <tr>
                            <th width="20%">名称</th>
                            <th width="15%">分类级别</th>
                            <th width="5%">sort</th>
                            <th width="20%">创建时间</th>
                            <th>操作</th>
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
<script type="text/javascript" src="<%=path%>/static/js/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/libs/jquery.treetable.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script type="text/javascript">
    initMenuList();

    function initMenuList(){
        $.ajax({
            type : 'get',
            url : $("#path") + '/category',
            contentType: "application/json; charset=utf-8",
            async:false,
            success : function(data) {
                var length = data.length;
                for(var i=0; i<length; i++){
                    var d = data[i];
                    var tr = "<tr data-tt-id='" + d['id'] + "' data-tt-parent-id='" + d['parentId'] + "'>";
                    var td1 = "<td>" + d['name'] +"</td>";
                    tr += td1;
                    var id = "<td>" + d['id'] +"</td>";
                    tr += id;
                    var href = "";
                    if(d['href'] != null){
                        href = d['href'];
                    }
                    var td2 = "<td>" + href +"</td>";
                    tr += td2;

                    var permission = d['permission'];
                    if(permission == null){
                        permission = "";
                    }

                    var td3 = "<td>" + permission +"</td>";
                    tr += td3;

                    var sort = d['sort'];
                    if(sort == 0){
                        sort = "";
                    }

                    var td4 = "<td>" + sort +"</td>";
                    tr += td4;

                    var id = d['id'];
                    var href = "updateMenu.html?id=" + id;
                    var edit = buttonEdit(href, "sys:menu:add", pers);
                    var del = buttonDel(id, "sys:menu:del", pers);
                    tr += "<td>"+edit + del+"</td>";
                    tr += "</tr>"
                    $("#dt-table").append(tr);
                }
            }
        });
    }

    layui.use('layer', function(){
        var layer = layui.layer;
    });

    function del(id){
        layer.confirm('确定要删除吗？', {
            btn : [ '确定', '取消' ]
        }, function() {
            $.ajax({
                type : 'delete',
                url : '/permissions/' + id,
                success : function(data) {
                    location.reload();
                }
            });
        });
    }

    var option = {
        expandable : true,
        clickableNodeNames : true,
        onNodeExpand : function() {
            var d = this;
            console.log(d['id']);
            console.log(d['parentId']);
        },
        onNodeCollapse : function() {
            var d = this;
            console.log(d['id'] + "Collapse");
            console.log(d['parentId'] + "Collapse");
        }

    };

    $("#dt-table").treetable(option);
</script>
</body>
</html>
