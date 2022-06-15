<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="num1" value="${20}" />
<c:set var="num2">10.5</c:set>
<c:set var="today" value="<%= new java.util.Date()%>" />

변수 num1 = ${num1} <br>
변수 num2 = ${num2} <br>
num1 + num2 = ${num1 + num2} <br>
오늘은 ${today}입니다. <br><br>

<c:remove var="num1" scope="page" />


삭제한 후의 num1 = ${num1}<br>
삭제한 후의 num1 + num2 = ${num1 + num2} <br>




</body>
</html>