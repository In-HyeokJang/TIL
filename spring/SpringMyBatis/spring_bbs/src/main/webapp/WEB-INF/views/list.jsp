<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*, com.study.model.BbsDTO, com.study.utility.*" %>
<%  
//Action에서 저장한 model결과 및 JSP에서 사용할 내용을꺼내온다. 
String col = (String)request.getAttribute("col");
String word =(String)request.getAttribute("word");
int nowPage = (int)request.getAttribute("nowPage");
List<BbsDTO> list = (List<BbsDTO>)request.getAttribute("list");
String paging =(String)request.getAttribute("paging");
%>  
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
 	<option value="wname" <%if(col.equals("wname")) out.print("selected");%>>작성자</option>
 	<option value="title" <%if(col.equals("title")) out.print("selected");%>>제목</option>
 	<option value="content" <%if(col.equals("content")) out.print("selected");%> >내용</option>
 	<option value="title_content" <%if(col.equals("title_content")) out.print("selected");%>>제목+내용</option>
 	<option value="total" <%if(col.equals("total")) out.print("selected");%>>전체출력</option>
 </select>
</div>
<div class="form-group">
	<input type='text' class='form-control' placeholder='Enter 검색어' name='word' value="<%=word%>">
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
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
	</thead>
	<tbody>
<%  if(list.size()==0){ %>	
	<tr><td colspan='7'>등록된 글이 없습니다.</td></tr>
	
<%  }else {
		for(int i=0 ; i < list.size() ; i++) { 
	   	BbsDTO dto = list.get(i);	 
%>	
		<tr>
			<td><%=dto.getBbsno() %></td>
			<td>
				<%
					for(int j=0; j<dto.getIndent() ; j++){
						out.print("&nbsp;&nbsp;");
					}//들여쓰기
				    if(dto.getIndent() > 0) out.print("<img src='/images/re.jpg'>"); //re이미지
				%>
			<a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
			<% if(Utility.compareDay(dto.getWdate())){ %>
				<img src="../images/new.gif">
			<% } %>
			</td>
			<td><%=dto.getWname() %></td>
			<td><%=dto.getWdate() %></td>
			<td><%=dto.getGrpno() %></td>
			<td><%=dto.getIndent() %></td>
			<td><%=dto.getAnsnum() %></td>	
		</tr>
<%     } //for end
    } //if end
%>		
	</tbody>
</table>
<div>
	<%=paging %>
</div>
</div>
</body> 
</html> 