<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Register</title>
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
	<!-- //web-fonts -->
</head>

<body>

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
	<div class="sub-main-w3">
		<form id='form' action="${pageContext.request.contextPath }/account/register" method="post" target="target">
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					用户名
				</label>
				<input placeholder="用户名" name="accountName" type="text" class="accountName" required="">
				<p class="hintNo">用户名已被使用</p>
				<p class="hintYes">用户名可用</p>
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					密码
				</label>
				<input placeholder="密码" name="Password" type="password" class="oldPassword"required="">
				<p class="hintNo">密码由6-20位字母、数字、下划线组成</p>
				<p class="hintYes">密码可用</p>
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					确认密码
				</label>
				<input  placeholder="确认密码" name="accountPassWord" type="password"class="newPassword" >
				<p class="hintNo">密码不一致</p>
				<p class="hintYes">密码一致</p>
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fa fa-phone-square"></i>
					手机号：
				</label>
				<input placeholder="手机号" name="AccountPhone" type="text" class="accountPhone"  >
				<p class="hintNo">手机号已重复</p>
				<p class="hintYes">手机号可用</p>
			</div>
			<!-- checkbox -->
			<div class="wthree-text">
				<ul>
					<li>
						<label class="anim">
							<input type="checkbox" class="checkbox" style=" cursor: 'not-allowed';" required="">
							<span>我已阅读并同意服务条款</span>
						</label>
					</li>
				</ul>
			</div>
			<!-- //checkbox -->
			<input type="submit" class="register" value="注册">
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
			checkRegister();
			$("#form").ajaxForm(function(data){  
				if(data==true||data=='true'){
					alert("注册成功");
					window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
				}else{
					alert("注册失败");
				}
			});    
			$(".accountName").change(function(){
				$.post("${pageContext.request.contextPath}/account/checkName",{Name:$(this).val().trim()},function(date){
					if(date==true||date=='true'){
						$(".accountName").next().removeClass("No");
						$(".accountName").next().next().addClass("Yes");
						$(".accountName").parent().addClass("check");
					}else{
						$(".accountName").next().addClass("No");
						$(".accountName").next().next().removeClass("Yes");
						$(".accountName").parent().addClass("check");
						$(".accountName").val('');
					}
					checkRegister();
					
				});
				
			});
			
			$(".accountPhone").change(function(){
				var phone=$(".accountPhone").val().trim();
				 if(!(/^1[3456789]\d{9}$/.test(phone))){ 
						 $(".accountPhone").next().html("手机号格式有误，请重新输入！！");  
						 $(".accountPhone").next().addClass("No");
						 $(".accountPhone").next().next().removeClass("Yes");
						 $(".accountPhone").parent().addClass("check");
						 $(".accountPhone").val('');
				        return false; 
				   } 
				$.post("${pageContext.request.contextPath}/account/checkPhone",{Phone:$(this).val().trim()},function(date){
					if(date==true||date=='true'){
						$(".accountPhone").next().removeClass("No");
						$(".accountPhone").next().next().addClass("Yes");
						$(".accountPhone").parent().addClass("check");
					}else{
						$(".accountPhone").next().html("手机号已被注册"); 
						$(".accountPhone").next().addClass("No");
						$(".accountPhone").next().next().removeClass("Yes");
						$(".accountPhone").parent().addClass("check");
						$(".accountPhone").val('');
					}
					checkRegister();
					
				});
				
			});
			
			$(".newPassword").change(function(){
				var old=$(".oldPassword").val();
				var password=$(".newPassword").val();
				if(old==password){
					$(".newPassword").next().removeClass("No");
					$(".newPassword").next().next().addClass("Yes");
					$(".newPassword").parent().addClass("check");
				}else{
					$(".newPassword").next().addClass("No");
					$(".newPassword").next().next().removeClass("Yes");
					$(".newPassword").parent().addClass("check");
					$(".newPassword").val('');
				}
				checkRegister();
			
			});
			
			$(".oldPassword").change(function(){
				var old=$(".oldPassword").val();
				if(/^(\w){6,20}$/.test(old)){
					$(".oldPassword").next().removeClass("No");
					$(".oldPassword").next().next().addClass("Yes");
					$(".oldPassword").parent().addClass("check");
				}else{
					$(".oldPassword").next().addClass("No");
					$(".oldPassword").next().next().removeClass("Yes");
					$(".oldPassword").parent().addClass("check");
					$(".oldPassword").val('');
				}
				
			});
			function checkRegister(){
				var num=$(".Yes").length;
				if(num==3){
					$(".register").css({
						cursor:"pointer"
					});
				}else{
					$(".register").css({
						 cursor: "not-allowed"
					});
				}
			}
			
			
				
});
	</script>
	<!-- effect js -->
	<script src="${pageContext.request.contextPath }/js/canva_moving_effect.js"></script>
	<!-- //effect js -->

</body>

</html>