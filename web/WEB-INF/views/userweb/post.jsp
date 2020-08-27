<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>list</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/nprogress.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="<%=path%>/static/postStyle/images/icon.png">
    <link rel="shortcut icon" href="<%=path%>/static/postStyle/images/favicon.ico">
    <script src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="<%=path%>/static/postStyle/js/nprogress.js"></script>
    <script src="<%=path%>/static/postStyle/js/jquery.lazyload.min.js"></script>
    <!--[if gte IE 9]>
    <script src="<%=path%>/static/postStyle/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/static/postStyle/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="<%=path%>/static/postStyle/js/respond.min.js" type="text/javascript"></script>
    <script src="<%=path%>/static/postStyle/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
</head>
<body class="user-select">
<header class="header">
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
                <ul class="site-nav topmenu">
                    <li><a href="#" >标签云</a></li>
                    <li><a href="#" rel="nofollow" >读者墙</a></li>
                    <li><a href="#" title="RSS订阅" >
                        <i class="fa fa-rss">
                        </i> RSS订阅
                    </a></li>
                </ul>
                勤记录 懂分享</div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <h1 class="logo hvr-bounce-in"><a href="#" title="木庄网络博客"><img src="<%=path%>/static/postStyle/images/201610171329086541.png" alt="木庄网络博客"></a></h1>
            </div>
            <div class="collapse navbar-collapse" id="header-navbar">
                <form class="navbar-form visible-xs" action="/Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
                        <span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a data-cont="木庄网络博客" title="木庄网络博客" href="index.html">首页</a></li>
                    <li><a data-cont="列表页" title="列表页" href="list.html">列表页</a></li>
                    <li><a data-cont="详细页" title="详细页" href="show.html">详细页</a></li>
                    <li><a data-cont="404" title="404" href="404.html">404</a></li>
                    <li><a data-cont="MZ-NetBolg主题" title="MZ-NetBolg主题" href="#" >MZ-NetBolg主题</a></li>
                    <li><a data-cont="IT技术笔记" title="IT技术笔记" href="#" >IT技术笔记</a></li>
                    <li><a data-cont="源码分享" title="源码分享" href="#" >源码分享</a></li>
                    <li><a data-cont="靠谱网赚" title="靠谱网赚" href="#" >靠谱网赚</a></li>
                    <li><a data-cont="资讯分享" title="资讯分享" href="#" >资讯分享</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="container">
    <div class="content-wrap">
        <div class="content">
            <div class="title">
                <h3 style="line-height: 1.3">MZ-NetBlog主题</h3>
            </div>
            <article class="excerpt excerpt-1"><a class="focus" href="#" title="用DTcms做一个独立博客网站（响应式模板）" target="_blank" ><img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: inline;"></a>
                <header><a class="cat" href="#" title="MZ-NetBlog主题" >MZ-NetBlog主题<i></i></a>
                    <h2><a href="#" title="用DTcms做一个独立博客网站（响应式模板）" target="_blank" >用DTcms做一个独立博客网站（响应式模板）</a></h2>
                </header>
                <p class="meta">
                    <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-10-14</time>
                    <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 217</span> <a class="comment" href="##comment" title="评论" target="_blank" ><i class="glyphicon glyphicon-comment"></i> 4</a></p>
                <p class="note">用DTcms做一个独立博客网站（响应式模板），采用DTcms V4.0正式版（MSSQL）。开发环境：SQL2008R2+VS2010。DTcms V4.0正式版功能修复和优化：1、favicon.ico图标后台上传。（解决要换图标时要连FTP或者开服务器的麻烦）</p>
            </article>

        </div>
    </div>
    <aside class="sidebar">
        <div class="fixed">
            <div class="widget widget_search">
                <form class="navbar-form" action="/Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
                        <span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
                </form>
            </div>
            <div class="widget widget_sentence">
                <h3>标签云</h3>
                <div class="widget-sentence-content">
                    <ul class="plinks ptags">
                        <li><a href="#list/67/" title="移动统计" draggable="false">移动统计 <span class="badge">1</span></a></li>
                        <li><a href="#list/256/" title="404" draggable="false">404 <span class="badge">1</span></a></li>
                        <li><a href="#list/252/" title="VS2010" draggable="false">VS2010 <span class="badge">1</span></a></li>
                        <li><a href="#list/162/" title="杀毒软件" draggable="false">杀毒软件 <span class="badge">1</span></a></li>
                        <li><a href="#list/133/" title="html标签" draggable="false">html标签 <span class="badge">1</span></a></li>
                        <li><a href="#list/49/" title="循环" draggable="false">循环 <span class="badge">2</span></a></li>
                        <li><a href="#list/22/" title="百度统计" draggable="false">百度统计 <span class="badge">2</span></a></li>
                        <li><a href="#list/132/" title="sql" draggable="false">sql <span class="badge">6</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="widget widget_hot">
            <h3>最新评论文章</h3>
            <ul>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
                <li>
                    <a title="用DTcms做一个独立博客网站（响应式模板）" href="#">
                <span class="thumbnail">
                    <img class="thumb" data-original="<%=path%>/static/postStyle/images/201610181739277776.jpg" src="<%=path%>/static/postStyle/images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）" style="display: block;" />
                </span>
                        <span class="text">用DTcms做一个独立博客网站（响应式模板）</span>
                        <span class="muted">
                    <i class="glyphicon glyphicon-time"></i>
                    2016-11-01
                </span>
                        <span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span>
                    </a>
                </li>
            </ul>
        </div>


    </aside>
</section>
<footer class="footer">
    <div class="container">
        <p>Copyright &copy; 2016.Company name All rights reserved.</p>
    </div>
    <div id="gotop"><a class="gotop"></a></div>
</footer>
<script src="<%=path%>/static/postStyle/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/postStyle/js/jquery.ias.js"></script>
<script src="<%=path%>/static/postStyle/js/scripts.js"></script>
</body>
</html>