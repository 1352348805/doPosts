<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <%
        String path = request.getContextPath();
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${post.postName}</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.login.css" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/search-form.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.nav.css">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css">
    <!--[if lt IE 9]>
    <script src="/static/js/vendor/html5shiv.min.js"></script>
    <script src="/static/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"
            type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootbox.min.js"></script>
    <script>
        <c:if test="${user != null}">
        var user = <%=JSON.toJSONString(session.getAttribute("user"))%>;
        </c:if>
    </script>
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
<body>


<style>
    /* .probootstrap-block-image {
        margin-bottom: 30px;
          background: linear-gradient(to right,#9b76ff 0,#f54ea2 100%);
    } */
</style>

<!-- START: header -->
<!-- END: header -->
<style>
    .hint {
        margin-right: 20px;
    }

    .info-left {
        float: left;
        font-size: 16px;
        color: black ! important;
    }

    .info-right {
        float: right;
        font-size: 16px;
        color: black ! important;
    }
</style>
<!-- START: section -->
<%--<section class="probootstrap-intro"--%>
<%--         style="background-image: url(${pageContext.request.contextPath }/static/images/head/gnydy.png);height: 200px; background-size: 100% 200px;"--%>
<%--         data-stellar-background-ratio="0.5">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-7 probootstrap-intro-text">--%>
<%--                <h1 class="probootstrap-animate barName"></h1>--%>
<%--                <div class="probootstrap-subtitle probootstrap-animate">--%>
<%--                    <h2 class="barDescribe">希望您可以在小贴吧里面找到自己的快乐 <a href="#" target="_blank"></a></h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <a class="probootstrap-scroll-down js-next" href="#next-section">Scroll down <i class="icon-chevron-down"></i></a>--%>
<%--</section>--%>
<!-- END: section -->

<div style="height: 100px;width: 1170px;border:rgb(225 226 230) solid 1px;margin: 0 auto;">
    <div style="padding: 20px"><h1 style="margin: 0px;">${requestScope.post.postName}</h1></div>
</div>

<div style="width: 1170px;border:rgb(225 226 230) solid 1px;margin: 0 auto;">
    <div class="gd" style=" float: left; display: inline-block; background: rgb(251,251,253);width: 130px; height:198px; padding: 20px">
        <ul style="width: 130px; height: 170px">
            <li>
                <div>
                    <c:choose>
                        <c:when test="${post.favicon != ''}">
                            <a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${user.userId}">
                                <img src="${pageContext.request.contextPath }/${post.favicon}" style="width:80px ;height:80px;border: silver solid 1px; ">
                            </a>
                        </c:when>
                        <c:otherwise>
                        <a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${user.userId}">
                            <img src="${pageContext.request.contextPath }/static/images/user_default_icon.png" style="width:80px ;height:80px;border: silver solid 1px; ">
                            </a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </li>
            <br>
            <li>
                <a class="hint info-left" href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${post.createUserId}" title="发帖人"><i class="fa fa-user">${post.userName}</i></a>
            </li>
        </ul>
    </div>
    <div style="display: inline-block;width: 1035px;height:100%;" class="probootstrap-block-image">
        <div class="text" style="padding: 0px 0px 8px 20px;">
            <div style="padding: 20px 20px 0px 0px ">
                        <span class="clearfix like">
  				<a class="hint info-right date" href="#" title="发帖时间" style="margin: 0px 0px 0px 0px">
                    <i class="fa fa-clock-o">发帖时间&nbsp;:&nbsp;${requestScope.post.createDate}</i>
                </a>
  				</span>
                <div style="margin: 20px;padding-bottom: 50px;"><p> ${requestScope.post.description}</p></div>

            </div>
            <div style=" float: right;  width: 240px; height: 20px;margin: 10px">
                <div class="hf" style="float: right">
                    <span><a href="javascript:;" onclick="delPost(${post.postId})">删除</a>&nbsp;</span>
                </div>
            </div>
        </div>
    </div>
</div>

<section id="next-section" class="probootstrap-section">
    <div class="container" id="sx">
        <div class="row bar wyggd sxx" style="border:rgb(225 226 230) none 1px ; border-top: none;">
        </div>
        <c:forEach items="${floor}" var="item">
            <div class="row bar wyggd sxx" style="border:rgb(225 226 230) solid 1px ; border-top: none;">
                <div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'
                     style="padding: 0px 0px 0px 0px; height: 100%;display: inline-block;width: 100%;height: 100% ">
                    <div class="gd"
                         style=" float: left; display: inline-block; background: rgb(251,251,253);width: 130px; height:198px; padding: 20px">
                        <ul style="width: 130px; height: 170px">
                            <li>
                                <div>
                                    <c:choose>
                                        <c:when test="${item.favicon != null}">
                                            <img src="${pageContext.request.contextPath }/${item.favicon}" style="width:80px ;height:80px;border: silver solid 1px; ">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath }/static/images/user_default_icon.png" style="width:80px ;height:80px;border: silver solid 1px; ">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </li>
                            </br>
                            <li>
                                <a class='hint info-left' href='${pageContext.request.contextPath }/user?action=toUserCenter&uid=${item.createUserId}' title='发帖人'><i class='fa fa-user'>${item.userName}</i></a>
                            </li>
                        </ul>
                    </div>
                    <div style="display: inline-block;width: 1035px;height:100%;" class='probootstrap-block-image'>
                        <div class='text' style="padding: 0px 0px 8px 20px;">
                            <div style="padding: 20px 20px 0px 0px ">
                        <span class='clearfix like'>
  				<a class='hint info-right date' href='#' title='发帖时间' style="margin: 0px 0px 0px 0px">
                    <i class='fa fa-clock-o'>发帖时间&nbsp;:&nbsp;${item.sendDate}</i>
                </a>
  				</span>
                                <div style="margin: 20px;padding-bottom: 50px;">${item.postContent}</div>

                            </div>
                            <div style=" float: right;  width: 240px; height: 20px;margin: 10px">
                                <div class="hf" style="float: right">
                                    <span><a href="javascript:;" floor="${item.postFloor}" onclick="ShowOrHideReply(this)">展开</a>&nbsp;</span>
                                    <span><a href="javascript:;" floor="${item.postFloor}" onclick="deleteFloor(${post.postId},${item.postFloor},this)">删除</a>&nbsp;</span>
                                </div>

                                <div style=" float: right; ">
                                 <span><a href="#">
                                     <img src="${pageContext.request.contextPath }/static/images/jb.png " width="35px"
                                          height="15px">
                                 </a></span>
                                    <span class="tail-info">来自
                                     <a href="#">Android客户端</a>
                                 </span>
                                    <span class="tail-info" >${item.postFloor}楼</span>&nbsp;
                                </div>
                            </div>
                            <div style=" display: none;  border: rgb(240 241 242) solid 1px;height:100%; width: 650px; background : rgb(247 248 250); padding: 4px 15px 14px 15px">
                                <ul style="margin: 0px 0px 0px 0px " replyView="${item.floorId}">
                                    <c:forEach items="${item.replyList}" var="replys">
                                        <li style=" height: 45px;"  >
                                            <a href=""
                                               style=" width: 32px; height: 32px;display: inline-block; float: left;margin: 10px 10px 0px 0px">
                                                <c:choose>
                                                    <c:when test="${replys.favicon != ''}">
                                                        <img src="${pageContext.request.contextPath }/${replys.favicon}"
                                                             style="border: silver 1px solid; width: 32px; height: 32px;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img id="wcnm" src="${pageContext.request.contextPath }/static/images/38891f42b97e4bbdb4389d250422bd68.jpg"
                                                             style="border: silver 1px solid; width: 32px; height: 32px;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                            <div style="display: inline-block; margin-top: 10px;width: 575px " replyUserId="${replys.replyUserId}">
                                                <c:choose>
                                                    <c:when test="${replys.repliedUserId==null}">
                                                        <a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${replys.replyUserId}">${replys.userName}:</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${replys.replyUserId}">${user.userName}</a> 回复 <a href="${pageContext.request.contextPath }/user?action=toUserCenter&uid=${replys.repliedUserId}">${replys.repliedUserName}</a>：;
                                                    </c:otherwise>
                                                </c:choose>
                                                <span>${replys.replyContent}</span>
                                                <div style=" float: right;padding: 10px 0px 0px 0px ">
                                                    <span>${replys.replyDate}</span>
                                                    <a href="javascript:;" id="replys" onclick="deleteReply(${replys.replyId},this)">删除</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <div    class=" replyFloors"  style="display: none;  ">
                                    <div class="layui-form-item layui-form-text">
                                        <div class="layui-input-block" style="margin: 0px">
                                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" floorId="${item.floorId}" ></textarea>
                                        </div>
                                    </div>
                                    <div style="margin: 0px 0px 0px 570px">
                                        <input type="button" onclick="replyOfFloor(this,${item.floorId},${item.postFloor})"  id="submits" value="发表"/>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>


        <div  id="page" style="padding: 30px 0px 0px 30px; float: right"></div>



    </div>
</section>

<!-- 登录框  -->
<div class="export">
    <div class="modal fade" id="accountLogin" style="opacity: 1.0 !important;">
        <div class="modal-dialog motai">
            <div class="modal-content" style="border-radius: 30px 30px 50px 50px;background: rgba(10, 10, 10, 0.17);">
                <div class="sub-main-w3">
                    <form id='form' action="${pageContext.request.contextPath }/account/login" method="post"
                          target="target" style="margin: 0px;">
                        <div class="form-style-agile">
                            <label>
                                <i class="fas fa-user"></i>
                                用户名
                            </label>
                            <input class="Name" placeholder="Username" name="Name" type="text" required="">
                        </div>
                        <div class="form-style-agile">
                            <label>
                                <i class="fas fa-unlock-alt"></i>
                                密码
                            </label>
                            <input class="Password" placeholder="Password" name="Password" type="password" required="">
                        </div>
                        <!-- checkbox -->
                        <div class="wthree-text">
                            <ul>
                                <li>
                                    <label class="anim">
                                        <input type="checkbox" class="checkbox" required="">
                                        <span>我已阅读并同意服务条款</span>
                                    </label>
                                </li>
                                <li>
                                    <a href="#">忘记密码</a>|<a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a>
                                </li>
                            </ul>
                        </div>
                        <!-- //checkbox -->
                        <input type="submit" class="login" value="登录">
                    </form>
                    <iframe name="target" style="display:none"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- START: footer -->
<footer role="contentinfo" class="probootstrap-footer">
    <div class="container">

        <div class="row mt40">
            <div class="col-md-12 text-center">
                <p>
                    <small>小贴吧，一个畅谈的梦想的贴吧</small><br>
                    <a href="#" class="js-backtotop">回到顶部</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- END: footer -->
<input type="hidden" id="path" value="<%=path%>"/>
<script src="${pageContext.request.contextPath}/static/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/static/js/js.nav.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin/jq.js"></script>
<script src="${pageContext.request.contextPath}/static/js/canva_moving_effect.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-form.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/wangEditor-3.1.1/release/wangEditor.js"></script>
<script type="text/javascript">
    var path = $("#path").val();


    //删除帖子
    function delPost(id) {
        if(confirm('确定要删除该帖吗?')) {
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
                        alert('删除成功!');
                        location.href= path + "/admin?action=postList";

                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        }
    }

    //删楼
    function deleteFloor(postId,floorId,obj) {
        if(confirm('确定要删除该楼层吗?')) {
            let data = {
                action : 'deleteFloor',
                postId : postId,
                floorId : floorId
            }
            $.ajax({
                type : 'post',
                url : path + '/admin',
                data : data,
                dataType: 'json',
                success : function(data) {
                    if (data.code == 200) {
                        alert('删除成功!');
                        $(obj).parent().parent().parent().parent().parent().parent().remove();

                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        }
    }

    //删回复
    function deleteReply(replyId,obj) {
        if(confirm('确定要删除该回复吗?')) {
            let data = {
                action : 'deleteReply',
                replyId : replyId
            }
            $.ajax({
                type : 'post',
                url : path + '/admin',
                data : data,
                dataType: 'json',
                success : function(data) {
                    if (data.code == 200) {
                        alert('删除成功!');
                        $(obj).parent().parent().parent().remove();

                    } else {
                        layer.msg(data.message);
                    }
                }
            });
        }
    }

    function getQueryVariable(variable)

    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }

    //分页操作
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        let count;

        let data = {
            action :'floorCount',
            postid : ${postid},
        }
        $.ajaxSettings.async = false;
        $.post(path + '/user',data,function (result) {
            count = result.data;
        },'json');
        $.ajaxSettings.async = true;
        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,limit: 10
            ,curr: getQueryVariable('pageindex')
            ,count: count  //数据总数，从服务端得到
            ,
            jump: function(e, first){ //触发分页后的回调
                if(!first){ //一定要加此判断，否则初始时会无限刷新
                    let pageIndex = e.curr; //当前页
                    let pageSize = e.limit;

                    location.href = path + "/user?action=postAndfloor&postid=${postid}&pageindex="+pageIndex+"&pageSize="+pageSize;
                    //有postid应拼接
                }
            }
        });
    });



</script>
<!-- //Jquery -->

<script type="text/javascript">
    //回复信息显示和隐藏
    function ShowOrHideReply(obj) {
        $obj = $(obj);
        $reply = $obj.parent().parent().parent().next();
        if ($reply.css('display') == 'none') {
            $reply.css('display', 'block');
        } else {
            $reply.css('display', 'none');
        }
    }
    function conceal(obj) {
        $obj = $(obj);
        $conceal = $obj.parent().parent().parent().next();
        if ($conceal.css('display') == 'none') {
            $conceal.css('display', 'block');
        } else {
            $conceal.css('display', 'none');
        }
    }

    var replyUserId=null;

    var  userName=null;

    var floor = {};


    function fanzhuanyi(str){
        var temp = "";
        if(str.length == 0) return "";
        temp = str.replace(/&amp;/g,"&");
        temp = temp.replace(/&lt;/g,"<");
        temp = temp.replace(/&gt;/g,">");
        temp = temp.replace(/&nbsp;/g," ");
        temp = temp.replace(/&#39;/g,"\'");
        temp = temp.replace(/&quot;/g,"\"");
        return temp;
    }

</script>
</body>
<script>
    var hg;
    var em;
    $(".hf").click(function () {
        $(this).parent().parent().parent().prev().css("height", "" + $(this).parent().parent().parent().height() + "px");
        hg = $(this).parent().parent().parent().height();
        em = $(this).parent().parent().parent().prev();
    });
    $(".wysyg").click(function () {
        em.css("height", "" + (hg + 170) + "px");
    });
    <c:forEach items="${floor}" var="item"><c:if test="${item.replyList.size() > 0}">$("[floor='${item.postFloor}']").get(0).click();console.log("第${item.postFloor}楼有回复，回复数据已展开！");
    </c:if></c:forEach>
</script>
</html>