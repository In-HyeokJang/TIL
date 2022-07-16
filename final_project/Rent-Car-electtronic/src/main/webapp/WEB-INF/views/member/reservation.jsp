
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
<style>
	* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:1200px;margin:0 auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}

	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	/* input에 체크되면 텍스트 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}

	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
	</style>
</head>

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
                 <button type="button" class="btnDefault btnS btnLineG" onclick="jppJs.go('/update')">나의 정보</button>
                </div>
            </div>

           <div class="txtArea">
             <div id="carnameTOP">
                    <h2 class="titDep2 name" profileLinkArea> <br><span>${dto1.carname}</span> </h2>
             </div>






             <div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">

		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<a>
					  <img src="https://img.khan.co.kr/news/2021/12/21/l_2021122101002713000235791.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<img src="https://img.khan.co.kr/news/2021/12/21/l_2021122101002713000235791.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					  <img src="https://img.khan.co.kr/news/2021/12/21/l_2021122101002713000235791.jpg">
				</a>
			</li class="slideitem">

			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>

		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>


</div>









              <table class="table table-bordered" style="font-size: 100px">
            <tr>

                <th class="col-sm-2">차 종</th>
                <td class="col-sm-8">${dto1.carname}</td>
            </tr>
            <tr>
                <th class="col-sm-2">차 번호</th>
                <td class="col-sm-8">${dto1.carnumber}</td>
            </tr>
            <tr>
                <th class="col-sm-2">승차인원</th>
                <td class="col-sm-8">${dto1.carseate}</td>
            </tr>
            <tr>
                <th class="col-sm-2"></th>
                <td class="col-sm-8">${dto1.carname}</td>
            </tr>
            <tr>
                <th class="col-sm-2"></th>
                <td class="col-sm-8">${dto1.carname}</td>
            </tr>

            </table>

                  </div>


<link href="https://static-www.jejupass.com/resource/PC/css/p_common.min.css?v1" rel="stylesheet" type="text/css">
<link href="https://static-www.jejupass.com/resource/PC/css/p_contents.min.css?v1" rel="stylesheet" type="text/css">
<div class="dimmed"></div>
</body>
</html>