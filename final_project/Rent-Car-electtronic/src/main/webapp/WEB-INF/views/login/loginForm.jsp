<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <title>로그인 처리</title>
  <meta charset="utf-8">
</head>
<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
  <form class="form-horizontal" 
        action="/user/login"
        method="post">
    <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="contentsno" value="${param.contentsno}">       
    <input type="hidden" name="nPage" value="${param.nPage}">    
        
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required" 
        value='${c_id_val}'>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="passwd" 
        placeholder="Enter password" name="passwd" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <div class="checkbox">
          <label>
          <c:choose>
          <c:when test="${c_id =='Y'}">
          	<input type="checkbox" name="c_id" value="Y" checked="checked"> 아이디 저장
          </c:when>
          <c:otherwise>
            <input type="checkbox" name="c_id" value="Y" > 아이디 저장
          </c:otherwise>
          </c:choose>
          </label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">로그인</button>
        <button type="button" class="btn btn-default"
         onclick="location.href='/user/agree'">회원가입</button>
        <button type="button" onclick="location.href='/user/idfind'" class="btn btn-default">아이디 찾기</button>
        <button type="button" onclick="location.href='/user/pwfind'" class="btn btn-default">패스워드 찾기</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>