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

        <div class="layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item">
                <label class="layui-form-label">分类</label>
                <div class="layui-input-block">
                    <div class="layui-inline">
                        <select class="jj" name="categoryLevel1Id" style="background-color:#f6f6f6;" id="categoryLevel1Id"
                                onchange="queryCategoryList(this,'categoryLevel2Id');">
                            <option value="0" selected="selected">请选择...</option>
                        </select>
                    </div>
                    <div class="layui-inline">
                        <select class="jj" name="categoryLevel2Id" style="background-color:#f6f6f6;" id="categoryLevel2Id"
                                onchange="queryCategoryList(this,'categoryLevel3Id');">
                            <option value="0" selected="selected">请选择...</option>
                        </select>
                    </div>
                    <div class="layui-inline">
                        <select class="jj" name="categoryLevel3Id" style="background-color:#f6f6f6;" id="categoryLevel3Id">
                            <option value="0" selected="selected">请选择</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">贴名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="postName" id="postName" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">发帖人</label>
                    <div class="layui-input-inline">
                        <input type="text" name="createUserName" id="createUserName" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-list" id="query-btn">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                    </button>
                </div>
            </div>


            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div>
                    <div class="widget-body no-padding">
                        <table id="dt-table" class="table table-striped table-bordered table-hover layui-form"
                               style="width:100%;font-size: 14px;">
                            <tr>
                                <th width="10%">贴名</th>
                                <th width="10%">一级分类</th>
                                <th width="10%">二级分类</th>
                                <th width="10%">三级分类</th>
                                <th width="10%">发帖人</th>
                                <th width="10%">发帖日期</th>
                                <th width="10%">操作</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- 存放分页的容器 -->
    <div id="page" style="text-align: center;position:fixed; height:100px;width:100%;bottom:10%;"></div>


</section>
<footer class="footer">
    版权归来贴项目组
</footer>
<input id="path" type="hidden" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/jq.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();

    //加载列表
    loadRequestList({action:'getPostList'});
    //加载分类数据
    ajaxQuery(0,'categoryLevel1Id');

    layui.use('layer', function(){
        var layer = layui.layer;
    });
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        let count;
        $.ajaxSettings.async = false;
        $.post(path + '/post',{action :'getPostCountByCondition'},function (result) {
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
                        action:'getPostList',
                        pageIndex : pageIndex,
                        pageSize : pageSize
                    }
                    loadRequestList(data);
                }
            }
        });
    });

    function del(id){
        layer.confirm('确定要删除吗？', {
            btn : [ '确定', '取消' ]
        }, function() {
            let data = {
                action : 'deletePost',
                postId : id
            }
            $.ajax({
                type : 'post',
                url : path + '/post',
                data : data,
                dataType: 'json',
                success : function(data) {
                    if (data.code == 200) {
                        layer.msg('删除成功!',{
                            time : 1000
                        },function () {
                            location.reload();
                        });

                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        });
    }
    function ajaxQuery(parentId,selectId) {
        $.ajax({
            url: path + "/postCategory",
            method: "post",
            data: {
                action: "queryCategoryList",
                parentId: parentId
            },
            dataType : 'json',
            success: function (result) {
                if (result.code == 200) {
                    var options = "<option value='0'>" + "请选择..." + "</option>";
                    for (var i = 0; i < result.data.length; i++) {
                        var option = "<option value=" + result.data[i].classId + ">" + result.data[i].className + "</option>";
                        options = options + option;
                    }
                    $("#" + selectId).html(options);
                }
            }
        });
    }

    function queryCategoryList(obj, selectId) {
        var parentId = $(obj).val();
        ajaxQuery(parentId,selectId);
    }


    function loadRequestList(data) {
        $.post(path + '/post',data,function (result) {
            if (result.code ==200) {
                let data = result.data.data;
                let html = "<tr>\n" +
                    "<th width=\"10%\">贴名</th>\n" +
                    "<th width=\"10%\">一级分类</th>\n" +
                    "<th width=\"10%\">二级分类</th>\n" +
                    "<th width=\"10%\">三级分类</th>\n" +
                    "<th width=\"10%\">发帖人</th>\n" +
                    "<th width=\"10%\">发帖日期</th>\n" +
                    "<th width=\"10%\">操作</th>" +
                    "</tr>";
                for (let i = 0;i < data.length; i++) {
                    html += "<tr>\n" +
                        "<th width=\"10%\">"+data[i].postName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].postClassLevel1Name+"</th>\n" +
                        "<th width=\"10%\">"+data[i].postClassLevel2Name+"</th>\n" +
                        "<th width=\"10%\">"+data[i].postClassLevel3Name+"</th>\n" +
                        "<th width=\"10%\">"+data[i].createUserName+"</th>\n" +
                        "<th width=\"10%\">"+data[i].createDate+"</th>\n"
                        +"<th>"+buttonDel(data[i].postId)+"</th>"
                }
                $("#dt-table").html(html);
            }
        },'json');
    };

    $("#query-btn").click(function () {
        let postName = $("#postName").val();
        let createUserName = $("#createUserName").val();
        let categoryLevel1Id = $("#categoryLevel1Id").val();
        let categoryLevel2Id = $("#categoryLevel2Id").val();
        let categoryLevel3Id = $("#categoryLevel3Id").val();
        let data = {
            action : 'getPostList',
            postName : postName,
            createUserName : createUserName,
            postClassLevel1Id : categoryLevel1Id,
            postClassLevel2Id : categoryLevel2Id,
            postClassLevel3Id : categoryLevel3Id
        }
        loadRequestList(data);
    });
</script>
</body>
</html>