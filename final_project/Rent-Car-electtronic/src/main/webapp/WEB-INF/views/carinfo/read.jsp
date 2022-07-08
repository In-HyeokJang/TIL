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

</head>
<body>

<div class="container">
  <div class="row">
  <div class="col-sm-3">
  <h4><img src="/svg/box2-heart.svg"> 차 정보</h4>
  <img class="img-rounded" src="/contents/storage/${dto.carimage}" style="width:250px">
  </div>
  <div class="col-sm-6">
  <h4><img src="/svg/rulers.svg"> 차 정보</h4>
  <ul class="list-group">

    <li class="list-group-item">차 이름 : ${dto.carname }
    <li class="list-group-item">차 번호 : ${dto.carnumber }
    <li class="list-group-item">차 종 : ${dto.category }
    <li class="list-group-item">차 좌석 : ${dto.carseate }
    <li class="list-group-item">차 지점위치 : ${dto.carpoint }
  	<li class="list-group-item">밑에 추가적인 차량세부정보 등록해야함

  	<td> <a href="./update/${dto.carnumber }">
          <span class="glyphicon glyphicon-edit"></span>
        </a>
        /
        <a href="./delete/${dto.carnumber }">
          <span class="glyphicon glyphicon-trash"></span>
        </a>
        /
        <a href="./updateFile/${dto.carnumber }/${dto.carimage}">
          <span class="glyphicon glyphicon-picture"></span>
        </a>
    </td>
  <a href="javascript:history.back()">
        <img class='btn' src="/svg/arrow-return-left.svg"/>뒤로</a>
  </ul>
  </div>
  </div>
</div>
</body>
</html>