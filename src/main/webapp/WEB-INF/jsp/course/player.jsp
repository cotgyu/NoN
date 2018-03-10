<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>player</title>
<script>

</script>
</head>
<body>

임시 메뉴 링크<br>
<a href="/course/list">강의 목록</a><br>
<a href="/course/addcourse">코스 추가</a><br>
<a href="/course/addlecture">강의 추가</a><br>
<br>

강의제목:${lecture.lecname}
<br>
<iframe src="https://www.youtube.com/embed/${lecture.lecvideo}" height="500" width="800" allowfullscreen="allowfullscreen" name="fitvid0"></iframe>

<br>강의목록<br>

<c:forEach var="lec" items="${lecturelist}">
<a href="/course/player/${lec.cosno}/${lec.lecno}">${lec.lecname}</a> &ensp;&ensp;  ${lec.lectime}<br>

</c:forEach>
</body>
</html>