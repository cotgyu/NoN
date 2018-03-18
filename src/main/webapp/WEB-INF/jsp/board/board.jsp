<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추천 게시판</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="/resources/js/jquery/jquery.js"></script>
</head>
<body>
	<!-- Page Content -->
	<div ng-app="boardApp" ng-controller="boardController"  id="divLoadBody" class="container">
		<h2>&nbsp;추천 게시판</h2>
		<div class="col-md-12">
			<button class="btn btn-default" onclick="location.href='/register'">글쓰기</button>
			<button class="btn btn-default" onclick="boardController();">데이터
				가져오기</button>
			<input type="text" ng-model="data">
			<div id="searchResultArea"></div>
		</div>
	</div>

	<!-- 	<script src="/resources/js/jquery/jquery.js"></script> -->
	<script src="/resources/js/board.js"></script>
	<script src="/resources/js/angular/angular.min.js"></script>
	<script type="text/javascript">

	var app = angular.module('boardApp', []);
	app.controller('boardController', function($scope, $http) {
	  $http.get("/board/1")
	  .then(function(response) {
	      $scope.myWelcome = response.data;
	  });
// 	});	
	
// 		var app = angular.module('boardApp', []);
// 		var $http = require('request');
		
// 		app.controller('boardController', ['$scope','$http', function($scope, $http) {
// 			$http.get("/board/1").success(function(data) {
// 				$scope.data = data;
// 			});
// 		}]);
// 		boardController.$inject = [ '$scope', '$http' ];
// 		function boardController($scope, $http) {
// 			$http.get("http://localhost:8080/board/1").success(function(data) {
// 				$scope.data = data;
// 			});
// 		}

// 		/* AJAX 통신 처리 */
// 		$http({
// 			method : 'POST', //방식
// 			url : 'http://localhost:8080/board/1', /* 통신할 URL */
// 			data : dataObject, /* 파라메터로 보낼 데이터 */
// 			headers : {
// 				'Content-Type' : 'application/json; charset=utf-8'
// 			}
// 		//헤더
// 		}).success(function(data, status, headers, config) {
// 			if (data) {
// 				/* 성공적으로 결과 데이터가 넘어 왔을 때 처리 */
// 				$scope.data = data;
// 			} else {
// 				/* 통신한 URL에서 데이터가 넘어오지 않았을 때 처리 */
// 			}
// 		}).error(function(data, status, headers, config) {
// 			/* 서버와의 연결이 정상적이지 않을 때 처리 */
// 			console.log(status);
// 		});
	</script>
</body>
</html>