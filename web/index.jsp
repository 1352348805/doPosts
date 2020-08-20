<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/search-form.css">
    
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/font-awesome/css/font-awesome.css">
    <!--[if lt IE 9]>
      <script src="js/vendor/html5shiv.min.js"></script>
      <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
  </head>
  <body>
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
			$.post("${pageContext.request.contextPath}/bar/getBarByName",{name:seach},function(date){
					date=eval(date);
					var table="";
					for(var i=0;i<date.length;i++){
					if(i%3==0){
						table+="<div class='clearfix visible-sm-block'></div>";
					}
					table+="<div class='col-md-4 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'><div class='probootstrap-block-image'>"+
					"<div class='text'><h3 class='mb30'><a href='${pageContext.request.contextPath}/jsp/post.jsp?barId="+date[i].barId+"'>"+date[i].barName+"</a></h3>"+
					"<p class='dark' style='80px''>"+date[i].barDescribe+"</p><hr>"+
					"<p class='clearfix like'><a class='pull-left' href='#'><i class='fa fa-heart'></i></a><a class='pull-right' href='${pageContext.request.contextPath}/jsp/post.jsp?barId="+date[i].barId+"'><i class='fa fa-bars'></i></a></p>"+
					"</div></div></div>";
					}
					$(".bar").html(table);
			});
			
		}
	}
  </script>
  <script type="text/javascript">
  		$(function(){
  			showBar();
  			function showBar(){
  				
  				$.post("${pageContext.request.contextPath}/bar/getAllBar",function(date){
  					date=eval(date);
  					var table="";
  					for(var i=0;i<date.length;i++){
						if(i%3==0){
							table+="<div class='clearfix visible-sm-block'></div>";
						}
  						table+="<div class='col-md-4 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'><div class='probootstrap-block-image'>"+
						"<div class='text'><h3 class='mb30'><a href='${pageContext.request.contextPath}/jsp/post.jsp?barId="+date[i].barId+"'>"+date[i].barName+"</a></h3>"+
						"<p class='dark' style='80px''>"+date[i].barDescribe+"</p><hr>"+
						"<p class='clearfix like'><a class='pull-left' href='#'><i class='fa fa-heart'></i></a><a class='pull-right' href='${pageContext.request.contextPath}/jsp/post.jsp?barId="+date[i].barId+"'><i class='fa fa-bars'></i></a></p>"+
						"</div></div></div>";
  					}
  					$(".bar").html(table);
  				});
  				
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
	<header role="banner" class="probootstrap-header">
    <div class="container-fluid">
      
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li><a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a></li>
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
  </header>
  <!-- END: header -->
  
  <!-- START: section -->
  <section class="probootstrap-intro" style="background-image: url(img/hero_bg_2.jpg);" data-stellar-background-ratio="0.5">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-7 probootstrap-intro-text">
          <h1 class="probootstrap-animate">小贴吧</h1>
          <div class="probootstrap-subtitle probootstrap-animate">
            <h2>希望您可以在小贴吧里面找到自己的快乐 <a href="#" target="_blank"></a></h2>
          </div>
        </div>
      </div>
    </div>
    <a class="probootstrap-scroll-down js-next" href="#next-section">Scroll down <i class="icon-chevron-down"></i></a>
  </section>
  <!-- END: section -->
	
	<div style="position: relative;width: 100%;height: 80px;">
		 <div class="search-wrapper">
			<div class="input-holder">
				<input type="text" class="search-input" placeholder="Type to search" />
				<button class="search-icon" onclick="searchToggle(this, event);"><i class="fa fa-search"></i></button>
			</div>
			<span class="close" onclick="searchToggle(this, event);"></span>
			<div class="result-container">
				搜索内容不能为空
			</div>
		</div>
	</div>		
  <section id="next-section" class="probootstrap-section">
    <div class="container">
      <div class="row bar">
       
      </div>
    </div>
  </section>

  

  <!-- START: section -->
  <section class="probootstrap-section probootstrap-section-colored">
    <div class="container">
      <div class="row text-center">
        <div class="col-lg-8 col-md-offset-2 mb30 section-heading probootstrap-animate">
          <h2>执谁之笔 共赴锦上添花 为谁迷离 空守盛夏光年...</h2>
          <p class="lead">不要因为也许会改变，就不肯说出那句美丽的誓言，不要因为也许会分离，就不敢求一次倾心的相遇。——席慕容《印记》</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-md-offset-4 probootstrap-animate">
          <p class="text-center">
            <a href="#" class="btn btn-ghost btn-ghost-white btn-lg btn-block" role="button">联系我们</a>
          </p>
        </div>
      </div>
    </div>
  </section>
  <!-- END: section -->
  
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

  <script src="${pageContext.request.contextPath }/js/scripts.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/main.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/custom.js"></script>

  </body>
</html>