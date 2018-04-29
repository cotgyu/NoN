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
<style>
.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "나눔고딕";
font-size:20px;
font-weight:bold;
}

.menubar ul{
background: rgb(109,109,109);
height:50px;
list-style:none;
margin:0;
padding:0;
}

.menubar li{
float:left;
padding:0px;
}

.menubar li a{
background: rgb(109,109,109);
color:#cccccc;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.menubar li a:hover, .menubar ul li:hover a{
background: rgb(71,71,71);
color:#FFFFFF;
text-decoration:none;
}

.menubar li ul{
background: rgb(109,109,109);
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.menubar li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
background: rgb(109,109,109);
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.menubar li:hover li a{
background:none;
}

.menubar li ul a{
display:block;
height:50px;
font-size:14px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color:#ffffff;
text-decoration:none;
}

.menubar p{
clear:left;
}


.star{
width:80px;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat -80px 0;
}

.star span{
display:block;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat left top;
text-indent:-9999em;
}

</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp" />

		<br>
		<br>
		<jsp:include page="/WEB-INF/jsp/fixedIndex/menuButton.jsp" />
			
		
		
		<div class="container">
		<!-- 카테고리 표시  -->
		
			<div class="menubar">
			<h3>강좌 카테고리</h3>
			   <ul>
			      
			      <li><a href="/course/searchlist?searchOption=coscategory1&keyword=프로그래밍" id="current">프로그래밍</a>
			         <ul>
			           <c:forEach var="procategory" items="${programmingcategory}">
			     		 <li><a href="/course/searchlist?searchOption=coscategory2&keyword=${procategory.coscategory2}">${procategory.coscategory2}</a></li>
			      	   </c:forEach>
			         </ul>
			      </li>    
			      <li><a href="/course/searchlist?searchOption=coscategory1&keyword=디자인/CG" id="current">디자인/CG</a>
			         <ul>
			           <c:forEach var="decategory" items="${designcategory}">
			     		 <li><a href="/course/searchlist?searchOption=coscategory2&keyword=${decategory.coscategory2}">${decategory.coscategory2}</a></li>
			      		</c:forEach>
			         </ul>
			      </li>
			      <li><a href="/course/searchlist?searchOption=coscategory1&keyword=IT비즈니스" id="current">IT비즈니스</a>
			         <ul>
			           <c:forEach var="bucategory" items="${businesscategory}">
			     		 <li><a href="/course/searchlist?searchOption=coscategory2&keyword=${bucategory.coscategory2}">${bucategory.coscategory2}</a></li>
			      		</c:forEach>
			         </ul>
			      </li>
			      
			   </ul>
			</div>
			<br><br><br>
		
			<!-- 코스 or 카테고리 검색 -->						
			<div class="searchMenu">
				<form name="searchform" method="post" action="/course/searchlist">			     	
				    <input name="keyword" value="${keyword}" placeholder="원하는 강좌를 입력해주세요!" style="width: 250px;">
				    <button type="submit" class="btn">검색</button>
				</form>
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
				                  <!-- 수강평 점수 -->                
				                  <c:choose>
				                  	  <c:when test="${newcoslist.coseval == 0}">
										  <div class='star'>
						                  	<span style="width:0%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 1}">
										  <div class='star'>
						                  	<span style="width:20%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 2}">
										  <div class='star'>
						                  	<span style="width:40%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 3}">
										  <div class='star'>
						                  	<span style="width:60%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 4}">
										  <div class='star'>
						                  	<span style="width:80%"></span>
						                  </div>
									  </c:when>
									  <c:when test="${newcoslist.coseval == 5}">
										  <div class='star'>
						                  	<span style="width:100%"></span>
						                  </div>
									  </c:when>               
				                  </c:choose>
				                </div>
				              </div>
				            </div>
					</c:forEach>
				</div>
				<!-- Pagination 수정해야함!!-->
		          <ul class="pagination justify-content-center">
		            <li class="page-item">
		              <a class="page-link" href="#" aria-label="Previous">
		                <span aria-hidden="true">&laquo;</span>
		                <span class="sr-only">Previous</span>
		              </a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">1</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">2</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">3</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#" aria-label="Next">
		                <span aria-hidden="true">&raquo;</span>
		                <span class="sr-only">Next</span>
		              </a>
		            </li>
		          </ul>
			</div>
			<br><br><br>
			
			<div>
				<h3>인기 강좌</h3>
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
				                  <!-- 수강평 점수 -->                
				                  <c:choose>
				                  	  <c:when test="${popcoslist.coseval == 0}">
										  <div class='star'>
						                  	<span style="width:0%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 1}">
										  <div class='star'>
						                  	<span style="width:20%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 2}">
										  <div class='star'>
						                  	<span style="width:40%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 3}">
										  <div class='star'>
						                  	<span style="width:60%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 4}">
										  <div class='star'>
						                  	<span style="width:80%"></span>
						                  </div>
									  </c:when>
									  <c:when test="${popcoslist.coseval == 5}">
										  <div class='star'>
						                  	<span style="width:100%"></span>
						                  </div>
									  </c:when>               
				                  </c:choose>
				                </div>
				              </div>
				            </div>	            
					</c:forEach>
								
				</div>
				<!-- Pagination -->
		          <ul class="pagination justify-content-center">
		            <li class="page-item">
		              <a class="page-link" href="#" aria-label="Previous">
		                <span aria-hidden="true">&laquo;</span>
		                <span class="sr-only">Previous</span>
		              </a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">1</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">2</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#">3</a>
		            </li>
		            <li class="page-item">
		              <a class="page-link" href="#" aria-label="Next">
		                <span aria-hidden="true">&raquo;</span>
		                <span class="sr-only">Next</span>
		              </a>
		            </li>
		          </ul>
			</div>
		</div>
		<br>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>