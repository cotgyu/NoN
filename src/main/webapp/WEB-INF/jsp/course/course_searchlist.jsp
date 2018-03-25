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
				<!-- 코스 리스트 -->
				<c:forEach var="coslist" items="${courselist}">
					<a href="/course/intro/${coslist.cosno}">${coslist.cosname}</a>
					<br>
				</c:forEach>
			</div>					
			<br><br><br>
					
			<div>
				<h3>"${keyword}" 검색 결과</h3>
				<!-- 새로운 코스 리스트 -->
				<div class="row">
					<c:forEach var="coslist" items="${courselist}">
						<div class="col-lg-4 col-sm-6 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${coslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${coslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${coslist.cosno}">${coslist.cosname}</a>
				                  </h4>
				                </div>
				              </div>
				            </div>
					</c:forEach>
				</div>
			</div>
			<br><br><br>
			
		</div>
		<br>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>