<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>edu pjt_3-Col </title>


  <!-- Bootstrap core CSS --> <!--toggle-->
  <link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">   

  <!-- Custom styles for this template -->
  <link href="resources/indexresource/css/simple-sidebar.css" rel="stylesheet">
</head>
<body>
<!--wrapper-->
  <div id="wrapper">
    <jsp:include page="nav.jsp"/>
    <jsp:include page="toggleSidebar.jsp"/>/*toggle이 nav보다 위에 있을경우 에러날 수 있음*/
 
    <!--header-->
    <header class="bg-primary text-white" style="padding: 154px 0 100px;">
      <div class="container text-center">
        <h1>Edu Project</h1>
        <p class="lead">원하시는 강좌를 선택하세요</p>
      </div>
    </header>
     
<jsp:include page ="menuButton.jsp"/>

    <!-- Page Contents -->
    <div class="container">
      <h1 class="my-4">강의 목록
        <h6>새로운 강의</h6>
      </h1>
         <jsp:include page="lectureContents.jsp"/>
          <!-- Pagination -->
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
              </a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
              </a>
            </li>
          </ul>

        </div>
        <!-- /.container -->

	<jsp:include page="footer.jsp"/>
  </div>
  <!-- /#wrapper -->







  <!-- Bootstrap core JavaScript -->
  <script src="resources/indexresource/vendor/jquery/jquery.min.js"></script><!--toggle -->
  <script src="resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>
</html>