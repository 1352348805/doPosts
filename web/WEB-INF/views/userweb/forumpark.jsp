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
	<link href="<%=path%>/static/css/forumpark/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--theme-style-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
	<link href="<%=path%>/static/css/forumpark/style.css" rel="stylesheet" type="text/css" media="all" />
	<!--//theme-style-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/assets/waifu.min.css?v=1.4.2"/>
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
<div class="leftNav-item">
	<ul>
		<li>
			<i class="fa fa-user-circle"></i>
			<a href="javascript:void(0)" class="rota">个人中心</a>
		</li>
		<li title="都不感兴趣?创建一个">
			<i class="fa fa-pencil-square-o"></i>
			<a href="${pageContext.request.contextPath}/user?action=toCategoryCreate" class="rota">建吧</a>
		</li>
	</ul>
</div>
<!--header-->
<jsp:include page="../common/user/head.jsp"/>
<div class="bottom-header">
	<div class="container">
		<div class="header-bottom-left">
			<div class="logo">
				<a href="${pageContext.request.contextPath }/user?action=index">
					<img style="height: 200px; padding-left: 20px" src="${pageContext.request.contextPath }/static/images/head/1-10.png" alt=" " />
				</a>
			</div>
		</div>
		<div class="header-bottom-right" style="position: absolute;left: 27%;margin-top: 130px">
			<ul class="nav navbar-nav navbar-right" id="one_category" style="font-size: 22px;font-weight: bolder;">
				<li><a href="${pageContext.request.contextPath }/user?action=index">首页</a></li>

			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>

<div class="container" style="margin-left: 10%">
	<div class="banner-menu">

		<div class="shoes-grid">


			<script src="<%=path%>/static/js/forumpark/jquery.wmuSlider.js"></script>
			<script>
				$('.example1').wmuSlider();
			</script>
			<!---->

			<%--贴吧展示--%>
			<div class="shoes-grid-left" style="width:1000px;">



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
								"\t\t\t\t\t\t<span style=\"margin-bottom: 20px;display: inline-block;\"><a href=\"<%=path%>/user?action=postpage&secondId="+date[i].classId+"&postname="+date[i].className+"\">"+date[i].className+"</a></span>\n" +
								"\t\t\t\t\t\t<p>";
						if(!(date[i].classDescribe === undefined)) {
							if (date[i].classDescribe.length > 30) {
								bardiv += date[i].classDescribe.substring(0,30);
								bardiv += "...";
							} else {
								bardiv += date[i].classDescribe;
							}
						}

						bardiv+= "</p>\n" +
								"\t\t\t\t\t</div>\n" +
								"\t\t\t\t\t<a href=\"<%=path%>/user?action=postpage&secondId="+date[i].classId+"&postname="+date[i].className+"\"><img class=\"img-responsive shoe-left categoryImg\" src=\"<%=path%>/"+date[i].imageUrl+"\" alt=\" \"></a>\n" +
								"\t\t\t\t\t<div class=\"clearfix\"> </div>\n" +
								"\t\t\t\t</div>\n" ;
						if(++i<date.length){
							bardiv+="\t\t\t\t<div class=\"con-sed-grid sed-left-top\">\n" +
									"\t\t\t\t\t<div style=\"float:right\" class=\"elit-grid\">\n" +
									// "\t\t\t\t\t\t<h4>consectetur  elit</h4>\n" +
									"\t\t\t\t\t\t<span style=\"margin-bottom: 20px;display: inline-block;\"><a href=\"<%=path%>/user?action=postpage&secondId="+date[i].classId+"&postname="+date[i].className+"\">"+date[i].className+"</a></span>\n" +
									"\t\t\t\t\t\t<p>";
							if(!(date[i].classDescribe === undefined)) {
								if (date[i].classDescribe.length > 30) {
									bardiv += date[i].classDescribe.substring(0,30);
									bardiv += "...";
								} else {
									bardiv += date[i].classDescribe;
								}
							}
							bardiv+="</p>\n" +
									"\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t<a href=\"<%=path%>/user?action=postpage&secondId="+date[i].classId+"&postname="+date[i].className+"\"><img class=\"img-responsive shoe-left categoryImg\" src=\"<%=path%>/"+date[i].imageUrl+"\" alt=\" \"></a>\n" +
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
<!-- waifu-tips.js 依赖 JQuery 库 -->
<script src="${pageContext.request.contextPath}/static/js/assets/jquery.min.js?v=3.3.1"></script>
<!-- 实现拖动效果，需引入 JQuery UI -->
<script src="${pageContext.request.contextPath}/static/js/assets/jquery-ui.min.js?v=1.12.1"></script>
<div class="waifu">
	<div class="waifu-tips"></div>
	<canvas id="live2d" class="live2d"></canvas>
	<div class="waifu-tool">
		<span class="fui-home"></span>
		<span class="fui-chat"></span>
		<span class="fui-eye"></span>
		<span class="fui-user"></span>
		<span class="fui-photo"></span>
		<span class="fui-info-circle"></span>
		<span class="fui-cross"></span>
	</div>
</div>
<script src="${pageContext.request.contextPath}/static/js/assets/waifu-tips.min.js?v=1.4.2"></script>
<script src="${pageContext.request.contextPath}/static/js/assets/live2d.min.js?v=1.0.5"></script>
<script type="text/javascript">
	/* 可直接修改部分参数 */
	live2d_settings['modelId'] = 1;                  // 默认模型 ID
	live2d_settings['modelTexturesId'] = 87;         // 默认材质 ID
	live2d_settings['modelStorage'] = false;         // 不储存模型 ID
	live2d_settings['canCloseLive2d'] = false;       // 隐藏 关闭看板娘 按钮
	live2d_settings['canTurnToHomePage'] = false;    // 隐藏 返回首页 按钮
	live2d_settings['waifuSize'] = '300x337';        // 看板娘大小
	live2d_settings['waifuTipsSize'] = '200x80';    // 提示框大小
	live2d_settings['waifuFontSize'] = '18px';       // 提示框字体
	live2d_settings['waifuToolFont'] = '20px';       // 工具栏字体
	live2d_settings['waifuToolLine'] = '30px';       // 工具栏行高
	live2d_settings['waifuToolTop'] = '-60px';       // 工具栏顶部边距
	live2d_settings['waifuDraggable'] = 'axis-x';    // 拖拽样式
	live2d_settings['waifuEdgeSide'] = 'left:30';     // 看板娘贴边方向
	/* 在 initModel 前添加 */
	initModel("${pageContext.request.contextPath}/static/js/assets/waifu-tips.json?v=1.4.2")
</script>
</body>
</html>