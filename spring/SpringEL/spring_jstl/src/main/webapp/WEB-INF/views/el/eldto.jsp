<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.study.jstl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
	스크립틀릿 사용 <br>
	<%
		ELDTO eldto = (ELDTO)request.getAttribute("dto");
	%>
	영화명 : <%=eldto.getMovie() %> <br>
	주 연 : <%=eldto.getName() %><br>
	
	<br>
	EL을 사용한 경우 <br>
	영화명 : ${requestScope.dto.movie} <br>
	주 연 : ${dto.name} <br><br>
	Type2 : 주연 : ${dto.movie } - ${dto.name} <br>
	Type3 : 주연(X) : ${requestScope.movie} <br>
	Type4 : 주연(X) : ${movie}<br>
</h2>
</body>
</html>