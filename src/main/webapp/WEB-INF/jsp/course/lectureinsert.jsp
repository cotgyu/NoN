<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새로운 강의 추가</title>
</head>
<body>
<div id="wrapper">
<jsp:include page="/WEB-INF/jsp/course/Mynav.jsp"/>
<jsp:include page="/WEB-INF/jsp/course/MytoggleSidebar.jsp"/>

<br><br>
<jsp:include page ="/WEB-INF/jsp/course/MymenuButton.jsp"/>
<br><br><br>
<div class="container">


<form id="addcourse" method="post" action="/course/insertlecture" enctype="multipart/form-data" method="${method}">
			<table>
				<tr>
					<td>코스 번호 / 코스 이름</td>
					<td>
						<select name="cosno" id="cosno">
							<c:forEach var="coslist" items="${courselist}">	
								<option value="${coslist.cosno}">${coslist.cosno} / ${coslist.cosname}</option>	
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>강좌 이름</td>
					<td><textarea name="lecname" id="lecname" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>강좌 시간</td>
					<td><textarea name="lectime" id="lectime" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>강좌 영상</td>
					<td><textarea name="lecvideo" id="lecvideo" placeholder="유튜브 영상주소를 입력해주세요" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				
				<tr>
					<td colspan="2">
					<input type="submit" class="btn btn-default"  value="강좌 등록" /> 
					<button type="button" class="btn btn-default" onClick="location.href='/course/list'">코스 목록으로</button>
				</tr>
			</table>
		</form>
		</div>
<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>
</body>
</html>