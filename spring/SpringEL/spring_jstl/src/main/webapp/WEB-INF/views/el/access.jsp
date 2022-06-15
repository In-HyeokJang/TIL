<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
// Scriptlet을 이용한 경우 
String name = (String)request.getAttribute("name");
int tot = (Integer)request.getAttribute("tot");
int avg = (Integer)request.getAttribute("avg");

out.println("성명: " + name + "<br/>"); 
out.println("총점: " + (tot) + "<br/>"); 
out.println("가산점: " + (tot+5) + "<br/>"); 
out.println("평균: " + avg + "<br/>"); 
%> 

<br><br> 
성명:${name}<br> 
총점:${tot}<br> 
가산점:${tot+5}<br> 
평균:${avg} 점<br> 
</body>
</html>