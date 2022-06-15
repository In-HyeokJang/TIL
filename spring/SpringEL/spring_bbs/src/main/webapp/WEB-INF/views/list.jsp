<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	function read(bbsno){
  	   let url = 'read/'+bbsno;
  	   location.href = url;
  	}
  </script>
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 목록</h1>
<form action="list" class='form-inline'>
<div class='form-group'>
 <select class='form-control' name='col'>
 	<option value="wname" 
 	<c:if test="${col == 'wname' }">selected</c:if>
 	>성명</option>
 	<option value="title" 
 	<c:if test="${col == 'title' }">selected</c:if>
 	>제목</option>
 	<option value="content" 
 	<c:if test="${col == 'content' }">selected</c:if> 
 	>내용</option>
 	<option value="title_content"
 	 <c:if test="${col == 'title_content' }">selected</c:if> 
 	 >제목+내용</option>
 	<option value="total" 
 	<c:if test="${col == 'total' }">selected</c:if>
 	>전체출력</option>
 </select>
</div>
<div class="form-group">
	<input type='text' class='form-control' placeholder='Enter 검색어' 
	name='word' value="${word}">
</div>
<button class='btn btn-default'>검색</button>
<button class='btn btn-default' type='button' onclick="location.href='create'">등록</button>
</form>
<table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
			<th>조회수</th>
			<th>파일명</th>
		</tr>
	</thead>
	<tbody>

<c:choose>
	<c:when test="${empty list}">
	 	<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.bbsno}</td>
			<td>
			    <c:forEach begin="1" end="${dto.indent}">
			    &nbsp;&nbsp;
			    </c:forEach>
			    <c:if test="${dto.indent >0 }">
			    <img src='/images/re.jpg'>
			    </c:if>
			<a href="javascript:read('${dto.bbsno}')">${dto.title}</a>
			<%-- if(Utility.compareDay(dto.getWdate())){ --%>
				<img src="/images/new.gif">
			<%-- } --%>
			</td>
			<td>${dto.wname }</td>
			<td>${dto.wdate}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.filename}</td>	
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>		
</tbody>
</table>
<div>
	${paging}
</div>
</div>
</body> 
</html> 