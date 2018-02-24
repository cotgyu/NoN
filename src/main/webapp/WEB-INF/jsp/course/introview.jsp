<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${map.course.cosname}코스</title>
<script>
	//플레이어창 띄우기
	function openPlayer(){  
	    window.open("/course/player", "강의 플레이어", "width=1500, height=900,resizable=yes" );  
	}  
</script>
</head>
<body>
${map.course.cosname} <button type="submit" id="subscribe" onclick="javascript_:openPlayer()" class="btn btn-default" >수강하기</button>
<br>
<br>

    <nav>
      <div class="container">
        <div>
          <ul>
            <li>
              <a href="#intro">강좌 소개</a>
            </li>
            <li>
              <a href="#courselist">강의리스트</a>
            </li>
            <li>
              <a href="#eval">수강후기</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
<br>
<section id="intro">
강좌 소개<br>
${map.course.cosintro}
<br>
<iframe src="https://www.youtube.com/embed/${map.course.cosintrovideo}" height="500" width="800" allowfullscreen="allowfullscreen" name="fitvid0"></iframe>
</section>
<br><br>
<br><br>
<br><br>

<section id="courselist">
강좌 리스트(todo-강좌 클릭시 플레이어 열기)<br>
<c:forEach var="lec" items="${map.lecture}">
${lec.lecname} &ensp;&ensp;
${lec.lectime}<br>

</c:forEach>
</section>
<br><br>
<br><br>
<br><br>

<section id="eval">
수강후기(예정)
</section>
<br><br>
<br><br>
<br><br>

</body>
</html>