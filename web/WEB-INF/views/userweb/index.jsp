<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/default.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/search-form.css">

<%--  <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">--%>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/styles-merged.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/custom.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css">
  <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath }/static/js/vendor/html5shiv.min.js"></script>
      <script src="${pageContext.request.contextPath }/static/js/vendor/respond.min.js"></script>
    <![endif]-->
  <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.0.min.js"></script>
</head>
<body style="overflow:scroll;overflow-y:hidden">

<script type="text/javascript">
  function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');

    if(!container.hasClass('active')){
      container.addClass('active');
      evt.preventDefault();
    }else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
      container.removeClass('active');
      // clear input
      container.find('.search-input').val('');
      // clear and hide result container when we press close
      container.find('.result-container').fadeOut(100, function(){$(this).empty();});

    }else{
      //执行查询
      var seach=$(".search-input").val().trim();
      if(seach==null||seach==''){
        $(".result-container").css({"display":"block"});
        return false;
      }else{
        $(".result-container").css({"display":"none"});
      }
      $.post("${pageContext.request.contextPath}/postCategory?action=getBarByName",{className:seach},function(result){
        let date = result.data;
        var table="";
        for(var i=0;i<date.length;i++){
          if(i%3==0){
            table+="<div class='clearfix visible-sm-block'></div>";
          }
          table+="<div class='col-md-4 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'><div class='probootstrap-block-image'>"+
                  "<div class='text'><h3 class='mb30'><a href='${pageContext.request.contextPath}/user?action=forumpark&barId="+date[i].classId+"'>"+date[i].className+"</a></h3>"+
                  "<p class='dark' style='80px''>"+date[i].classDescribe+"</p><hr>"+
                  "<p class='clearfix like'><a class='pull-left' href='#'><i class='fa fa-heart'></i></a><a class='pull-right' href='${pageContext.request.contextPath}/user?action=forumpark&barId="+date[i].classId+"'><i class='fa fa-bars'></i></a></p>"+
                  "</div></div></div>";
        }
        $(".bar").html(table);
      },'json');

    }
  }
</script>
<script type="text/javascript">
  $(function(){
    showBar();
    function showBar(){

      $.post("${pageContext.request.contextPath}/postCategory?action=getAllBar",function(result){
        let date = result.data;
        var table="";
        for(var i=0;i<date.length;i++){
          if(i%3==0){
            table+="<div class='clearfix visible-sm-block'></div>";
          }
          table+="<div class='col-md-4 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'><div class='probootstrap-block-image'>"+
                  "<div class='text'><h3 class='mb30'><a href='${pageContext.request.contextPath}/user?action=forumpark&barId="+date[i].classId+"'>"+date[i].className+"</a></h3>"+
                  "<p class='dark' style='80px''>"+date[i].classDescribe+"</p><hr>"+
                  "<p class='clearfix like'><a class='pull-left' href='#'><i class='fa fa-heart'></i></a><a class='pull-right' href='${pageContext.request.contextPath}/user?action=forumpark&barId="+date[i].classId+"'><i class='fa fa-bars'></i></a></p>"+
                  "</div></div></div>";
        }
        $(".bar").html(table);
      },'json');

    }

  });
</script>
<style>
  /* .probootstrap-block-image {
      margin-bottom: 30px;
        background: linear-gradient(to right,#9b76ff 0,#f54ea2 100%);
  } */

</style>
<!-- START: header -->
<header role="banner" style="padding-top: 0px;height: 200px; background: url('<%=path%>/static/images/head/gnydy.png') no-repeat" class="probootstrap-header">
  <div class="container-fluid">

    <div class="mobile-menu-overlay"></div>
    <img style="position: absolute; left: 23%;height: 180px" src="<%=path%>/static/images/head/1-10.png">
    <nav role="navigation" class="probootstrap-nav hidden-xs">

      <ul class="probootstrap-main-nav">
        <li><a href="${pageContext.request.contextPath }/user?action=toLogin" >登录</a></li>
        <li><a href="${pageContext.request.contextPath }/user?action=toRegister">注册</a></li>
      </ul>
      <div class="extra-text visible-xs">
        <ul class="social-buttons">
          <li><a href="#"><i class="icon-twitter"></i></a></li>
          <li><a href="#"><i class="icon-facebook"></i></a></li>
          <li><a href="#"><i class="icon-instagram2"></i></a></li>
        </ul>
      </div>
    </nav>
    <div style="position: relative;width: 100%;height: 80px;">
      <div class="search-wrapper active">
        <div class="input-holder">
          <input type="text" class="search-input" placeholder="吧内搜索" />
          <button class="search-icon" onclick="searchToggle(this, event);"><i class="fa fa-search"></i></button>
        </div>
<%--        <span class="close" onclick="searchToggle(this, event);"></span>--%>
        <div style="font-size: 20px;color: red;" class="result-container">
          搜索内容不能为空
        </div>
      </div>
    </div>
  </div>
<%--  <img style="display: inline-block;" src="<%=path%>/static/images/head/gnydy.png" height="200px" width="100%">--%>
</header>
<!-- END: header -->

<!-- START: section -->
<section style="padding: 280px 0px 0px;" id="next-section" class="probootstrap-section">
  <div class="container">
    <div class="row bar">

    </div>
  </div>
</section>


<%--    <div style="position: absolute;width: 100%;height: 80px;transform:translate(0px,-500px)">--%>
<%--      <div class="search-wrapper">--%>
<%--        <div class="input-holder">--%>
<%--          <input type="text" class="search-input"/>--%>
<%--          <button style="display: block" class="search-icon" onclick="searchToggle(this, event);"><i class="fa fa-search"></i></button>--%>
<%--        </div>--%>
<%--        <span class="close" onclick="searchToggle(this, event);"></span>--%>
<%--        <div class="result-container">--%>
<%--          搜索内容不能为空--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>



<!-- START: footer -->
<%--    <div class="container" style="height: 100px">--%>
<%--      <div class="row text-center">--%>
<%--        <div class="col-lg-8 col-md-offset-2 mb30 section-heading probootstrap-animate">--%>
<%--          <h2 id="blink">执谁之笔 共赴锦上添花 为谁迷离 空守盛夏光年...</h2>--%>
<%--          <p class="lead">不要因为也许会改变，就不肯说出那句美丽的誓言，不要因为也许会分离，就不敢求一次倾心的相遇。——席慕容《印记》</p>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="row">--%>
<%--        <div class="col-md-4 col-md-offset-4 probootstrap-animate">--%>
<%--          <p class="text-center">--%>
<%--            <a href="#" class="btn btn-ghost btn-ghost-white btn-lg btn-block" role="button">联系我们</a>--%>
<%--          </p>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<footer role="contentinfo" class="probootstrap-footer">
  <div class="container">

    <div class="row mt40">
      <div class="col-md-12 text-center">
        <p>
          <small>来贴吧，一个畅谈的梦想的贴吧</small><br>
<%--          <a href="#" class="js-backtotop">回到顶部</a>--%>
        </p>
      </div>
    </div>
  </div>
</footer>
<!-- END: footer -->

<%-- h2 闪烁字体--%>
<%--<script language="javascript">--%>
<%--  function changeColor(){--%>
<%--    var color="#f00|bai#0f0|#00f|#880|#808|#088|yellow|green|blue|gray";--%>
<%--    color=color.split("|");--%>
<%--    document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)];--%>
<%--  }--%>
<%--  setInterval("changeColor()",200);--%>
<%--</script>--%>

<script src="${pageContext.request.contextPath }/static/js/scripts.js"></script>
<script src="${pageContext.request.contextPath }/static/js/main.js"></script>
<script src="${pageContext.request.contextPath }/static/js/custom.js"></script>

</body>
</html>