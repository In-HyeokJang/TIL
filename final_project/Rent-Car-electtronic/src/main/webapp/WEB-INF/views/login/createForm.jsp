<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <meta charset="utf-8">  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link rel="stylesheet" href="/css/login.css">
  
  <style type="text/css">
  	#need{
  		color:red;
  		font-size:13px;
  	}
  	#need2{
  	        font-size:14px;
  	        display: block;
            width: 410px;
            margin: 20px 0px;
            color:#003399;
            text-decoration: #3DB7CC wavy underline;
  	}

	#idcheck,#emailcheck{
		color : red;
		font-size: 15px;
	}

</style>
  <script type="text/javascript">

  function licOcr(formData){

	  return fetch(`/license`,{
		    method: 'POST',
		    body: formData
		  })
	  		.then(response => response.json())
	  		.catch(console.log);
  }

  function licInfo(fname){
	  const formData = new FormData();
	  const fileField = document.querySelector('input[type="file"]');

	  formData.append('fname', fileField.files[0]);

	  licOcr(formData)
	  .then(result => {

		  document.querySelector('#license1').value = result.license.trim();
		  document.querySelector('#license2').value = result.license.trim();
		  document.querySelector('#jumin').value = result.jumin.replace("-","").trim();

	  });
  }

  function juminCheck(jumin){
	  if(jumin==''){
		  alert("운전면허증 확인 버튼을 눌러주새요.");
	  }else{

        var checknum = new Array(2,3,4,5,6,7,8,9,2,3,4,5);

        var sum = 0;

        for(var i=0; i<12; i++) {
            sum += (jumin.charAt(i) - '0') * checknum[i];
        }
        var num2 = sum % 11;
        var result = 11 - num2;


        	if(result == jumin.charAt(12)-'0') {

        	  alert("운전면허증 확인 완료되었습니다.");

           document.getElementById("license2").disabled = true;
           document.getElementById("licInfo_btn").disabled = true;
           document.getElementById("jumin_btn").disabled = true;


        		}else {

        		alert("유효하지 않은 운전면허증입니다. 회원가입을 하실 수 없습니다.");
        		location.reload(true);

        		}
       }
 }



  function idCheck(id){
	  if(id==''){
		  alert("아이디를 입력하세요");
		  document.frm.id.focus();
	  }else{
		  var url = "idcheck";
		  var param = "id="+id;

		  $.get(url, param, function(data, textStatus) {

			  $("#idcheck").text(data.str);
		  })
	  }
  }

  function emailCheck(email){
	  if(email==''){
		  alert("email를 입력하세요");
		  document.frm.email.focus();
	  }else{
		  var url = "emailcheck";
		  url += "?email="+email;

		  $.get(url, function(data, textStatus) {

			  $("#emailcheck").text(data.str);

		  })
	  }
  }

        $(document).ready(function(){
            var idcheck_clicked = 0;
        $("#idcheck_btn").click(function(){ idcheck_clicked++ });
        $("#submit").click(function(){
            if (idcheck_clicked <= 0){
                alert('아이디 중복 확인 버튼을 클릭해 주세요');
                return false;
            }
        });
    });

    function inCheck(f){
    	if(f.id.value.length==0){
    		alert("아이디를 입력하세요");
    		f.id.focus();
    		return false;
    	}
    	if(f.passwd.value.length==0){
    		alert("비밀번호를 입력하세요");
    		f.passwd.focus();
    		return false;
    	}
    	if(f.repasswd.value.length==0){
    		alert("비밀번호 확인을 입력하세요");
    		f.repasswd.focus();
    		return false;
    	}
    	if(f.passwd.value != f.repasswd.value){
    		alert("비밀번호가 일치하지 않습니다.");
    		f.passwd.value="";
    		f.repasswd.value="";
    		f.passwd.focus();
    		return false;
    	}

    	if(f.mname.value.length==0){
    		alert("이름을 입력하세요");
    		f.mname.focus();
    		return false;
    	}

    	if(f.fnameMF.value.length==0){
    		alert("운전면허증 사진을 업로드 해주세요.");
    		f.fnameMF.focus();
    		return false;
    	}

    	if(f.license.value.length==0){
    		alert("확인버튼을 눌러주세요");
    		f.license.focus();
    		return false;
    	}
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
	<div class="mb-4">
       <h1><strong>회원가입</strong></h1>
       <p style="font-size:20px;">( <span id="need">*</span> 필수입력사항)</p><br><br>
     </div>

  <form class="form-horizontal"
        action="create"
        method="post"
        name = 'frm'
        onsubmit="return inCheck(this)"
        >

<!--  주민등록번호 ocr한 값 -->
    <input type="hidden" name="jumin" id="jumin"  value="">
    <input type="hidden" name="license" id="license1"  value="">

	<div class="info">
      <label class="control-label col-sm-2" for="id"><span id="need">*</span>아이디</label>
      <div>
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요"
        name="id">
        <button type="button" class="cre_btn" id="idcheck_btn"
                onclick="idCheck(document.frm.id.value)">아이디 중복 확인</button>
                 <label id="idcheck"></label><br>
      </div>
    </div>

	<div class="info">
      <label class="control-label col-sm-2" for="passwd"><span id="need">*</span>비밀번호</label>
      <div class="col-sm-4">
        <input type="password" class="form-control" id="passwd"
        placeholder="비밀번호를 입력하세요"  name="passwd">
      </div>
    </div>
	<div class="info">
      <label class="control-label col-sm-2" for="repasswd"><span id="need">*</span>비밀번호 확인</label>
      <div class="col-sm-4">
        <input type="password" class="form-control" id="repasswd"
        placeholder="확인을 위해 한 번 더 입력해 주세요."  name="repasswd"><br>
      </div>
    </div>

    	<div class="info">
      <br><label class="control-label col-sm-2" for="mname"><span id="need">*</span>이름</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="mname"
        placeholder="이름을 입력하세요."  name="mname">
      </div>
    </div>
	<div class="info">
      <br><label class="control-label col-sm-2" for="phone"><span id="need">*</span>핸드폰 번호</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="phone"
        placeholder="전화번호를 입력하세요."  name="phone"><br>
      </div>
    </div>

	<div class="info">
      <br><label class="control-label col-sm-2" for="fnameMF"><span id="need">*</span>운전면허증 사진</label>
      <label id="need2">* 파일을 선택하신 후 확인 버튼을 눌러주세요. * </label><br>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="fnameMF"
         accept=".jpg,.gif,.png">
     <button type="button" class="cre_btn" id="licInfo_btn" onclick="licInfo(document.frm.fnameMF.value)">확인</button>
        <label id="need">* 1MB이하의 파일만 업로드 해주세요. </label><br><br>
      </div>
    </div>

	<div class="info">
      <label class="control-label col-sm-2" for="license"><span id="need">*</span>운전면허번호</label>
            <label id="need2">* 입력된 면허번호가 일치하면 면허번호 확인 버튼을 눌러주세요 * </label><br>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="license2" >
         <button type="button" class="cre_btn" id="jumin_btn" onclick="juminCheck(document.frm.jumin.value)">면허번호 확인</button>
          <label id="jumincheck"></label>
      </div>
    </div>

	<div class="info">
      <label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
      <div class="col-sm-3">
        <input type="email" class="form-control" id="email"
        placeholder="Enter email"  name="email">
        <button type="button" class="cre_btn"
      onclick="emailCheck(document.frm.email.value)">이메일 중복 확인</button>
      <div id="emailcheck"></div><br>
      </div>
    </div>

	<div class="info">
      <label class="control-label col-sm-2" for="sample6_postcode">- 우편번호</label>

      <button type="button" class="cre_btn2"
      onclick="sample6_execDaumPostcode()">주소 검색</button>
      <div class="col-sm-1"><br>
        <input type="text" class="form-control"
         name="zipcode" id="sample6_postcode" placeholder="우편번호">
      </div>
    </div>
	<div class="info">
      <label class="control-label col-sm-2" for="sample6_address"> 주소</label><br>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="sample6_address" placeholder="주소"
         name="address1">
        <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소"
         name="address2">
      </div>
    </div>

    <div>
      <div align="center">
      <br><br><br>
        <button type="submit" class="agreebtn">등록</button><br>
        <button class="btn_2" onclick="history.back()">취소</button>
      </div>
    </div>

  </form>

</div>
</div>
</body>
</html>