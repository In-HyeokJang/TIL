<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>차량정보 조회</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
<style>
  .layout{
    display: flex;
    justify-content: center;
  }

  .carinfo{
    display: flex;
    justify-content: center;
  }
  .carname {
    font-weight: 700;
    font-size: 3.75rem;
    margin: -200px 861px 0 -19px;
    font-family: Raleway, sans-serif !important;
}
.carinfo {
  line-height: 2;
    font-weight: 700;
    font-size: 1.5rem;
    margin: -150px -13px 0 850px;
    font-family: Roboto,sans-serif !important;
}
.img{
  display: flex;
    justify-content: center;
    margin-left: 300px;
}
.button{
  display: flex;
    justify-content: center;
    margin-top:35%;
}
.button1{
  display: flex;
    justify-content: center;
}
.res{
  border-style: solid;
  border-radius: 23px !important;
  border-color: #000000 !important;
    color: #000000 !important;
    background-color: transparent !important;
  border-width: 3px;
  letter-spacing: 2px;
}
</style>


</head>
<body>

<div class="container">
  <div class="layout">
  <div class="col-sm-3">

  <img class="img" src="/carinfo/storage/${dto.carimage}"
   style="width:522px;", height="323px;", margin="90px auto 0 299px">
   <h2 class="carname">${dto.carname}</h2>
   <p class="carinfo">
    ${dto.carnumber}<br>
    ${dto.carseate} | ${dto.carpoint} | ${dto.category}<br>
    ${dto.caryearmodel}<br>
    ${dto.carprice}<br>
   </p>
   <!-- 수정 / 사진수정 버튼은 유저한테 안보이게 해야함 -->
   <P class="button">
    <button>
   <a href="/carinfo/update/${dto.carnumber }">수정</a></button>
   <button>
    <a href="/carinfo/updateFile/${dto.carnumber }/${dto.carimage}">사진 수정</a></button>
  </P>
    <p class="button1">
      <a class="res" href="javscropt:history.back()">RESERVATION<a></a>
    <button>
    <a href="javascript:history.back()">
      <img class='btn' />뒤로</a></p></button>
  </div>
  </div>
  </div>  
</body>
</html>