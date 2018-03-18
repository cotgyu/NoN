<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추천 게시판</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
</head>
<body >
	<!-- Page Content -->
	<div ng-app="boardApp" id="divLoadBody" class="container">
		<h2>&nbsp;추천 게시판</h2>
		<div ng-controller="boardController" class="col-md-12">
			<button class="btn btn-default" onclick="location.href='/register'">글쓰기</button>
			<button class="btn btn-default" onclick="boardController();">데이터 가져오기</button>
			<input type="text" ng-model="data">
			<div id="searchResultArea"></div>
		</div>
	</div>

<!-- 	<script src="/resources/js/jquery/jquery.js"></script> -->
	<script src="/resources/js/board.js"></script>
	<script src="/resources/js/angular/angular.min.js"></script>
	<script type="text/javascript">
			var app = angular.module('boardApp', []);
// 			app.controller('boardController', function($scope, $http) {
// 				$http.get("/board/1").success(function(data) {
// 					$scope.data = data;
// 				});
// 			});
			boardController.$inject = ['$scope', '$http']; 
			function boardController($scope, $http) {
				$http.get("http://localhost:8080/board/1").success(function(data) {
					$scope.data = data;
				});
			}
	</script>
</body>
</html>