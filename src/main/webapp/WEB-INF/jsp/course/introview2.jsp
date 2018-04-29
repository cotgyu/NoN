<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${course.cosname}코스</title>
<script>

</script>
</head>
<body ng-app='course'>

임시 메뉴 링크<br>
<a href="/course/list">코스 목록</a><br>
<a href="/course/addcourse">코스 추가</a><br>
<a href="/course/addlecture">강의 추가</a><br>
<br>

<h3>${course.cosname}</h3>
<!-- 
<button type="submit" id="subscribe" onclick="javascript_:openPlayer()" class="btn btn-default" >수강하기</button>
-->
<br>
<br>
<a href="#intro">강좌 소개</a><br>
<a href="#courselist">강의리스트</a><br>
<a href="#eval">수강후기</a><br>
    
<br>
<section id="intro">
<h4>강좌 소개</h4>
<br>
<div id="content">


<iframe src="https://www.youtube.com/embed/${course.cosintrovideo}" height="500" width="800" allowfullscreen="allowfullscreen" name="fitvid0"></iframe>
</div>
<br>
${course.cosintro}
</section>
<br><br>
<br><br>
<br><br>

<section id="courselist">
<h4>강좌 리스트</h4><br>
<c:forEach var="lec" items="${lecture}">
<a href="/course/player/${lec.cosno}/${lec.lecno}">${lec.lecname}</a> &ensp;&ensp;  ${lec.lectime}<br>
</c:forEach>
</section>
<br><br>
<br><br>
<br><br>



<section id="eval">
<!-- <h4>수강후기(예정)</h4> -->
</section>
		<!-- <h1><span class="evaPrint"></span></h1> -->
			<h1><span class="evaPrint"></span></h1>

	<!-- 댓글부분 -->
	<label for="content">수강후기를 남겨주세요</label>
		<div class="container" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
			<!-- <label for="content">수강후기를 남겨주세요</label> -->
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="cosno" value="${course.cosno}" /> <!-- ㅅㅂ intro.cosno에서 course.cosno로 바꿨더니 실행됨 -->
					
					<label class="radio-inline">
						<input type="radio" name="eva_count" id="inlineRadio1" value="1"> 1
					</label>
					<label class="radio-inline">
					  	<input type="radio" name="eva_count" id="inlineRadio2" value="2"> 2
					</label>
					<label class="radio-inline">
					  <input type="radio" name="eva_count" id="inlineRadio3" value="3"> 3
					</label>
					<label class="radio-inline">
					  <input type="radio" name="eva_count" id="inlineRadio4" value="4"> 4
					</label>
					<label class="radio-inline">
					  <input type="radio" name="eva_count" id="inlineRadio5" value="5"> 5
					</label>
					
					 
					<div class="input-group input-group-md">
						<input type="text" class="form-control" name="content" placeholder="평점과 내용을 입력하세요."> 
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
						</span>
					</div>
				</div>
			</form>
		</div>

		<div class="container">
			<div class="commentList"></div>
		</div>
	<%@ include file="commentS.jsp" %>
	
</body>
</html>
