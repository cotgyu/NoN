<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>분야별 강좌</title>
<script>

</script>

</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/course/Mynav.jsp" />
		<jsp:include page="/WEB-INF/jsp/course/MytoggleSidebar.jsp" />

		<br>
		<br>
		<jsp:include page="/WEB-INF/jsp/course/MymenuButton.jsp" />
		<div class="container">
			<!-- 코스 검색 -->						
			<div class="searchMenu">
				<form name="searchform" method="post" action="/course/searchlist">			     	
				    <input name="keyword" value="${keyword}" placeholder="원하는 강좌를 입력해주세요!" style="width: 250px;">
				    <button type="submit" class="btn">검색</button>
				</form>
			</div>					
			<br><br><br>
			
			<div>
				<h3>강좌 카테고리</h3>
				<!-- 카테고리 표시 
				todo- 카테고리 선택시 카테고리에 선택되는 코스들만 표시하기 -->
				<c:forEach var="coscategory" items="${coursecategory}">
					<button type="button" class="btn btn-info" onClick="location.href='/course/searchlist?keyword=${coscategory.coscategory}'">${coscategory.coscategory}</button>
				</c:forEach>
			</div>
			<br><br><br>
			
			<div>
				<h3>새로운 강좌</h3>
				<!-- 새로운 코스 리스트 -->
				<div class="row">
					<c:forEach var="newcoslist" items="${newcourselist}">
						<div class="col-lg-4 col-sm-6 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${newcoslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${newcoslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${newcoslist.cosno}">${newcoslist.cosname}</a>
				                  </h4>
				                </div>
				              </div>
				            </div>
					</c:forEach>
				</div>
			</div>
			<br><br><br>
			
			<div>
				<h3>추천 강좌</h3>
				<!-- 인기 코스 리스트 -->
				<div class="row">
					<c:forEach var="popcoslist" items="${popcourselist}">			
				            <div class="col-lg-4 col-sm-6 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${popcoslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${popcoslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${popcoslist.cosno}">${popcoslist.cosname}</a>
				                  </h4>
				                </div>
				              </div>
				            </div>	            
					</c:forEach>
				</div>
			</div>
		</div>
		<br>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>