<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<article>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span>Pet 24 회원 가입</span>
				</h3>
				<hr>
				<form class="form-horizontal" method="post" name="joinC" id="signup">
					<div class="form-group">
						<label class="control-label col-sm-3">Login ID <span
							class="text-danger">*</span></label>
						<!-- id 입력부분 -->	
						<div class="col-md-7 col-sm-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card"></i></span> 
								<input type="text"
									class="form-control" name="id" id="joinId"
									placeholder="한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." value="${sessionScope.member.id }">
							</div>
							
							<div>	
								<p class="font-italic" id = "idFlag" style=" color:red;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.</p>
							</div>
						</div>
					</div>
					<!-- 이름 입력부분 -->
					<div class="form-group" id="join1" style="">
						<label class="control-label col-sm-3">Name <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="name"
									id="name" placeholder="2자이상 이름을 입력해주세요." value="${sessionScope.member.name }">
							</div>

							<div class="input-group">	
								<p class="font-italic" id = "nameFlag" style=" color:red;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 2자이상 이름을 입력해주세요.</p>
							</div>
						</div>
					</div>
				
					<!-- 닉네임 입력부분  -->
					<div class="form-group" id="join2" style="">
						<label class="control-label col-sm-3">Nick <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="nick"
								id="nick" placeholder="한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." 
								value="${sessionScope.member.nick }">
							</div>
							<div>
								<p class="font-italic" id = "nickFlag" style=" color:red;">
								<i class="fa fa-times" ></i>&nbsp;&nbsp; 한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.</p>	
							</div>
						</div>
					</div>
					
					<!-- 이메일 입력부분 -->
					<div class="form-group" id="join3" style="">
						<label class="control-label col-sm-3">Email<span
							class="text-danger">*</span></label>
						<div class="col-md-11 ">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span> 
								<input type="text" style="width:80px;"
									class="form-control" name="email1" id="email1" size="5"
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
								
								<input type="button" id="btnEmailCode" class="btn btn-outline-info" value="이메일 인증"/>	
							</div>
							<div>	
								<p class="font-italic" id = "emailFlag" style=" color:red;margin-top:10px;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 이메일 인증을 진행해 주세요.</p>
							</div>
						</div>
					</div>
						
					<!-- 패스워드 입력부분 -->	
					<div class="form-group" id="join4" style="">
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
					<div class="form-group" id="join5" style="">
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
					
					<!-- 생년 월일 -->
					<div class="form-group" id="join6" style="">
						<label class="control-label col-sm-3">Birth <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
								<select name="birth1" id="birth1" class="form-control" style="width:150px;display:inline;">
										<option value="0">Year</option>
										<option value="1955">1955</option>
										<option value="1956">1956</option>
										<option value="1957">1957</option>
										<option value="1958">1958</option>
										<option value="1959">1959</option>
										<option value="1960">1960</option>
										<option value="1961">1961</option>
										<option value="1962">1962</option>
										<option value="1963">1963</option>
										<option value="1964">1964</option>
										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="birth2" id="birth2" class="form-control" style=width:150px;display:inline;>
										<option value="0">Month</option>
										<option value="1">Jan</option>
										<option value="2">Feb</option>
										<option value="3">Mar</option>
										<option value="4">Apr</option>
										<option value="5">May</option>
										<option value="6">Jun</option>
										<option value="7">Jul</option>
										<option value="8">Aug</option>
										<option value="9">Sep</option>
										<option value="10">Oct</option>
										<option value="11">Nov</option>
										<option value="12">Dec</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="birth3" id="birth3" class="form-control" style="width:150px;display:inline;">
										<option value="0">Date</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
					</div>
					
					<!-- 주소입력 부분 (우편번호) -->
					<div class="form-group" id="join7" style="">
						<label class="control-label col-sm-3">ZipCode <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" readonly name="zipCode"
								id="zipCode" placeholder="우편번호 검색버튼을 눌러주세요." 
								 value="${sessionScope.member.zipCode }"/>
								&nbsp;&nbsp;
								<input type="button" id="btnZipcode" class="btn btn-outline-info" value="우편번호 검색"/>
							</div>
						</div>
					</div>
					
					<!-- 주소입력 부분 (주소1) -->
					<div class="form-group" id="join8" style="">
						<label class="control-label col-sm-3">Address1 <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" readonly name="address1"
								id="address1" placeholder="우편번호 검색 버튼을 눌러주세요." 
								 value="${sessionScope.member.address1 }"/>
							</div>
						</div>
					</div>
					
					<!-- 주소입력 부분(주소2) -->
					<div class="form-group" id="join9" style="">
						<label class="control-label col-sm-3">Address2 <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-address-card" ></i></span>
								<input type="text" class="form-control" name="address2"
								id="address2" placeholder="상세 주소" 
								 value="${sessionScope.member.address2 }"/>
							</div>
							<div>	
								<p class="font-italic" id = "addressFlag" style=" color:red;margin-top:10px;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 우편번호 검색후 상세주소를 입력해주세요.</p>
							</div>
						</div>
					</div>
				
				<!-- 성별 입력 부분 -->
					<div class="form-group" id="join10" style="">
						<label class="control-label col-sm-3">Gender <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<label> 
							<input name="gender" type="radio" value="Male" ${member.gender?"checked":"" }> 남자
							</label>     
							<label> 
							<input name="gender" type="radio" value="Female" ${member.emailGet?"checked":"" }> 여자
							</label>
						</div>
					</div>
					
					<!-- 정보 이메일 수신여부 -->
					<div class="form-group" id="join11" style="">
						<label class="control-label col-sm-3">Info Email Get </label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="emailGet" type="radio" value="true"> Yes</label>     
							<label> <input name="emailGet" type="radio" value="false"> No</label>
						</div>
					</div>
					
					<!-- 폰번호 입력부분 -->
					<div class="form-group" id="join12" style="">
						<label class="control-label col-sm-3">Mobile <span
							class="text-danger">*</span></label>
						<div class="col-xs-10">
							<div class="form-inline" >
								<div class="form-group">
									<select name="mobile1" id="mobile1" class="form-control" style="width:80px;">
										<option value=""></option>
										<option ${member.mobile.split('-')[0] == 010 ? "selected" : "" }>010</option>
										<option ${member.mobile.split('-')[0] == 011 ? "selected" : "" }>011</option>
										<option ${member.mobile.split('-')[0] == 016 ? "selected" : "" }>016</option>
										<option ${member.mobile.split('-')[0] == 017 ? "selected" : "" }>017</option>
										<option ${member.mobile.split('-')[0] == 018 ? "selected" : "" }>018</option>
										<option ${member.mobile.split('-')[0] == 019 ? "selected" : "" }>019</option>
									</select>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="mobile2" id="mobile2" 
										value="${sessionScope.member.mobile.split('-')[1] }" size= "4" maxlength="4">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="mobile3" id="mobile3" 
										value="${sessionScope.member.mobile.split('-')[2] }" size= "4" maxlength="4">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 집전화번호 입력부분  -->
					<div class="form-group" id="join13" style="">
						<label class="control-label col-sm-3">Tel Phone </label>
						<div class="col-xs-10">
							<div class="form-inline" >
								<div class="form-group">
									<select name="phone1" class="form-control" style="width:80px;">
										<option value=""></option>
										<option ${ member.phone.split('-')[0] == 02 ? "selected" : "" }>
											02</option>
										<option ${ member.phone.split('-')[0] == 031 ? "selected" : "" }>
											031</option>
										<option ${ member.phone.split('-')[0] == 032 ? "selected" : "" }>
											032</option>
										<option ${ member.phone.split('-')[0] == 033 ? "selected" : "" }>
											033</option>
										<option ${ member.phone.split('-')[0] == 041 ? "selected" : "" }>
											041</option>
										<option ${ member.phone.split('-')[0] == 042 ? "selected" : "" }>
											042</option>
										<option ${ member.phone.split('-')[0] == 043 ? "selected" : "" }>
											043</option>
										<option ${ member.phone.split('-')[0] == 044 ? "selected" : "" }>
											044</option>
										<option ${ member.phone.split('-')[0] == 051 ? "selected" : "" }>
											051</option>
										<option ${ member.phone.split('-')[0] == 052 ? "selected" : "" }>
											052</option>
										<option ${ member.phone.split('-')[0] == 053 ? "selected" : "" }>
											053</option>
										<option ${ member.phone.split('-')[0] == 054 ? "selected" : "" }>
											054</option>
										<option ${ member.phone.split('-')[0] == 055 ? "selected" : "" }>
											055</option>
										<option ${ member.phone.split('-')[0] == 061 ? "selected" : "" }>
											061</option>
										<option ${ member.phone.split('-')[0] == 062 ? "selected" : "" }>
											062</option>
										<option ${ member.phone.split('-')[0] == 063 ? "selected" : "" }>
											063</option>
										<option ${ member.phone.split('-')[0] == 064 ? "selected" : "" }>
											064</option>
									</select>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="phone2" id="phone2" 
										value="${sessionScope.member.phone.split('-')[1] }" size= "4" maxlength="4">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										&nbsp;-&nbsp;
										<input type="text" class="form-control" name="phone3" id="phone3" 
										value="${sessionScope.member.phone.split('-')[2] }" size= "4" maxlength="4">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="join14" style="">
						<div class="col-xs-offset-3 col-xs-10">
							<input name="Submit" type="submit" value="회원가입" id="btnJoinSubmit" style="margin-top:10px;"
								class="btn btn-outline-success btn-lg btn-block">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	

</article>