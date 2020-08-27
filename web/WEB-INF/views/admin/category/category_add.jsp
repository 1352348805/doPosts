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
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
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
    <div class="right" style="text-align: center;">
        <div class="layui-inline" >
            <table class="layui-table" style="margin: 20% auto;">
                <tbody>
                <tr>
                    <td colspan="2" style="text-align: center;font-size: 20px;">
                        添加分类
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">分类级别</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="type" style="background-color:#f6f6f6;" id="type"
                                onchange="selectCategoryLevel(this);">
                            <option value="" selected="selected">请选择...</option>
                            <option value="1">一级分类
                            </option>
                            <option value="2">二级分类
                            </option>
                            <option value="3">三级分类
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">一级分类</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="categoryLevel1" style="background-color:#f6f6f6;" id="categoryLevel1"
                                onchange="queryCategoryList(this,'categoryLevel2');">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="548">化妆品</option>
                        </select>
                    </td>
                </tr>
                <tr style="display:none">
                    <td width="135" align="right">二级分类</td>
                    <td>
                        <select class="jj" name="categoryLevel2" style="background-color:#f6f6f6;" id="categoryLevel2">
                            <option value="0" selected="selected">请选择...</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">分类名称</td>
                    <td style="font-family:'宋体';">
                        <input type="text" value="" class="add_ipt" id="name">（必填）
                        <input type="hidden" name="id" value="" id="id">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        分类描述
                    </td>
                    <td>
                        <input type="text" class="add_ipt" id="classDescribe">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button style="background-color: #5994d6;margin-left: 40%;" class="layui-btn layui-btn-sm" onclick="addClass();">
                            <i class="layui-icon">&#xe608;</i> 确定
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<footer class="footer">
    <%@include file="../../common/admin/footer.jsp"%>
</footer>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();
    $(function () {
        ajaxQuery(0,'categoryLevel1');
    });

    layui.use('layer', function(){
        var layer = layui.layer;
    });

    function selectCategoryLevel(obj) {
        var level = $(obj).val();
        if (level == 1) {
            $('#categoryLevel1').parent().parent().hide();
            $('#categoryLevel2').parent().parent().hide();
        } else if (level == 2) {
            $('#categoryLevel1').parent().parent().show();
        } else {
            $('#categoryLevel1').parent().parent().show();
            $('#categoryLevel2').parent().parent().show();
        }
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
                    var options = "<option value=''>" + "请选择..." + "</option>";
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

    //添加分类方法
    function addClass() {
        let className = $("#name").val();
        let type = $("#type").val();
        let classDescribe = $("#classDescribe").val();
        let parentId = 0;
        if (type == '') {
            layer.msg('请选择分类级别');
            return;
        }
        if (type >= 2) {
            //判断一级是否为空
            let level1 = $("#categoryLevel1").val();
            if (level1 == '') {
                layer.msg('请选择一级分类');
                return;
            }
            parentId = level1;
        }
        if (type == 3) {
            //判断二级是否为空
            let level2 = $("#categoryLevel2").val();
            if (level2 == '') {
                layer.msg('请选择二级分类');
                return;
            }
            parentId = level2;
        }
        if (className.trim() == '') {
            layer.msg('请填写分类名称');
            return;
        }
        let data = {
            action : 'addCategory',
            className : className,
            type : type,
            classDescribe : classDescribe,
            parentId : parentId
        }
        $.post(path + '/admin',data,function (result) {
            if (result.code == 200) {
                layer.msg('添加成功!',{
                    time : 1000
                });
                location.href = path + '/admin?action=categoryList';
            } else {
                layer.msg(result.message);
            }
        },'json');
    }

</script>
</body>
</html>