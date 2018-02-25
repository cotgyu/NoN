<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!------ Include the above in your HEAD tag ---------->

<article id="login_arti">
	<div class="login-form-1">
		<form id="login-form" class="text-left" name="loginC" method="post">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="loginFormUserId" class="sr-only">User Id</label>
						<input type="text" class="form-control" id="loginFormUserId" name="id" placeholder="username">
					</div>
					<div class="form-group">
						<label for="loginFormUserPass" class="sr-only">Password</label>
						<input type="password" class="form-control" id="loginFormUserPass" name="pass" placeholder="password">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="lg_remember" name="lg_remember">
						<label for="lg_remember">remember</label>
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>forgot your password? <a href="forgotPasswordForm">click here</a></p>
				<p>new user? <a href="register">create new account</a></p>
			</div>
		</form>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=686bc69fc75e50e4983e53dbd6ab30a4&redirect_uri=http://localhost:8080/project02/kakaologin&response_type=code">
		<img src="resources/images/kakaolink_btn_small.png"></a>


 
 
<!-- Kakao Login -->

		</div>
</article>