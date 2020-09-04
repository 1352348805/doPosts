<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%
		String path = request.getContextPath();
		String barid= (String) request.getAttribute("barid");
	%>
	<link rel="shortcut icon" href="<%=path%>/static/images/head/500415.ico" />
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/search-form.css">
	<link href="<%=path%>/static/css/forumpark/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--theme-style-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
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
	<style>
		.categoryImg {
			margin-left: 15px;
			width: 130px;
			height: 130px;
		}
	</style>
</head>
<body>
<!--header-->
<jsp:include page="../common/user/head.jsp"/>
<div class="bottom-header">
	<div class="container">
		<div class="header-bottom-left">
			<div class="logo">
				<a href="index.html">
					<img style="height: 160px; padding-left: 100px" src="${pageContext.request.contextPath }/static/images/head/1-10.png" alt=" " />
				</a>
			</div>
		</div>
		<div class="header-bottom-right" style="position: absolute;left: 27%;margin-top: 130px">
			<ul class="nav navbar-nav navbar-right" id="one_category">
				<li><a href="${pageContext.request.contextPath }/user?action=index">首页</a></li>

			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>

<div class="container">
	<div class="banner-menu">

		<div class="shoes-grid">
			<div class="wmuSlider example1 slide-grid">
				<div class="wmuSliderWrapper">
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/youxi2.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 1;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/dongman.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 2;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/timg.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 3;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/tiyu.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 4;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/dianying.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 5;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/xiaoshuo.png" alt=" " />
							<%--							<div class="banner-off">--%>
							<%--								<h2>FLAT 50% 0FF</h2>--%>
							<%--								<span>FOR ALL PURCHASE <b>VALUE</b></span>--%>
							<%--								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
							<%--								<a class="now-get" href="#">GET NOW</a>--%>
							<%--							</div>--%>
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

			<%--贴吧展示--%>
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
		<div class="sub-cate" style="position: fixed;left: 24.3%;width: 13%;">
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
			<%--			<a class="view-all all-product" href="product.html">VIEW ALL PRODUCTS<span> </span></a>--%>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<input type="hidden" id="pid" value="<%=barid%>"/>
<div style="display: inline-block"></div>
<!---->
<script type="text/javascript">

	// 展示一级贴吧分类的下所有三级贴吧
	function threelevelbar(id){
		$.post("${pageContext.request.contextPath}/postCategory?action=getThreeLevelAllBarByName&barId="+id,
				function (result) {
					let date = result.data;
					var bardiv = "" ;
					for(var i = 0 ; i < date.length ; i++){
						bardiv +="<div class=\" con-sed-grid\">\n" +
								"\t\t\t\t\t<div style=\"float:right\" class=\"elit-grid\">\n" +
								// "\t\t\t\t\t\t<h4>consectetur  elit</h4>\n" +
								"\t\t\t\t\t\t<span style=\"margin-bottom: 20px;display: inline-block;\"><a href=\"<%=path%>/user?action=postListpage&secondId="+date[i].classId+"\">"+date[i].className+"</a></span>\n" +
								"\t\t\t\t\t\t<p>";
						if(!(date[i].classDescribe === undefined)) {
							if (date[i].classDescribe.length > 40) {
								bardiv += date[i].classDescribe.substring(0,40);
								bardiv += "...";
							} else {
								bardiv += date[i].classDescribe;
							}
						}

						bardiv+= "</p>\n" +
								"\t\t\t\t\t</div>\n" +
								"\t\t\t\t\t<a href=\"single.html\"><img class=\"img-responsive shoe-left categoryImg\" src=\""+date[i].imageUrl+"\" alt=\" \"></a>\n" +
								"\t\t\t\t\t<div class=\"clearfix\"> </div>\n" +
								"\t\t\t\t</div>\n" ;
						if(++i<date.length){
							bardiv+="\t\t\t\t<div class=\"con-sed-grid sed-left-top\">\n" +
									"\t\t\t\t\t<div style=\"float:right\" class=\"elit-grid\">\n" +
									// "\t\t\t\t\t\t<h4>consectetur  elit</h4>\n" +
									"\t\t\t\t\t\t<span style=\"margin-bottom: 20px;display: inline-block;\"><a href=\"<%=path%>/user?action=postListpage&secondId="+date[i].classId+"\">"+date[i].className+"</a></span>\n" +
									"\t\t\t\t\t\t<p>";
							if(!(date[i].classDescribe === undefined)) {
								if (date[i].classDescribe.length > 30) {
									bardiv += date[i].classDescribe.substring(0,40);
									bardiv += "...";
								} else {
									bardiv += date[i].classDescribe;
								}
							}
							bardiv+="</p>\n" +
									"\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t<a href=\"single.html\"><img class=\"img-responsive shoe-left categoryImg\" src=\""+date[i].imageUrl+"\" alt=\" \"></a>\n" +
									"\t\t\t\t\t<div class=\"clearfix\"> </div>\n" +
									"\t\t\t\t</div>";
						}

					}
					$(".shoes-grid-left").html(bardiv);
				},'json');
	}

	function selectThreeClassById(id) {
		threelevelbar(id);
	}

	$(function(){
		kid_menu();
		threelevelbar($("#pid").val());
		// 展示页面左边导航栏
		function kid_menu(){
			$.post("${pageContext.request.contextPath}/postCategory?action=getSecondLevelBarByName&barId=<%=barid%>",
					function (result) {
						let date = result.data;
						var menu_div = "";
						for(var i = 0 ; i < date.length ; i++){
							//date[i].classId
							menu_div += " <li><a href=\"javascript:;\" onclick='selectThreeClassById("+date[i].classId+");'>"+ date[i].className +"</a></li>";
						}
						$(".kid-menu").html(menu_div);

					},'json'
			);
		}

		$.post("${pageContext.request.contextPath}/postCategory?action=getAllBar",function(result){
			let date = result.data;
			var table="\t  <li><a href=\"<%=path%>/user?action=index\">首页</a></li>";
			for(var i=0;i<date.length;i++){
				table += "\t  <li><a href=\"${pageContext.request.contextPath}/user?action=forumpark&barId="+date[i].classId+"\">"+date[i].className+"</a></li>";
			}
			$("#one_category").html(table);
		},'json');
	});
</script>
</body>
</html>