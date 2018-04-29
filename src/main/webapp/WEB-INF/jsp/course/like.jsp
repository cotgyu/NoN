<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resource/js/jquery-1.12.1.js"></script>
<script type="text/javascript">
	$(document).ready( function() {				
		$(".hide").hide();		
		$("#favorite").click(function(){			
			
			$.post(
					"/favorite"
					, {"articleId" : "${article.articleId}"}	
					, function(data){
												
						var jsonData3 = {};
						try {
							jsonData3 = JSON.parse(data);
						}catch(e) {
							jsonData3.result = false;
						}
						console.log(jsonData3);
						
						if ( jsonData3.result ){
							var text = $("#favorite").text();
							if (jsonData3.isFavorite){
								$("#favorite").text("♥");
							}
							else if (text == "♥"){
									$("#favorite").text("♡");
							} 
						}
						else {
							/* alert("세션이 만료되었습니다. 다시 로그인해주세요.");
							location.href = "/"; */
						}
					}
			);
		});
		
		$("#list").click( function() {
			location.href = "/list";
		} );		
		$("#btnRecommends").click(function(){
	         var form = $("#btnRecommendsForm");
	         
	         form.attr("method", "POST");
	         form.attr("action", "/recommends?articleId=${articles.articleId }");
	         
	         form.submit();
	      });
	      
	      $("#writeReplyBtn").click(function(){
	         var form = $("#writeReplyForm");
	         
	         form.attr("method", "POST");
	         form.attr("action", "/doWriteReply");
	         
	         form.submit();
	      });
	      $("body").on("click", "#writeReplyBtn", function(){
		         var form = $("#writeReplyForm");
		         
		         form.attr("method", "POST");
		         form.attr("action", "/doWriteReply");
		         
		         form.submit();
		     });
	      
	      $(".writeReReply").click(function(){
	    	 var table = $(this).parent().parent().parent();
	    	 console.log(table.text());
	    	 
	    	 var groupId = table.children(":eq(1)").children(":eq(0)").html();
	         var parentReplyId = table.children(":eq(1)").children(":eq(1)").html();
	         var depth = table.children(":eq(2)").children(":eq(0)").html();
	         var orderNo = table.children(":eq(2)").children(":eq(1)").html();
	         var replyId = table.children(":eq(3)").children(":eq(0)").html();
	    	 
	         depth = parseInt(depth);
	         
	    	 $("#depth").val(parseInt(depth)+1);
	    	 $("#parentReplyId").val(replyId);
	    	 $("#groupId").val(groupId);
	    	 $("#orderNo").val(orderNo);
	    	 $("#replyId").val(replyId);
	    	 
	    	 var form = $("#formWrapper").html();
	    	 $("#formWrapper").detach();
	    	 
	    	 if (form == undefined ) {
	    		 $(".formAppender").each(function(index, data){
	    			 if (data.innerHTML != ""){
	    				 form = data.innerHTML;
	    			 }
	    		 });
	    		 $(".formAppender").html("");
	    	 }
	    	 
	    	 var formAppender =table.parent().parent().children(":eq(1)");
	    	 formAppender.html(form);
	    	 formAppender.show();
	    	 
	      });
	} );
</script>
</head>
<body>
<div id="listcss" align="center">
<table border="1">
	<tr>
		<th>ARTICLE_ID</th>
		<th>MEMBER_ID</th>
		<th>NICK_NAME</th>
		<th>HITS</th>
		<th>RECOMMENDS</th>
	</tr>	
	<tr>
		<td>${ article.articleId }</td>
		<td>${ article.memberId }</td>
		<td>${ article.nickName }</td>
		<td>${ article.hits }</td>
		<td>${ article.recommends }</td>
	</tr>
		<th>제목
		<c:if test="${isExistsFavoriteData }">
			<span id="favorite" syle="color:red;">♥</span>
			</c:if>
			<c:if test="${!isExistsFavoriteData }">
			<span id="favorite"  syle="color:red;">♡</span>
			</c:if></th>
		<td colspan="5">${article.title}</td>
	<tr>
		<th>내용</th>
		<td colspan="5">${article.descript}</td>
	</tr>
	
	<tr>
		<c:forEach items ="${article.fileList}" var="file">
			<td colspan="6">
				<a href = "/download?fileId=${file.fileId}&articleId=${article.articleId}">
					${file.fileName}
				</a>
			</td>
		</c:forEach>
	</tr>
</table>


