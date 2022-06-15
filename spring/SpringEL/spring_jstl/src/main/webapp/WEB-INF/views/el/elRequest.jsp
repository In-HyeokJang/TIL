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
	request의 name속성(스크립틀릿 방식) : <% out.print(request.getAttribute("name")); %> <br>
	request의 name속성(표현식 방식) : <%= request.getAttribute("name") %> <br>
	request의 name속성(El-requestScope.name) : ${requestScope.name} <br>
	requset의 name속성(El-name) : ${name}
</h2>
</body>
</html>