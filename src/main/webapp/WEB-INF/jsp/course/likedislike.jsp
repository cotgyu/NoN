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
			 	<button class="btn btn-info btn-lg" onclick="myFunction();">���ƿ�</button>
			 	<p id="demo"></p>
			 	<button class="btn btn-info btn-lg" onclick="myFunction()2;">�Ⱦ��</button>
			 	<p id="demo2"></p>
			 
			 <Script>
				function myFunction(){
					var txt;
					var r=confirm("���ƿ�!");
					if(r==true){
						txt="���ƿ� ����";
					}else{
						txt="��Ҵ���";
					}
					document.getElementById("demo").innerHTML=txt;
				}
				function myFunction2(){
					var txt;
					var r=confirm("�Ⱦ��!");
					if(r==true){
						txt="�Ⱦ�� ����";
					}else{
						txt="��Ҵ���";
					}
					document.getElementById("demo2").innerHTML=txt;
				}
			</Script>
		</div>
<br><Br>
</body>
</html>