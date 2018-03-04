<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${sessionScope.member.id eq 'admin'}" >
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index">
						<h1>Logo</h1>
					</a>
					<button class="navbar-toggler" type="button" 
						data-toggle="collapse" data-target="#navbarSupportedContent" 
						aria-controls="navbarSupportedContent" aria-expanded="false" 
						aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
								<a class="nav-link" href="index.html">관리자페이지</a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" 
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Share House <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#"> Share Room 관리 </a>
									<a class="dropdown-item" href="#"> HouseMate 관리 </a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> 회원관리 </a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									임 대 관리 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">전세 관리</a>
									<a class="dropdown-item" href="#">월세 관리</a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> 자유게시판 관리 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> FaQ 관리 </a>
							</li>
						</ul>
						<ul class="navbar-nav ml-auto mt-10">
						<c:if test="${not isLogin }">
							<li class="nav-item">
								<a class="nav-link login-button" href="login">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link add-button" href="register"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;회원 가입 </a>
							</li>
						</c:if>
						<c:if test="${isLogin }">
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" 
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									${ sessionScope.member.id } 님<span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="m_update"> 회원정보 수정</a>
									<a class="dropdown-item" href="logout"> 로그아웃 </a>
								</div>
							</li>

						</c:if>
						
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
</c:when>
<c:otherwise>
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index">
						<h1>Logo</h1>
					</a>
					<button class="navbar-toggler" type="button" 
						data-toggle="collapse" data-target="#navbarSupportedContent" 
						aria-controls="navbarSupportedContent" aria-expanded="false" 
						aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
								<a class="nav-link" href="index.html">Home</a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" 
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Share House <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#"> Share Room 찾기 </a>
									<a class="dropdown-item" href="#"> HouseMate 찾기 </a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> 매매 </a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									임 대 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">전세</a>
									<a class="dropdown-item" href="#">월세</a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> 자유게시판 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="dashboard.html"> FaQ </a>
							</li>
						</ul>
						<ul class="navbar-nav ml-auto mt-10">
						<c:if test="${not isLogin }">
							<li class="nav-item">
								<a class="nav-link login-button" href="login">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link add-button" href="register"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;회원 가입 </a>
							</li>
						</c:if>
						<c:if test="${isLogin }">
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" 
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									${ sessionScope.nick } 님<span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="m_update"> 회원정보 수정</a>
									<a class="dropdown-item" id="logout" href="logout"> 로그아웃 </a>
								</div>
							</li>

						</c:if>
						
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
</c:otherwise>
</c:choose>