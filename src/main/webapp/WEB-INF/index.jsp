<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BatterTogether</title>
  
  <!-- Bootstrap -->
  <link href="resources/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Owl Carousel -->
  <link href="resources/plugins/slick-carousel/slick/slick.css" rel="stylesheet">
  <link href="resources/plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
  <!-- Fancy Box -->
  <link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
  <link href="resources/plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
  <!-- CUSTOM CSS -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/member/login.css"> 
  <!-- member js -->
  <script src="resources/plugins/jquery/dist/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <script src="resources/js/LoginProcess.js"></script>
  <!-- 다음 이메일 -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
  <!-- 카카오 로그인 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  

  <!-- FAVICON -->
  <!-- <link href="img/favicon.png" rel="shortcut icon"> -->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body class="body-wrapper">
	<%@ include file="template/header.jsp" %>
	<jsp:include page="${ param.body }" />
	<%@ include file="template/footer.jsp" %>
	
		<!-- 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
       				<h5 class="modal-title" id="exampleModalLabel">모달창 테스트</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
      			    <span aria-hidden="true">&times;</span>
      			    </button>
      			</div>
     		 <div class="modal-body">
     		  <p id="joinFormModal"></p>
     		 </div>
      		 <div class="modal-footer">
       			 <button type="button" class="btn btn-outline-success" data-dismiss="modal">확&nbsp;&nbsp; 인</button>
 		     </div>
   		  </div>
  	  </div>
	</div>
</body>
</html>