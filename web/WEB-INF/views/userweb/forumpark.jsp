<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<%
		 String path = request.getContextPath();
	     String barid= (String) request.getAttribute("barid");
	%>
	<link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Home</title>
	<link href="<%=path%>/static/css/forumpark/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--theme-style-->
	<link href="<%=path%>/static/css/forumpark/style.css" rel="stylesheet" type="text/css" media="all" />
	<!--//theme-style-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--//fonts-->
	<script src="<%=path%>/static/js/forumpark/jquery.min.js"></script>
	<script src="<%=path%>/static/js/forumpark/jquery.easydropdown.js"></script>
	<!--script-->
</head>
<body>
<!--header-->
<div class="header">
	<div class="top-header">
		<div class="container">
			<div class="top-header-left">
				<ul class="support">
					<li><a href="#"><label> </label></a></li>
					<li><a href="#">24x7 live<span class="live"> support</span></a></li>
				</ul>
				<ul class="support">
					<li class="van"><a href="#"><label> </label></a></li>
					<li><a href="#">Free shipping <span class="live">on order over 500</span></a></li>
				</ul>
				<div class="clearfix"> </div>
			</div>
			<div class="top-header-right">
				<div class="down-top">

					<select tabindex="4" class="dropdown">
						<option value="" class="label" value="">English</option>
						<option value="1">Japanese</option>
						<option value="2">French</option>
						<option value="3">German</option>
					</select>
				</div>
				<div class="down-top top-down">

					<select tabindex="4" class="dropdown ">
						<option value="" class="label" value="">Currency :USD</option>
						<option value="1">Dollar</option>
						<option value="2">Euro</option>
					</select>
				</div>

				<!---->
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="bottom-header">
		<div class="container">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="index.html"><img src="<%=path%>/static/images/forumpark/logo.png" alt=" " /></a>
				</div>
				<div class="search">
					<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
					<input type="submit"  value="SEARCH">

				</div>
				<div class="clearfix"> </div>
			</div>
<%--			<div class="header-bottom-right">--%>
<%--				<ul class="men-grid">--%>
<%--					<li><a href="login.html"><span> </span>YOUR ACCOUNT</a></li>--%>
<%--					<li class="login"><a href="login.html"><span> </span>LOGIN</a>|</li>--%>
<%--					<li class="cart"><a href="#"><span> </span>CART</a></li>--%>
<%--				</ul>--%>
<%--				<div class="sign-up-right">--%>
<%--					<a href="register.html">SIGNUP</a>--%>
<%--				</div>--%>
<%--			</div>--%>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!---->
<div class="tlinks">Collect from <a href="http://www.baisheng999.com/" >网页模板</a></div>
<div class="container">
	<div class="banner-menu">

		<div class="shoes-grid">
			<div class="wmuSlider example1 slide-grid">
				<div class="wmuSliderWrapper">
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/youxi2.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 1;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/dongman.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 2;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/timg.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 3;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/tiyu.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 4;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/dianying.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 5;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/xiaoshuo.png" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
				</div>
				<ul class="wmuSliderPagination">
					<li><a href="#" class="">0</a></li>
					<li><a href="#" class="">1</a></li>
					<li><a href="#" class="">2</a></li>
				</ul>
			</div>

			<script src="<%=path%>/static/js/forumpark/jquery.wmuSlider.js"></script>
			<script>
				$('.example1').wmuSlider();
			</script>
			<!---->
			<div class="shoes-grid-left">


			</div>

			<div class="product-left">


				<div class="clearfix"> </div>
			</div>

			<div class="product-left">

				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="sub-cate">
			<div class=" top-nav rsidebar span_1_of_left">
				<h3 class="cate">全部贴吧分类</h3>
				<ul class="menu">
					<ul class="kid-menu ">
<%--						<li><a href="#">date[i].className</a></li>--%>
<%--						<li><a href="product.html">Urna ac tortor sc</a></li>--%>
<%--						<li><a href="product.html">Ornared id aliquet</a></li>--%>
<%--						<li><a href="product.html">Urna ac tortor sc</a></li>--%>
<%--						<li><a href="product.html">Eget nisi laoreet</a></li>--%>
<%--						<li><a href="product.html">Faciisis ornare</a></li>--%>
<%--						<li class="menu-kid-left"><a href="contact.html">Contact us</a></li>--%>
					</ul>
				</ul>
			</div>
			<!--initiate accordion-->
			<script type="text/javascript">
				$(function() {
					var menu_ul = $('.menu > li > ul'),
							menu_a  = $('.menu > li > a');
					menu_ul.hide();
					menu_a.click(function(e) {
						e.preventDefault();
						if(!$(this).hasClass('active')) {
							menu_a.removeClass('active');
							menu_ul.filter(':visible').slideUp('normal');
							$(this).addClass('active').next().stop(true,true).slideDown('normal');
						} else {
							$(this).removeClass('active');
							$(this).next().stop(true,true).slideUp('normal');
						}
					});

				});
			</script>
			<div class=" chain-grid menu-chain">
				<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/wat.jpg" alt=" " /></a>
				<div class="grid-chain-bottom chain-watch">
					<span class="actual dolor-left-grid">300$</span>
					<span class="reducedfrom">500$</span>
					<h6>Lorem ipsum dolor</h6>
				</div>
			</div>
			<a class="view-all all-product" href="product.html">VIEW ALL PRODUCTS<span> </span></a>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!---->
  <script type="text/javascript">
	  $(function(){
	  	kid_menu();
	  	function kid_menu(){
	  		$.post("${pageContext.request.contextPath}/postCategory?action=getSecondLevelBarByName&barId=<%=barid%>",
					function (result) {
                     let date = result.data;
                     var menu_div = "";
                     for(var i = 0 ; i < date.length ; i++){
						 menu_div += " <li><a href=\"#\">"+date[i].className +"</a></li>";
					 }
                     $(".kid-menu").html(menu_div);

			        },'json'
			);
		}

	  });
  </script>
</body>
</html>