<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.rentcar.login.*" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <title>회원 목록</title>
  <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <link rel="stylesheet" href="/css/login.css">
  <style>
        table {
          width: 100%;
          border-top: 1px solid #B2CCFF;
          border-collapse: collapse;
        }
          th, td {
            border-bottom: 1px solid #B2CCFF;
            padding: 10px;
}
  tbody tr:nth-child(4n+1) {
    background-color: #e3f2fd;
  }


select {
-o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.select {
  width: 150px;
  height: 35px;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
}
.select option {
  background: #F8FFFF;
  color: black;
  padding: 3px 0;
}
.select option:hover {
  background: rgb(58, 58, 58)
}

  </style>

  <script type="text/javascript">
  function read(id){
	  var url = "${root}/admin/user/read";
	  url += "?id="+id;

	  location.href=url;
  }


  </script>
</head>
<body>
<div>
<br>
   <div class="form-block_2">
<h2 align="center">회원 목록</h2><br><br>
<br>
<form class="form-inline"
      method="post"
      action="list">


<div class="form-group">
<div class="box">
  <select name="col" class="select">
	<option value="mname"
	<c:if test="${col=='mname' }">selected</c:if>
	>이름</option>
	<option value="id"
	<c:if test="${col=='id' }">selected</c:if>
	>아이디</option>
	</select>
   	<div class="list_info">
   		<br>
	<input type="text" class="form-control"
	name="word" required="required" value="${word}">&nbsp;&nbsp;
<button class="cre_btn">검색</button>
</div>
</div>
</div>
</form>
</div>

   <div class="form-block">
<br>
<c:choose>
	<c:when test="${empty list}">
	<div class='well well-lg'> 등록된 회원이 없습니다. </div>
	</c:when>
	<c:otherwise>

<c:forEach var="dto" items="${list}">
<table class="table table-bordered">
<tr>
	<th class="col-sm-2">아이디</th>
	<td class="col-sm-8"><a href="javascript:read('${dto.id}')">${dto.id}</a></td>
</tr>
<tr>
	<th class="col-sm-2">이름</th>
	<td class="col-sm-8">${dto.mname}</td>
</tr>
<tr>
	<th class="col-sm-2">핸드폰 번호</th>
	<td class="col-sm-8">${dto.phone}</td>
</tr>
<tr>
	<th class="col-sm-2">이메일</th>
	<td class="col-sm-8">${dto.email}</td>
</tr>
</table>
 </c:forEach>
 </c:otherwise>
</c:choose>
<br><br><br>
${paging}
</div>
</div>
</body>
</html>