<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content=""/>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.login.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body>

	<!-- bg effect -->
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<!-- //bg effect -->
	<!-- title -->
	<h1></h1>
	<br>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3" >
		<form id='form' action="${pageContext.request.contextPath }/account/login" method="post" target="target">
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
	<!-- //content -->

	<!-- copyright -->
	<div class="footer">
		<p>Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" href="#">贴吧</a></p>
	</div>
	<!-- //copyright -->

	<!-- Jquery -->
	<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-form.js"></script>
	<!-- //Jquery -->
	<script type="text/javascript">
		$(function(){
			$("#form").ajaxForm(function(data){  
				if(data==true||data=='true'){
					alert("登录成功");
					window.location.href="${pageContext.request.contextPath}/index.jsp";
				}else{
					alert("登录失败");
					$(".Name").val('');
					$(".Password").val('');
					
				}
			}); 
			
		});
	</script>
	<!-- effect js -->
	<script src="${pageContext.request.contextPath }/js/canva_moving_effect.js"></script>
	<!-- //effect js -->

</body>

</html>