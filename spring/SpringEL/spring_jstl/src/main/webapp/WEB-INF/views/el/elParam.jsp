<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
	<%
		String code = request.getParameter("code");
	%>
	code 파라미터(스크립틀릿 방식) : <% out.print(code); %> <br>
	code 파라미터(El) : ${param.code} <br>
</h2>
</body>
</html>