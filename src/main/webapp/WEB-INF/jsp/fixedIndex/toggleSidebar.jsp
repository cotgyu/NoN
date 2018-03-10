<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand">
          <a href="#">
            강좌검색
          </a>
        </li>
        <li>
          <a href="#">분야별 강좌</a>
        </li>
        <li>
          <a href="#">질문과 답변</a>
        </li>
        <li>
          <a href="#">내 강좌</a>
        </li>
        <li>
          <a href="#">질문과 답변</a>
        </li>
        <li>
          <a href="#">About</a>
        </li>
        <li>
          <a href="#">Services</a>
        </li>
        <li>
          <a href="#">Contact</a>
        </li>
      </ul>
    </div>
    <!-- /#sidebar-wrapper -->

   









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
