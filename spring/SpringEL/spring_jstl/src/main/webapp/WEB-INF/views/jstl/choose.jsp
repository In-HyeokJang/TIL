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
<ul>
	<c:choose>
		<c:when test = "${param.name == 'tree' }">
			<li>당신의 이름은 ${param.name}입니다. 
		</c:when>
		<c:when test="${param.age > 18 }">
			<li>당신은 18세 이상 입니다.
		</c:when>
		<c:otherwise>
			<li>당신은 tree가 아니고 18세 이상도 아닙니다.
		</c:otherwise>
	</c:choose>
</ul>

</body>
</html>