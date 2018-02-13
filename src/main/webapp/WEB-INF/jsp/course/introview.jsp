<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>intro test</title>
<script>
	//플레이어창 띄우기
	function openPlayer(){  
	    window.open("/course/player", "강의 플레이어", "width=1500, height=900,resizable=yes" );  
	}  
</script>
</head>
<body>
TEST View <button type="submit" id="subscribe" onclick="javascript_:openPlayer()" class="btn btn-default" >수강하기</button>
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
강좌소개(데이터가져와서 표시할 것)<br>
<iframe src="https://www.youtube.com/embed/MD3YGrofnDY" height="500" width="800" allowfullscreen="allowfullscreen" name="fitvid0"></iframe>
</section>
<br><br>
<br><br>
<br><br>

<section id="courselist">
강좌평가(데이터가져와서 표시할것)
</section>
<br><br>
<br><br>
<br><br>

<section id="eval">
강좌리스트(데이터 가져와서 표시할것)
</section>
<br><br>
<br><br>
<br><br>

</body>
</html>