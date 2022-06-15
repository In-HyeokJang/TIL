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
<c:set var ="intArray" value ="<%=new int[]{1,2,3,4,5} %>" />

<h4>1부터 100까지 홀수의 합</h4>
<c:forEach var="i" begin="1" end="100" step="2">
	<c:set var="sum" value="${sum + i }" ></c:set>
</c:forEach>
결과 = ${sum}

<h4> 구구단  : 4단</h4>
<ul>
<c:forEach var="i" begin="1" end="9">
	<li>4 * ${i} = ${4 * i}
</c:forEach>
</ul>

<h4>int형 배열</h4>
<c:forEach var="i" items="${intArray}" begin="2" end="4">
	[${i}]
</c:forEach>
<br>
<c:forEach var="i" items="${map}">
	${i.key} = ${i.value}<br>
</c:forEach>
<br>
콤마와 점을 구분자로 사용:<br> 
<c:forTokens var="token"  
             items="빨강색,주황색.노란색.초록색,파랑색,남색.보라색" 
             delims=",."> 
${token}  
</c:forTokens> 


</body>
</html>