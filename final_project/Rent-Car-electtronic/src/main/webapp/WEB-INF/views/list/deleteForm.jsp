<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body> 
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">글 삭제</h2>
<form class="form-horizontal" 
      action="./delete"
      method="post"
      >
  <input type="hidden" name="listno" value="${param.listno}">

  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>

</div>
</body> 
</html>