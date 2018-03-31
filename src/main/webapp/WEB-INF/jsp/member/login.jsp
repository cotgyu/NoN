<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>edu pjt_3-Col </title>
 <!-- Bootstrap -->
  <link href="resources/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

  <!-- Fancy Box -->
  <link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
  <link href="resources/plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
  
  <!-- CUSTOM CSS -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/member/login.css"> 
  
   <!-- member js -->
  <script src="resources/plugins/jquery/dist/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <script src="resources/js/LoginProcess.js"></script>
  
  <!-- 다음 이메일 -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
  
  <!-- 카카오 로그인 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


</head>

  
<body>
	<article id="login_arti">
	<div class="login-form-1">
		<form id="login-form" class="text-left" name="loginC" method="post">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="loginFormUserId" class="sr-only">User Id</label> <input
							type="text" class="form-control" id="loginFormUserId" name="id"
							placeholder="username">
					</div>
					<div class="form-group">
						<label for="loginFormUserPass" class="sr-only">Password</label> <input
							type="password" class="form-control" id="loginFormUserPass"
							name="pass" placeholder="password">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="lg_remember" name="lg_remember">
						<label for="lg_remember">remember</label>
					</div>
				</div>
				<button type="submit" class="login-button">
					<i class="fa fa-chevron-right"></i>
				</button>
			</div>
			<div class="etc-login-form">
				<p>
					forgot your password? <a href="forgotPasswordForm">click here</a>
				</p>
				<p>
					new user? <a href="register">create new account</a>
				</p>
			</div>
		</form>
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=686bc69fc75e50e4983e53dbd6ab30a4&redirect_uri=http://localhost:8080/project02/kakaologin&response_type=code">
			<img id="kakaoicon" src="resources/img/kakao.png">
		</a>
		<!-- https://nid.naver.com/oauth2.0/authorize?client_id={클라이언트 아이디}&response_type=code&redirect_uri={개발자 센터에 등록한 콜백 URL(URL 인코딩)}&state={상태 토큰} -->
		<a
			href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=BrtJhpWcwgKwdYd5F5xJ&redirect_uri=http://localhost:8080/project02/naverlogin&state=${state }">
			<img id="navericon" src="resources/img/naver.PNG">
		</a>

		<!-- <a href="https://www.facebook.com/v2.12/dialog/oauth?client_id=119792748848840&redirect_uri=http://localhost:8080/project02/facelogin&response_type=code">
		<img id="faceIcon" src="resources/images/face.jpg"></a>
 -->


	</div>
	</article>
</body>
</html>