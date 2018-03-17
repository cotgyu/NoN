<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새로운 코스 추가</title>
</head>
<script type="text/javascript">
/* 
카테고리 선택 - 특정 카테고리 선택시 input창에 카테고리선택 값 입력하고 readonly로 변경
			직접 입력시 input 값 비우고 readonly false로 변경 
 */
	function selectcoscategory(value){
		var obj = document.getElementById("coscategory");
		
			if(value=="0"){
					obj.value="";
					obj.readOnly=false;
					obj.focus();
				}
			else{
				obj.value=value;
				obj.readOnly=true;
				
				}
		}
</script>
<body>

임시 메뉴 링크<br>
<a href="/course/list">코스 목록</a><br>
<a href="/course/addcourse">코스 추가</a><br>
<a href="/course/addlecture">강의 추가</a><br>
<br>

<form id="addcourse" method="post" action="/course/insertcourse" enctype="multipart/form-data" method="${method}">
			<table>
				<tr>
					<td>코스 이름 </td>
					<td><input name="cosname" id="cosname" style="width: 500px;"></td>
				</tr>
				
				<tr>
					<td>코스내용 소개</td>
					<td><textarea name="cosintro" id="cosintro" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>코스소개 영상</td>
					<td><textarea name="cosintrovideo" id="cosintrovideo" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>코스 카테고리</td>
					<td>
						<select name="selectcategory" id="selectcategory" onChange="selectcoscategory(this.value);">
							<c:forEach var="coslist" items="${courselist}">	
								<option value="${coslist.coscategory}">${coslist.coscategory}</option>	
							</c:forEach>
							<option selected value="0">카테고리 직접 입력</option>
						</select>
						<br>
						<input name="coscategory" id="coscategory" style="width: 500px;" ></input>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2">
					<input type="submit" class="btn btn-default"  value="코스 등록" /> 
					<button type="button" class="btn btn-default" onClick="location.href='/course/list'">코스 목록으로</button>
				</tr>
			</table>
		</form>
		
</body>
</html>