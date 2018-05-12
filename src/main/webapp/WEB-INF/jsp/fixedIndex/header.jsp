<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!--header-->
    <header class="bg-primary text-white" style="padding: 154px 0 100px; background-image: url('/resources/img/header.png')">
      <div class="container text-center">
        <h1>NoN</h1>
        <p class="lead">NoN에서 쉽고 빠르게 IT분야를 학습할 수 있습니다!</p>
        <div class="searchMenu">
				<form name="searchform" method="post" action="/course/searchlist">			     	
				    <input name="keyword" value="${keyword}" placeholder="원하는 강좌를 입력해주세요!" style="width: 250px;">
				    <button type="submit" class="btn">검색</button>
				</form>
			</div>		
      </div>
    </header>