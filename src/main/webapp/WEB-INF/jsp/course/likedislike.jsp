<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div>
			 	<button class="btn btn-info btn-lg" onclick="myFunction();">좋아요</button>
			 	<p id="demo"></p>
			 	<button class="btn btn-info btn-lg" onclick="myFunction()2;">싫어요</button>
			 	<p id="demo2"></p>
			 
			 <Script>
				function myFunction(){
					var txt;
					var r=confirm("좋아요!");
					if(r==true){
						txt="좋아요 누름";
					}else{
						txt="취소누름";
					}
					document.getElementById("demo").innerHTML=txt;
				}
				function myFunction2(){
					var txt;
					var r=confirm("싫어요!");
					if(r==true){
						txt="싫어요 누름";
					}else{
						txt="취소누름";
					}
					document.getElementById("demo2").innerHTML=txt;
				}
			</Script>
		</div>
<br><Br>
</body>
</html>