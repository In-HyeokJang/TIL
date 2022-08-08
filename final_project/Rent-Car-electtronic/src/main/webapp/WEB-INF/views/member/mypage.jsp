<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
  <script>
  function reservation(){
  href = "/reservation"

  }
  </script>
  <style>
    .container {
      width: 900px;
      margin: 0 auto;
      position: relative;
    }
    </style>
</head>
<body>
<body class="wrapper lnbWrapper">
<p class="skip"><a href="#container">본문 바로가기</a></p>

<section id="wrapper">



  <div id="container" class="container">


    <div id="contents" class="contents">
            <!-- 컨텐츠 영역  -->
            <div class="mainTop" profileMemberInfoArea>
                <a href="/web/signup/pass/usermodify" class="imgArea">
                    <div><img src="/resource/PC/images/mypage/img_profile_big.png" alt=""></div>
                </a>
                <div class="txtArea">
                    <h2 class="titDep2 name" profileLinkArea> ${dto.mname}님의<br><span>회원정보</span> </h2>
                </div>

                <div class="btnArea">
                    <button type="button" class="btnDefault btnS btnLineG" onclick="location.href='/user/update'">회원수정</button>
                   <button type="button" class="btnDefault btnS btnLineG" onclick="reservation()"><a href="/member/reservation">예약 차량 조회</a></button>
                </div>
            </div>

           <div class="txtArea">
                    <h2 class="titDep2 name" profileLinkArea> <br><span></span> 나의 정보</h2>


              <table class="table table-bordered" style="font-size: 100px">

            <tr>


             <div class="contArea myPage">
                <div class="blueBox">
                    <div class="pointList">
                        <p><span class="txt">충전포인트</span><a href="" class="num" chargeSum>0p</a></p>
                        <p><span class="txt">적립포인트</span><a href="javascript:jppJs.go(&#39;/web/mypage/point&#39;)" class="num" saveSum>0p</a></p>
                    </div>
                </div>

                <th class="col-sm-2">아이디 :</th>
                <td class="col-sm-8">${dto.id}</td>
            </tr>
            <tr>
                <th class="col-sm-2">성명 :</th>
                <td class="col-sm-8">${dto.mname}</td>
            </tr>
            <tr>
                <th class="col-sm-2">전화번호 :</th>
                <td class="col-sm-8">${dto.phone}</td>
            </tr>
            <tr>
                <th class="col-sm-2">이메일 :</th>
                <td class="col-sm-8">${dto.email}</td>
            </tr>

            </table>

                  </div>



                <a href="#" class="bannerType">
                  <img src="https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-blue-sky-and-white-clouds-pure-sky-image_786707.jpg">
                </a>


                    </div>
                </div>

            </div>
            <!-- //컨텐츠 영역 -->
        </div>
  </div>



</section><!-- //wrapper -->






<link href="https://static-www.jejupass.com/resource/PC/css/p_common.min.css?v1" rel="stylesheet" type="text/css">
<link href="https://static-www.jejupass.com/resource/PC/css/p_contents.min.css?v1" rel="stylesheet" type="text/css">
<div class="dimmed"></div>
</body>
</html>