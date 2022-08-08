<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <title>회원정보변경 | 제주패스</title>
  <!-- Google Tag Manager -->
<script>
var gtmId = location.href.startsWith('https://d') ? 'GTM-P9NT8ML' : 'GTM-KXVKM3C';
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer', gtmId);
</script>
<script>
window.dataLayer = window.dataLayer || [];
</script>



<link href="https://static-www.jejupass.com/resource/PC/css/p_common.min.css?v1" rel="stylesheet" type="text/css">
<link href="https://static-www.jejupass.com/resource/PC/css/p_contents.min.css?v1" rel="stylesheet" type="text/css">

  <!-- 컨텐츠페이지의 CSS 영역이 들어감 -->

  <!-- 컨텐츠페이지의 스크립트 영역이 들어감 -->
</head>

<body class="wrapper lnbWrapper">



<p class="skip"><a href="#container">본문 바로가기</a></p>

<section id="wrapper">


  <div id="container" class="container">


    <div id="contents" class="contents">
      <!-- 컨텐츠 영역  -->
      <h2 class="titDep2 titLine type01">회원정보변경</h2>
      <div class="grayBox withBtn">
        <p class="txt">가입 시 입력한 회원정보를 다시 한번 확인해주세요.</p>
      </div>
      <div class="photoArea">
				<span class="fileView inpFrm">
					<input type="file" id="inpPhoto" inpPhoto>
					<label for="inpPhoto">
						사진 선택
						<figure><img src="/resource/PC/images/mypage/@profile_x100.png" id="pic" alt="" profileImg style="width: 100%; height: 100%;"></figure>
					</label>
				</span>
      </div>
      <fieldset class="editFrm">
        <legend>회원정보변경 정보입력</legend>
        <div class="inpFrm">
          <label for="inpId" class="titLab">아이디</label>
          <span class="inpA">
            <input type="text" id="inpId" placeholder="" title="" readonly >
          </span>
        </div>
        <div class="inpFrm">
          <label for="inpName" class="titLab">이름</label>
          <span class="inpA">
            <input type="text" id="inpName" placeholder="" title="" readonly >
          </span>
        </div>

        <div class="inpFrm">
          <label for="inpNum" class="titLab">휴대전화</label>
          <span class="inpA">
            <input type="text" id="inpNum" placeholder="" title="" readonly>
          </span>
        </div>

            <div class="inpFrm">
          <label for="inpNum" class="titLab">이메일</label>
          <span class="inpA">
            <input type="text" id="inpNum" placeholder="" title="" readonly>
          </span>
        </div>




      </fieldset>
      <div class="btnArea">
        <button type="button" class="btnDefault btnL action" btnModify>변경</button>
      </div>

      <form name="signForm">
        <input type="hidden" id="userName" name="userName" value="">
        <input type="hidden" id="userPhone" name="userPhone" value="">
        <input type="hidden" id="userBirthday" name="userBirthday" value="">
        <input type="hidden" id="userCi" name="userCi" value="4CR16CLA+2u80CWdlOrErkJ3IyNRXLKpUHaq9ug0zy2/7Dc+bLTDl2YbNDCbzl4l+zEfCbnhQs5X1QimYoX49g==">
      </form>
      <!-- //컨텐츠 영역 -->
    </div>
  </div>



</section><!-- //wrapper -->


</body>
</html>