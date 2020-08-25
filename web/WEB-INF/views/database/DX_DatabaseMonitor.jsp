<%--
  Created by IntelliJ IDEA.
  User: 17868
  Date: 2020/8/22
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>DX_Database 监控主页</title>
    <link rel="icon" href="<%=path%>/static/images/database/database.ico">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
    <script>
        //自己存放数据的地方
        let dx_Data = {
            titleIndex: 1,
        };
        window.dx_Data = dx_Data;
        //加载完网页执行
        $(function () {
            $($(".dx_page")[dx_Data.titleIndex-1]).animate({opacity: "1"}, { duration: 200, queue: false });
        });
        //Js原生事件=====================================================================
        //鼠标进入标题时
        function TitleMouseEnter(tileElement) {
            //获得元素的偏移量和长度
            let title = $(tileElement);
            let left = title.offset().left;
            let width = title.css("width");
            //设置底部浮动条的位置
            $("#Title_Bar").css("left",left).css("opacity",1).css("width",width);
        }
        //鼠标移出标题时
        function TitleMouseOut(titleElement) {
            //当鼠标移出时让浮动条不可见
            let title = $(titleElement);
            $("#Title_Bar").css("opacity",0);
        }
        //标题被点击时
        function clickTitle(titleElement) {
            //删除所有之前选中的样式，并且给当前被点击的添加选中样式
            let titleUl = $("#TitleUl");
            let child = titleUl.children();
            child.removeClass("layui-this");
            let select = $(titleElement).addClass("layui-this");
            //切换选项卡的页面
            let index = parseInt(select.attr("index"));
            if(dx_Data.titleIndex === index){
                return;
            }
            let contentPage = $(".dx_page");
            $(contentPage[dx_Data.titleIndex-1]).animate({opacity: "0"}, { duration: 200, queue: false });
            $(contentPage[index-1]).animate({opacity: "1"}, { duration: 200, queue: false });
            dx_Data.titleIndex = index;
        }
    </script>
</head>
<body style="overflow:hidden" ondragstart="return false" onselectstart="return false">
<div class="layui-card-body" style="padding: 0 0 0 0"  >
    <ul class="layui-nav" lay-filter="component-nav" id="TitleUl">
        <li style="display: inline-block; width:164px;position: relative;vertical-align: middle;margin-right: 25px;margin-left: 6px;text-align: -webkit-match-parent;">
            <div>
                <img src="<%=path%>/static/images/database/database.png" alt="???" height="30" width="30">
                <div style="color: white;font-size: 14px;line-height: 58px;text-align: -webkit-match-parent;display: inline-block">DX_Database数据库</div>
            </div>
        </li>
        <li class="layui-nav-item layui-this" index="1" onmouseleave="TitleMouseOut(this)" onmouseenter="TitleMouseEnter(this)" onclick="clickTitle(this)"><a href="javascript:">概览</a></li>
        <li class="layui-nav-item" index="2" onmouseleave="TitleMouseOut(this)" onmouseenter="TitleMouseEnter(this)" onclick="clickTitle(this)"><a href="javascript:">SQL监控</a></li>
        <li class="layui-nav-item" index="3" onmouseleave="TitleMouseOut(this)" onmouseenter="TitleMouseEnter(this)" onclick="clickTitle(this)">
            <a href="javascript:">数据库接口调用统计</a>
        </li>
        <li class="layui-nav-item" index="4" onmouseleave="TitleMouseOut(this)" onmouseenter="TitleMouseEnter(this)" onclick="clickTitle(this)"><a href="javascript:">数据库</a></li>
        <span class="layui-nav-bar" id="Title_Bar" style="left: 150px; top: 55px; width: 0; opacity: 1;"></span>
    </ul>
</div>
<div id="content" style="height: 100%; width: 100%;">
    <div class="dx_page" style="height: 100%; width: 100%; position: absolute; opacity: 0;" >
        第一页
    </div>
    <div class="dx_page" style="height: 100%; width: 100%; position: absolute; opacity: 0;" >
        第二页
    </div>
    <div class="dx_page" style="height: 100%; width: 100%; position: absolute; opacity: 0;" >
        第三页
    </div>
    <div class="dx_page" style="height: 100%; width: 100%; position: absolute; opacity: 0;" >
        第四页
    </div>
</div>
</body>
</html>
