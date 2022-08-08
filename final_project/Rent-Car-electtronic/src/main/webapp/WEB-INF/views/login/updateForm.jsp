<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원정보 수정</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

      <link rel="stylesheet" href="/css/login.css">

  <meta charset="utf-8">
  <style type="text/css">
  	#emailcheck{
  		color:red;
  	}
  	    p {
        text-align: center;
        border-bottom:1px solid gray;
        margin:0px;
        padding:20px;
    }
      	#need{
      		color:red;
      		font-size:13px;
      	}
  </style>
  <script type="text/javascript">


  function emailCheck(email){
	  //alert(email);
	  if(email==''){
		  alert("이메일을 입력하세요");
		  document.frm.email.focus();
	  }else{
		  var url = "emailcheck";
		  url += "?email="+email;

		  $.get(url, function(data, textStatus) {

			  $("#emailcheck").text(data.str);

		  })
	  }
  }

function inCheck(f){

	if(f.phone.value.length==0){
		alert("전화번호를 입력하세요");
		f.phone.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
}

</script>

  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
  <div class="createbox">
    <div class="form-block">
     <h1 align="center">회원정보 수정 <br><p>가입 시 입력한 회원정보입니다.</p></h1><br><br><br>
    <form class="form-horizontal"
          action="update"
          method="post"
          name = 'frm'
          onsubmit="return inCheck(this)"
          >
       <input type="hidden" name="id" value="${dto.id}">

      <div class="info_2">
        <label class="control-label col-sm-2" for="id">아이디</label>
        <div class="col-sm-3">
        <input type="text" class="form-control" id="id" value="${dto.id}" readonly>
        </div>
      </div>
      <div class="info_2">
        <label class="control-label col-sm-2" for="mname">이름</label>
        <div class="col-sm-4">
        <input type="text" class="form-control" id="mname" value="${dto.mname}" readonly>
        </div>
      </div>
      	<div class="info_2">
            <label class="control-label col-sm-2" for="license">운전면허번호</label>
            <div>
              <input type="text" class="form-control" id="license" value="${dto.license}" name="license" readonly>
            </div>
          </div>
      <div class="info">
        <label class="control-label col-sm-2" for="phone"><span id="need">*</span> 전화번호</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="phone"
           value="${dto.phone}"  name="phone">
        </div>
      </div>
      <div class="info">
        <label class="control-label col-sm-2" for="email"><span id="need">*</span> 이메일</label>
                <div id="emailcheck"></div>
        <div>
          <input type="email" class="form-control" id="email"
          value="${dto.email}" name="email">
        <button type="button" class="cre_btn"
        onclick="emailCheck(document.frm.email.value)">이메일 변경</button>
        </div>
      </div>
      <div class="info">
        <label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
        <div class="col-sm-1">
          <input type="text" class="form-control"
           name="zipcode" id="sample6_postcode" value="${dto.zipcode}">
            <button type="button" class="cre_btn2"
            onclick="sample6_execDaumPostcode()">주소검색</button>
        </div>
      </div>
      <div class="info">
        <label class="control-label col-sm-2" for="sample6_address">주소</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="sample6_address"
          value="${dto.address1}"
           name="address1">
          <input type="text" class="form-control" id="sample6_detailAddress"
          value="${dto.address2}"
           name="address2">
        </div>
      </div>


      <div align="center">
      <br><br>
          <button type="submit" class="agreebtn">수정</button><br>
          <button class="btn_2" onclick="history.back()">취소</button>
      </div>
      <div>
      <br><br><br>
           <button type="button" class="cre_btn2" onclick="location.href='/user/delete'">회원탈퇴</button>
      </div>
    </form>

  <br><br>
  </div>
  </div>
</body>
</html>