<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h4>수강후기(예정)</h4>
</section>
<br><br>
<br><br>
<br><br>

</body>
</html>