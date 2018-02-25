<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <article>
<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span>Team Search 비밀번호 찾기</span>
				</h3>
				<hr>
				<form class="form-horizontal" method="post" name="forgotPass" id="forgotPass" action="ForgotPasswordResult">
				
					<!-- id 입력부분 -->	
						<div class="col-md-7 col-sm-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card"></i></span> 
								<input type="text"
									class="form-control" name="id" id="forgot_joinId"
									placeholder="Input Your Id" value="${sessionScope.member.id }">
							</div>
							<div>	
								<p class="font-italic" id = "idFlag" style=" color:red;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 아이디를 입력해주세요.</p>
							</div>
						</div>
						
						<!-- 이름 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Name <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="name"
									id="forgot_name" placeholder="Please enter at least 2 characters" value="${sessionScope.member.name }">
							</div>

							<div class="input-group">	
								<p class="font-italic" id = "nameFlag" style=" color:red;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 이름을 입력해주세요.</p>
							</div>
						</div>
					</div>
						
					<!-- 이메일 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Email<span
							class="text-danger">*</span></label>
						<div class="col-md-11 ">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span> 
								<input type="text" style="width:80px;"
									class="form-control" name="email1" id="forgot_email1" size="5"
									placeholder="Email ID" value="${session.member.email.split('@')[0]}"/>
									&nbsp; <b style="margin-top:5px;">@</b> &nbsp;
								<input type="text" style="width:80px;"
									class="form-control" name="email2" id="email2" size="5"
									placeholder="ABCDE.com etc.." value="${session.member.email.split('@')[1]}"/>
									&nbsp; &nbsp;	
								<select name="email3" id="email3" class="form-control" style="width:80px;">
									<option value="0" selected>Direct Input</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hotmail.com">hotmail.com</option>
								</select>
								&nbsp;&nbsp;&nbsp;
								
								<input type="button" id="btnforgotpass" class="btn btn-outline-info" value="이메일 인증"/>	
							</div>
							<div>	
								<p class="font-italic" id = "emailFlag" style=" color:red;margin-top:10px;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 이메일을 입력해주세요.</p>
							</div>
						</div>
					</div>
						
					
					<!-- 패스워드 입력부분 -->	
					<div class="form-group" id = "forgot_pass1" style="display:none;">
						<label class="control-label col-sm-3">Set Password <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-key"></i></span> <input type="password"
									class="form-control" name="pass" id="pass"
									placeholder="한글,특수문자(!,@),소문자,대문자조합  (8~20자) " value="">
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="form-group" id = "forgot_pass2" style="display:none;">
						<label class="control-label col-sm-3">Confirm Password <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-key"></i></span> <input type="password"
									class="form-control" name="cpass" id="cpass"
									placeholder="비밀번호 확인" value="">
							</div>
							<div>	
								<p class="font-italic" id = "cpassFlag" style=" color:red;margin-top:10px;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 비밀번호를 입력해주세요.</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
							<input name="Submit" type="submit" style="display:none;" value="비밀번호 변경" id="btnPassForgot" style="margin-top:10px;"
								class="btn btn-outline-success btn-lg btn-block">
						</div>
					</div>
			
			</form>
		</div>
	</div>
	</div>


</article>
