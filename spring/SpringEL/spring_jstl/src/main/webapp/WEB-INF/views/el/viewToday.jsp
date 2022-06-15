<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="el" uri="/ELFunctions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
오늘은 <b>${el:dateFormat(today)}</b>입니다.<br>
오늘은 <b> ${today}</b> 입니다.<br>
</body>
</html>