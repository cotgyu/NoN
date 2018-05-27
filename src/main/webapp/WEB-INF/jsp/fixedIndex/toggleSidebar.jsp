<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> 공백...(수정해야함..) </a></li>
				<li><a href="/course/list">분야별 강좌</a></li>
				<li><a href="#">질문과 답변</a></li>
				<c:if test="${not empty sessionScope.id}">	
					<li><a href="/course/mycourse">내 강좌</a></li>
				</c:if>
				<li><a href="/course/addcourse">강좌 추가</a></li>
				<li><a href="/course/addlecture">강의 추가</a></li>
				<li><a href="/course/selectmodifycourse/">강좌&강의 수정</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->


