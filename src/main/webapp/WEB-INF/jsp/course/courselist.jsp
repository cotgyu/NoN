<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>전체 코스 목록</title>
<script>

</script>
</head>
<body>

임시 메뉴 링크<br>
<a href="/course/list">코스 목록</a><br>
<a href="/course/addcourse">코스 추가</a><br>
<a href="/course/addlecture">강의 추가</a><br>
<br>
<h3>코스 목록 나열(링크 클릭 시 코스 소개로 이동)</h3><br>

<c:forEach var="coslist" items="${courselist}">
<a href="/course/intro/${coslist.cosno}">${coslist.cosname}</a><br>
</c:forEach>

</body>
</html>