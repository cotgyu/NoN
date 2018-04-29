<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <meta name="description" content="">
<meta name="author" content=""> -->

<!-- Bootstrap core CSS -->
<!--toggle-->
<link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/indexresource/css/simple-sidebar.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="resources/indexresource/vendor/jquery/jquery.min.js"></script>
<!--toggle -->
<script src="resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="nav.jsp" />
		<jsp:include page="toggleSidebar.jsp" />
		<jsp:include page="header.jsp" />
		<jsp:include page="menuButton.jsp" />

		<!-- Page Contents -->
		<div class="container">
			<h1 class="my-4">
				강의 목록
				<h6>새로운 강의!!!!</h6>
			</h1>
			<jsp:include page="lectureContents.jsp" />
		</div>
		<!-- /.container -->
		<jsp:include page="footer.jsp" />
	</div>
	<!-- /#wrapper -->

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>
</html>