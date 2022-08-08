<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/login.css">

      <script type="text/javascript">
  	$(function(){
  		$("#btn").click(function(){
  			if($("#mname").val()==''){
  				alert("이름을 입력하세요");
  				$("#mname").focus();
  				return;

  			}else if($("#email").val()==""){
  				alert("이메일을 입력하세요");
  				$("#email").focus();
  				return;
  			}

  			//비동기 통신 요청 idfind() 호출
  			idfind($("#mname").val(),$("#email").val())
  				.then(text => $("#msg").text(text))
  				.catch(console.log);

  		});
  	});

  	//비동기 통신을 처리하는 함수 선언
   function idfind(mname,email){
	  return fetch(`/user/idfindex?mname=\${mname}&email=\${email}`)
	  			.then(response => response.text())
	  			.catch(console.log);
   }
  </script>

  </head>

<body>

    <div class="loginbox">
    <div class="form-block">

    <fieldset>
  <h1><strong>아이디 찾기</strong></h1>
  <p> 가입된 정보를 입력하세요.</p><br><br>

   <div class="info">
   <label for="mname">이름</label>
   <input type="text" class="form-control" id="mname" name="mname" required="required" placeholder="이름을 입력하세요">
   <label for="email">이메일</label>
   <input type="email" class="form-control" id="email" name="email"  required="required" placeholder="이메일을 입력하세요">


    <div class="form-group">
     <div class="message">
     <span id="msg"></span>
     </div>
     </div>
      <button type="button" class="loginbtn" id="btn" style="font-size:16px;">찾기</button>

		<div class ="find" align="center">
		<p>
			<br><br><a href="/user/pwfind">비밀번호 찾기</a><br><br>
		</p>
		<p>
			<a href="/user/agree" style="color:#489CFF;">회원가입</a>
		</p>
		</div>
 	</div>
 </fieldset>
</div>
</div>
</body>
</html>