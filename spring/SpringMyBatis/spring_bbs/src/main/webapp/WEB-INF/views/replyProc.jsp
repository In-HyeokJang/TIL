<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 	
    boolean flag = (boolean)request.getAttribute("flag"); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="well well-lg">
	 <%
	    if(flag){
	 		out.print("글 답변 성공입니다.");
	 	}else{
	 		out.print("글 답변 실패입니다.");
	 	}
	 %>
	</div>
	<button class='btn' onclick="location.href='create.do'">다시등록</button>
	<button class='btn' onclick="location.href='list.do'">목록</button>
</div>

</body>
</html>