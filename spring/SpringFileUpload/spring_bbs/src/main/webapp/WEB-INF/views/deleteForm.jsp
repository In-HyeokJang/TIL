<%@ page contentType="text/html; charset=UTF-8" %> 
<% boolean flag = (boolean)request.getAttribute("flag"); %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <style type="text/css">
   #red{
   	color : red;
   }
  </style>
</head>
<body> 
<div class="container">
<% 
if(flag) {
  out.print("<div class='well well-lg'>");
  out.print("답변있는 글이므로 삭제할 수 없습니다.<br><br>");
  out.print("<button class='btn' onclick='history.back()'>다시시도</button>");
  out.print("<br></div>");
}else{

  %>
<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
<form class="form-horizontal" 
      action="/bbs/delete"
      method="post"
      >
 
  <input type="hidden" name="bbsno" value="<%=request.getAttribute("bbsno") %>">
  <input type="hidden" name="oldfile" value="<%=request.getAttribute("oldfile") %>">
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
<%} %>
</div>
</body> 
</html> 