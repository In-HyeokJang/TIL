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
<c:if test="true">
	무조건 실행
</c:if>	
<br>
<c:if test="${param.name == 'tree' }">
	name parameter의 값이 ${param.name} 입니다.
</c:if>
<br>
<c:if test="${param.age > 19 }"> 
	당신의 나이는 19세 이상입니다.
</c:if>
</body>
</html>