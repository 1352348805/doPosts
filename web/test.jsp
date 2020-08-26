<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: leishen
  Date: 2020/8/22
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
<%--    <script>--%>
<%--        layui.use('laypage', function(){--%>
<%--            //执行一个laypage实例--%>
<%--            layui.laypage.render({--%>
<%--                elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号--%>
<%--                ,limit: 5--%>
<%--                ,count: ${dataCount} //数据总数，从服务端得到--%>
<%--                ,hash: 'xxx'--%>
<%--                ,curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取--%>
<%--                    let page = location.search.match(/page=(\d+)/);--%>
<%--                    return page ? page[1] : 1;--%>
<%--                }(),--%>
<%--                jump: function(e, first){ //触发分页后的回调--%>
<%--                    if(!first){ //一定要加此判断，否则初始时会无限刷新--%>
<%--                        console.log(e);--%>
<%--                        location.href = '?page='+e.curr;--%>
<%--                    }--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
</head>
<body>
<div class="layui-card-body">
    <dl class="layuiadmin-card-status">
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>胡歌 在 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/">layuiadmin专区</a> 回答问题</p>
                <span>几秒前</span>
            </div>
        </dd>
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>彭于晏 在 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/">layuiadmin专区</a> 进行了 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/column/quiz/">提问</a></p>
                <span>2天前</span>
            </div>
        </dd>
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>贤心 将 <a lay-href="http://www.layui.com/">layui</a> 更新至 2.3.0 版本</p>
                <span>7天前</span>
            </div>
        </dd>
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>吴尊 在 <a lay-href="http://fly.layui.com/">Fly社区</a> 发布了 <a lay-href="http://fly.layui.com/column/suggest/">建议</a></p>
                <span>7天前</span>
            </div>
        </dd>
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>许上进 在 <a lay-href="http://fly.layui.com/">Fly社区</a> 发布了 <a lay-href="http://fly.layui.com/column/suggest/">建议</a></p>
                <span>8天前</span>
            </div>
        </dd>
        <dd>
            <div class="layui-status-img"><a href="javascript:;"><img src="../../layuiadmin/style/res/logo.png"></a></div>
            <div>
                <p>小蚊子 在 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/">layuiadmin专区</a> 进行了 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/column/quiz/">提问</a></p>
                <span>8天前</span>
            </div>
        </dd>
    </dl>
</div>
</body>
</html>
