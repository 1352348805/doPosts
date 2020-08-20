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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.login.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/search-form.css">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/vendor/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.nav.css">
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
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/bootbox.min.js"></script>
  </head>
  <body>
  <script type="text/javascript">
  var barId=${param.barId};
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
			$.post("${pageContext.request.contextPath}/post/getPostByPostName",{name:seach ,barId:barId},function(date){
				date=eval(date);
					console.log(date);
					var table="";
						for(var i=0;i<date.length;i++){
							table+="<div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'>"+
				       		"<div class='probootstrap-block-image'><div class='text'><h3><a href='${pageContext.request.contextPath}/jsp/reply.jsp?postId="+date[i].postId+"'>"+date[i].postSubject+"</a>"+
			  				"<span class='clearfix like'>"+
			  					"<a class='hint info'href='#' title='"+date[i].postDate+"'><i class='fa fa-clock-o'>"+date[i].postDate+"</i></a>"+
			  					"<a class='hint info' href='#' title='主题作者："+date[i].accountName+"'><i class='fa fa-user'>"+date[i].accountName+"</i></a>"+
			  				"</span></h3>"+
			  				"<p class='dark' style='80px'>"+date[i].postContent+"</p>"+
			  				"<p><img src='${pageContext.request.contextPath }/img/img_1.jpg' style='width:50px ;height:50px'></p>"+
			  				"<hr><p class='clearfix like'>"+
			  				"<a class='pull-right hint unlike' href='"+date[i].postId+"'><i class='fa fa-thumbs-down'></i></a>"+
			  				"<a class='pull-right hint nlike' href='"+date[i].postId+"'><i class='fa fa-thumbs-up'></i></a>"+
			  				"<a class='pull-right hint' href='#'><i class='fa fa-heart'></i></a>"+
						"</p></div></div></div>"
						}
						$(".bar").html(table);
			});
			
		}
	}
  </script>
  <script type="text/javascript">
  		$(function(){
  			var barId=${param.barId};
  			showPost();
  			showBar();
  			
  			$(document).on("click",".unlike",function(event){
  				event.preventDefault();
  				var postId=$(this).attr("href");
  				var unlikesum=$(this).children().eq(0);
  				var likesum=$(this).next().children().eq(0);
  				var accountId="${sessionScope.account.accountId}";
  				if(accountId==null||accountId==''){
  				$("#accountLogin").modal('show');
  				return false;
  				}
  				var param={
  						postId:postId,
  						accountId:accountId,
  						EvaluateState:2
  						
  				}
  				$.post("${pageContext.request.contextPath}/replyEvaluate/doupatePostLike",param,function(date){
  					date=eval(date);
  					if(date.unlikeSum==unlikesum.html()){
  						alert("你已经点踩过了");
  					}else{
  						likesum.html(date.likeSum);
  						unlikesum.html(date.unlikeSum);
  					}
  					
  				});
  			});
  			$(document).on("click",".nlike",function(event){
  				event.preventDefault();
  				var postId=$(this).attr("href");
  				var likesum=$(this).children().eq(0);
  				var unlikesum=$(this).prev().children().eq(0);
  				var accountId="${sessionScope.account.accountId}";
  				if(accountId==null||accountId==''){
  				$("#accountLogin").modal('show');
  				return false;
  				}
  				var param={
  						postId:postId,
  						accountId:accountId,
  						EvaluateState:1
  						
  				}
  				$.post("${pageContext.request.contextPath}/replyEvaluate/doupatePostLike",param,function(date){
  					date=eval(date);
  					if(date.likeSum==likesum.html()){
  						alert("你已经点赞过了");
  					}else{
  						likesum.html(date.likeSum);
  						unlikesum.html(date.unlikeSum);
  					}
  					
  					
  				});
  			});
  			
  			//发表
  			$("#spend").click(function(event){
  				event.preventDefault();
  				var account="${sessionScope.account.accountId}";
  				if(account==null||account==''){
  				$("#accountLogin").modal('show');
  				}else{
  					$(".barId").val(barId);
  					$(".accountId").val("${sessionScope.account.accountId}");
  					$(".probootstrap-form").submit();
  				}
  			});
  			
  			//查询贴吧下所有的帖子
  			function showPost(){
  				$.post("${pageContext.request.contextPath}/post/getPostByBarId",{barId:barId},function(date){
  					date=eval(date);
  					console.log(date);
  					var table="";
  						for(var i=0;i<date.length;i++){
  							table+="<div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'>"+
  				       		"<div class='probootstrap-block-image'><div class='text'><h3><a href='${pageContext.request.contextPath}/jsp/reply.jsp?postId="+date[i].postId+"'>"+date[i].postSubject+"</a>"+
  			  				"<span class='clearfix like'>"+
  			  					"<a class='hint info'href='#' title='"+date[i].postDate+"'><i class='fa fa-clock-o'>"+date[i].postDate+"</i></a>"+
  			  					"<a class='hint info' href='#' title='主题作者："+date[i].accountName+"'><i class='fa fa-user'>"+date[i].accountName+"</i></a>"+
  			  				"</span></h3>"+
  			  				"<p class='dark' style='80px'>"+date[i].postContent+"</p>"+
  			  				"<p><img src='${pageContext.request.contextPath }/img/img_1.jpg' style='width:50px ;height:50px'></p>"+
  			  				"<hr><p class='clearfix like'>"+
  			  				"<a class='pull-right hint unlike' href='"+date[i].postId+"'><i class='fa fa-thumbs-down'></i></a>"+
  			  				"<a class='pull-right hint nlike' href='"+date[i].postId+"'><i class='fa fa-thumbs-up'></i></a>"+
  			  				"<a class='pull-right hint' href='#'><i class='fa fa-heart'></i></a>"+
							"</p></div></div></div>"
  						}
  						$(".bar").html(table);
  				});
  			}
  			function showBar(){
  				$.post("${pageContext.request.contextPath}/bar/skipPost",{barId:barId},function(date){
  					date=eval(date);
  					$(".barDescribe").html(date.barDescribe);
  					$(".barName").html(date.barName);
  				});
  			}
  			
  			
  			$(".file").click(function(){
  				document.getElementById("photo").click(); 
  			});
  			
  		});
  </script>
<style>
/* .probootstrap-block-image {
    margin-bottom: 30px;
  	background: linear-gradient(to right,#9b76ff 0,#f54ea2 100%);
} */
</style>
		<div class="leftNav-item">
			<ul>
				<li>
					<i class="fa fa-user-circle"></i>
					<a href="javascript:void(0)" class="rota">个人中心</a>
				</li>
				<li title="发帖子">
					<i class="fa fa-pencil-square-o"></i>
					<a href="#send"class="rota">发帖子</a>
				</li> 
				<li title="回到顶部" class="for-top">
					<i class="fa fa-arrow-up"></i>
					<a href="javascript:;" class="rota">去顶部</a>
				</li>
			</ul>
		</div>
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
  <style>
  .hint{
  	margin-right:20px;
  }
  .info{
      float: right;
	  color: #999 ! important;
  }
  </style>
  <!-- START: section -->
  <section class="probootstrap-intro" style="background-image: url(img/hero_bg_2.jpg);height: 400px;" data-stellar-background-ratio="0.5">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-7 probootstrap-intro-text">
          <h1 class="probootstrap-animate barName"></h1>
          <div class="probootstrap-subtitle probootstrap-animate">
            <h2 class="barDescribe">希望您可以在小贴吧里面找到自己的快乐 <a href="#" target="_blank"></a></h2>
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
				<input type="text" class="search-input" placeholder="吧内搜索" />
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
       	<div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'>
       		<div class='probootstrap-block-image'>
  				<div class='text'>
  				<h3><a href='#'>帖子标题</a>
  				<span class='clearfix like'>
  				<a class='hint info'href='#' title='发帖时间'><i class='fa fa-clock-o'>发帖时间</i></a>
  				<a class='hint info' href='#' title='发帖人'><i class='fa fa-user'>作者名字</i></a>
  				</span>
  					</h3>
  						<p class='dark' style='80px'>这是很长的的描述这是很长的的描述这是很长的的描述这是很长的的描述这是很长的的描述</p>
  						<p><img src="${pageContext.request.contextPath }/img/img_1.jpg" style="width:50px ;height:50px"></p>
  						<hr>
  						<p class='clearfix like'>
  							<a class='pull-right hint' href='#'><i class='fa fa-thumbs-down'></i></a>	
  							<a class='pull-right hint' href='#'><i class='fa fa-thumbs-up'></i></a>	
  							<a class='pull-right hint' href='#'><i class='fa fa-heart'></i></a>	
  						</p>
					</div>
				</div>
			</div>
      </div>
      <div class="row mb60" id="send">
        <div class="col-md-12  probootstrap-animate">
        <h4>发表新帖</h4>
          <form action="${pageContext.request.contextPath }/post/doInsPost" method="post" class="probootstrap-form" enctype="multipart/form-data">
          	<input type='text' style='display:none' class='barId' name='barId' value=''>
          	<input type='text' style='display:none' class='accountId' name='accountId' value=''>
            <div class="form-group">
              <label for="name">帖子标题</label>
              <input type="text" class="form-control" id="postSubject" name="postSubject">
            </div>
            <div class="form-group">
              <label for="message">帖子内容</label>
              <textarea cols="30" rows="10" class="form-control" id="postContent" name="postContent"></textarea>
            </div>
            <div class="form-group">
            		<span style="foalt:left;" class='file'>
            			<i class="fa fa-file-image-o hint" aria-hidden="true">
            			<input type='file' id="photo" style="display:none;" name='file'></i> 
            		</span>
            		<span>
            		<i class="fa fa-file" aria-hidden="true"></i>
            		</span>
            </div>
            <div class="form-group">
              <input type="button" class="btn btn-primary" id="spend" name="submit" value="发表">
            </div>
          </form>
        </div>
       
      </div>
      
      
    </div>
  </section>
	
	<!-- 登录框  -->
  	<div class="export" >
				<div class="modal fade" id="accountLogin" style="opacity: 1.0 !important;">
					<div class="modal-dialog motai">
						<div class="modal-content" style="border-radius: 30px 30px 50px 50px;background: rgba(10, 10, 10, 0.17);">
							<div class="sub-main-w3">
								<form id='form' action="${pageContext.request.contextPath }/account/login" method="post" target="target" style="margin: 0px;">
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
								<iframe name="target" style="display:none" ></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
  

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
  <script src="${pageContext.request.contextPath }/js/js.nav.js"></script>
<script src="${pageContext.request.contextPath }/js/canva_moving_effect.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-form.js"></script>
<!-- //Jquery -->
<script type="text/javascript">
	$(function(){
		$("#form").ajaxForm(function(data){  
			if(data==true||data=='true'){
				 window.location.reload();
			}else{
				alert("账号或密码错误，请重新登录");
				$(".Name").val('');
				$(".Password").val('');
				
			}
		}); 
		$(".probootstrap-form").ajaxForm(function(data){  
			if(data==true||data=='true'){
				alert("发表成功");
				 window.location.reload();
			}else{
				alert("发表失败");
				$("#postSubject").val('');
				$("#postContent").val('');
			}
		}); 
		
	});
</script>
  </body>
</html>