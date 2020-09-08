<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    //  String secondId = (String)request.getAttribute("secondId");
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
    <link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
    <link rel="stylesheet" href="<%=path%>/static/css/dynamic/indexDynamic.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/nprogress.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/styleNoScrollBar.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/postStyle/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="<%=path%>/static/postStyle/images/icon.png">
    <%--START 右边实用工具引用文件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootbox.min.js"></script>
    <%--END--%>

    <%-- START  分页引用文件 layui --%>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <%--   END   --%>

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
    <style type="text/css">
        .probootstrap-main-nav li{
            margin: 0;
            padding: 0 10px;
            list-style: none;
            display: inline;
            font-size: 18px;
        }
        .probootstrap-main-nav li a{
            color: #fff;
        }
    </style>

</head>
<body class="user-select" style="overflow: hidden; width: 100%; height: 100%">
<div style="margin: 0;padding: 0;border: 0; width: 100%; height: 100%; overflow-y: scroll; position: absolute; z-index: 9999">
    <header class="header">
        <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath}"/>
        <div style="padding-top: 0px;height: 200px; background: url('${pageContext.request.contextPath }/static/images/head/gnydy.png') no-repeat">
            <div class="container-fluid">
                <div class="mobile-menu-overlay"></div>
                <nav role="navigation" class="probootstrap-nav hidden-xs" style="padding-right: 60px;margin-right: 100px;float: right;">
                    <ul class="probootstrap-main-nav">
                        <c:choose>
                            <c:when test="${user == null}">
                                <li><a href="${pageContext.request.contextPath }/user?action=toLogin" style="color: red" >登录</a></li>
                                <li><a href="${pageContext.request.contextPath }/user?action=toRegister" style="color: red">注册</a></li>
                            </c:when>
                            <c:otherwise>
                                <li style="color: red;">欢迎你: ${user.userName}</li>
                                <li style="color: #fff;"><a href="${pageContext.request.contextPath }/user?action=toUserCenter">个人中心</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="extra-text visible-xs">
                        <ul class="social-buttons">
                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                            <li><a href="#"><i class="icon-instagram2"></i></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <section class="container">
        <div class="leftNav-item">
            <ul>
                <li>
                    <i class="fa fa-user-circle"></i>
                    <a href="${pageContext.request.contextPath }/user?action=toUserCenter" class="rota">个人中心</a>
                </li>
                <li title="回复">
                    <i class="fa fa-pencil-square-o"></i>
                    <a href="#send" class="rota">回复</a>
                </li>
                <li title="回到顶部" class="for-top" style="display: list-item;">
                    <i class="fa fa-arrow-up"></i>
                    <a href="#" class="rota" id="to_top">去顶部</a>
                </li>
            </ul>
        </div>

        <div class="content-wrap" style="margin-left: 200px">
            <div class="content" style="margin-right: 450px">
                <div class="title">
                    <h3 style="line-height: 2.6;font-size: 28px;font-weight: 800;color: deeppink;">${postName}</h3>
                </div>

                <%-- 存放帖子列表--%>
                <div  id="articleid">
                </div>

                <%-- 存放分页的容器 --%>
                <div id="page" style="margin-top: 20px; margin-left: 230px;"></div>

                <div class="title" id="comment" style="margin-top: 45px">
                    <h4>帖子标题</h4>
                </div>
                <div id="respond">
                    <form  action="<%=path%>/floor?action=addpost" id="comment-form" name="comment-form" method="post" class="probootstrap-form" enctype="multipart/form-data" onsubmit="return inputcheck()">
                        <div class="comment">
                            <input name="titename" id="titeid" class="form-control" size="22" placeholder="帖子标题（必填）" maxlength="35" autocomplete="off" tabindex="1" type="text">
                            <div class="row mb60" id="send" style="margin-top: 25px ">
                                <div class="col-md-12 probootstrap-animate ">
                                    <h4 style="padding-bottom:15px">帖子内容</h4>
                                    <div id="editor">

                                    </div>
                                    <div class="form-group">
                                        <input type="button" class="btn btn-primary" id="spend" name="submit" value="发 帖" style="margin-top: 15px; padding:10px 25px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer">
        <div class="container">
            <p>Copyright &copy; 2020.Company name All rights reserved.</p>
        </div>
        <div id="gotop"><a class="gotop"></a></div>
    </footer>
</div>
<div style="margin: 0;padding: 0;border: 0; width: 100%; height: 100%; position: absolute;overflow: hidden; z-index: -500" class="dynamic">
    <div class="camera -x ">
    <div class="camera -y">
        <div class="camera -z">
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="drop">
                <div class="z">
                    <div class="slide">
                        <div class="move">
                            <div class="stagger">
                                <div class="reverse">
                                    <div class="rotate">
                                        <div class="size">
                                            <div class="sakura"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div></div>

<input type="hidden" id="_path" value="<%=path%>"/>
<script src="<%=path%>/static/postStyle/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/postStyle/js/jquery.ias.js"></script>
<script src="<%=path%>/static/postStyle/js/scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/wangEditor-3.1.1/release/wangEditor.js"></script>
<script type="text/javascript">
    var path = $("#_path").val();
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.customConfig.uploadImgServer = path + '/uploadingimg?action=uploadingimgs';
    // editor.customConfig.uploadImgShowBase64 = true;

    editor.customConfig.uploadImgHooks = {
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        }
        ,
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = path + result.data[0];
            insertImg(url)

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }
    editor.create();

</script>
<!-- //Jquery -->

<script type="text/javascript">
    $(function () {

        postlist({action : 'postListpage',secondId :${secondId} });

        function getQueryVariable(variable)
        {
            var query = window.location.search.substring(1); //获得了当前链接(url路径)的中?号后的参数
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }
        // 分页操作
        layui.use('laypage', function(){
            var laypage = layui.laypage;
            let count;
            $.ajaxSettings.async = false;
            let datas={ action :'getPostCount' ,postsecondid : ${secondId} }
            $.post(path + '/post',datas,function (result) {
                count = result.data;
            },'json');
            $.ajaxSettings.async = true;

            //执行一个laypage实例
            laypage.render({
                elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
                ,limit: 5
                ,curr: getQueryVariable('pageindex')
                ,theme: '#5994d6'
                ,count: count //数据总数，从服务端得到
                ,
                jump: function(e, first){ //触发分页后的回调
                    if(!first){ //一定要加此判断，否则初始时会无限刷新
                        let pageIndex = e.curr; //当前页
                        let pageSize = e.limit;
                        let data={
                            action : 'postListpage',
                            secondId : ${secondId},
                            pageindex : pageIndex,
                            pageSize : pageSize
                        }
                        postlist(data);
                    }
                }
            });
        });
        function postlist(data){
            $.post("<%=path%>/user",data,
                function (result) {
                    if(result.code==200){
                        let date = result.data.data;
                        var articleDiv = "";
                        for( var i = 0 ; i < date.length ; i++){
                            articleDiv += " <article class=\"excerpt excerpt-1\"  style=\"margin-top: 15px;background-color: #EEE;\">" +
                                " <div style='margin-left:20px ; margin-bottom:20px'><header style='margin-top: 7px;margin-bottom:0px'>\n" +
                                // "                    <a class=\"cat\" href=\"#\" title=\"MZ-NetBlog主题\">MZ-NetBlog主题<i></i></a>\n" +
                                "                    <h2 style='font-weight: 800;\n" +
                                "    font-family: cursive'><a style='color: mediumslateblue' href=\"<%=path%>/user?action=postAndfloor&postid="+date[i].postId+" \" title=\""+date[i].postName+"\" target=\"_blank\">"+date[i].postName+"</a></h2>\n" +
                                "                </header>\n" +
                                "                <p class=\"meta\">\n" +
                                "                    <time class=\"time\"><i class=\"glyphicon glyphicon-time\"></i> "+date[i].createDate+"</time>\n" +
                                "                    <span class=\"views\"><i class=\"glyphicon glyphicon-eye-open\"></i><i style='padding-left:3px'>"+date[i].watchCount+"</i></span> <span class=\"comment\"  title=\"评论\" target=\"_blank\"><i class=\"glyphicon glyphicon-comment\"></i><i style='padding-left:3px'>"+date[i].postReplyCount+"</i></span>\n" +
                                "                </p>\n"+date[i].description+"</div></article>";
                        }
                        $("#articleid").html(articleDiv);
                    }
                },'json');
        }
        $("#spend").click(function () {
            var boolean = true;
            if($("#titeid").val()=="" && $("#titeid").val().length==0){
                alert("帖子标题不能为空");
                boolean= false;
            }
            else if($("#titeid").val().length>35){
                alert("帖子标题长度太长,长度不能超过35个字");
                boolean= false;
            }
            else if(editor.txt.html()=="<p><br></p>"){
                alert("帖子内容不能为空");
                boolean= false;
            }
            else if(boolean){
                $.ajax({
                    url : "<%=path%>/post" ,
                    type : "post" ,
                    data : {action : "addpost" ,titeid : $("#titeid").val() , postContent : editor.txt.html() ,secondId :${secondId} } ,
                    dataType : "json" ,
                    success : function(result){
                        // alert(data.message=="操作成功");
                        if(result.code==401){
                            alert("未登录,请登录后再操作");
                            window.location.href="<%=path%>/user?action=toLogin";
                        }
                        else if(result.message=="操作成功"){
                            $("#titeid").val("");
                            editor.txt.clear();
                            postlist({action : 'postListpage',secondId :${secondId} });
                        }
                        else{
                            alert(result.data);
                        }

                    },
                    error : function(){
                        alert("服务器加载时出错");
                    }
                });
            }
        });
    })
</script>

<script type="text/javascript">

    $("#to_top").click(function () {
        $('html,body').animate({ scrollTop: '0px' }, 1000);
    })

    // window.load= function(){
    //     var oTop = document.getElementById("to_top");
    //     var screenw = document.documentElement.clientWidth || document.body.clientWidth;
    //     var screenh = document.documentElement.clientHeight || document.body.clientHeight;
    //     oTop.style.left = screenw - oTop.offsetWidth +"px";
    //     oTop.style.top = screenh - oTop.offsetHeight + "px";
    //     window.onscroll = function(){
    //         var scrolltop = document.documentElement.scrollTop || document.body.scrollTop;
    //         oTop.style.top = screenh - oTop.offsetHeight + scrolltop +"px";
    //     }
    //     oTop.onclick = function(){
    //         document.documentElement.scrollTop = document.body.scrollTop =0;
    //     }
    // }

</script>

</body>
</html>