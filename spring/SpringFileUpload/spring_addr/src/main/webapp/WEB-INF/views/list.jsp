<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*, com.study.model.AddrDTO, com.study.utility.*" %>
<%
	String col = (String)request.getAttribute("col"); 
	String word = (String)request.getAttribute("wrod");
	int nowPage = (int)request.getAttribute("nowPage");
	List<AddrDTO> list = (List<AddrDTO>)request.getAttribute("list");
	String paging = (String)request.getAttribute("paging");
	

	//listaction에서 받아온거 연걸 해서 밑에 보여주기
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script>
  	function read(addressnum){
  		let url = "read/"+addressnum;
  		location.href=url
  	}
  
  	function del(addressnum){
  		if(confirm("정말 삭제하시겠습니까?")){
  			let url = "delete/"+addressnum;
  		    
  			location.href=url; 		
  		}
  	}
  </script>
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">주소록</h1>
<form action="list" class='form-inline'>
<div class='form-group'>
	<select class='form-control' name='col'>
		<option value="name"<%if(col.equals("name")) out.print("selected");%>>이름</option>
		<option value="handphone" <%if(col.equals("handphone")) out.print("selected");%>>전화번호</option>
 		<option value="address"<%if(col.equals("address")) out.print("selected");%>>주소</option>
 		<option value="total"<%if(col.equals("total")) out.print("selected");%>>전체출력</option>
	</select>
	</div>
<div class="form-group">
	<input type='text' class='form-control' placeholder='Enter 검색어' name='word'>
</div>
<button class='btn btn-default'>검색</button>

<%-- 다시 등록으로 되돌아가게 만들기 --%>
<button class='btn btn-default' type='button' onclick="location.href='create'">등록</button> 
</form>
<table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>삭제</th>
			
		</tr>
	</thead>
	<tbody>
	<%--list 부분 읽어오는거 --%>
<% if(list.size() == 0) { %>
		<tr><td colspan='5'>등록된 글이 없습니다. </td></tr>
		
<% }else{
	for(int i=0; i < list.size(); i++){
		AddrDTO dto = list.get(i);
%>

	<tr>	
	<td><%=dto.getAddressnum() %></td>
	<td><a href="javascript:read('<%=dto.getAddressnum() %>')"><%=dto.getName()%></a></td> 
	<td><%=dto.getHandphone() %></td>
	<td><%=dto.getAddress() %></td>
	<td><a href="javascript:del('<%=dto.getAddressnum() %>')">삭제</a></td>
	</tr>
	
	<%
		}
	}	
%>		

	</tbody>
</table>
<div>
<%=paging %>
</div>
</div>
</body> 
</html> 