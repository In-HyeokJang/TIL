<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.study.model.*" %>
 <%
 	MemoDTO dto = (MemoDTO)request.getAttribute("dto");
 %>
 
<!DOCTYPE html>
<html>
<head>
 <title>homepage</title>
<meta charset="UTF-8">
<script type="text/javascript">
  	function update(memono){// 수정 페이지로 이동
  		let url = '/memo/update/<%=dto.getMemono()%>';
  		location.href = url;
  	}
  	function del(memono){// 삭제 페이지로 이동
  		let url = '/memo/delete/<%=dto.getMemono()%>';
  		location.href = url;
  	}
  	function reply(memono){ // 답변 페이지로 이동
		let url = '/memo/reply/<%=dto.getMemono()%>';
  		location.href = url;
  	}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>메모 조회</h1>
<div class="panel panel-default">
	<div class="panel-heading">작성자</div>
	<div class="panel-body"><%=dto.getWname() %></div>
	<div class="panel-heading">제목</div>
	<div class="panel-body"><%=dto.getTitle() %></div>
	<div class="panel-heading">내용</div>
	<div class="panel-body" style='height:170px'><%=dto.getContent() %></div>
	<div class="panel-heading">조회수</div>
	<div class="panel-body"><%=dto.getViewcnt() %></div>
	<div class="panel-heading">등록일</div>
	<div class="panel-body"><%=dto.getWdate() %></div>

</div>
<div>
	<button onclick="location.href='/memo/create'">등록</button>
	<button onclick="update()">수정</button>
	<button onclick="del()">삭제</button>
	<button onclick="reply()">답변</button>
	<button onclick="location.href='/memo/list'">목록</button>
</div>
</div>
</body>
</html>