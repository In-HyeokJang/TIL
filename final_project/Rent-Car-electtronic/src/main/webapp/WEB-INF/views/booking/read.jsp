<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/booking.css">
  <link rel="stylesheet" href="/css/style.css">
  <script type="text/javascript">

  </script>
</head>
<body>
<div class="container">
    <h2 class="contents_title">예약 정보</h2>
    <table id="keywords" cellspacing="0" cellpadding="0">
        <tr>
            <th><span>예약자</span></th>
            <td>${dto.user_id }</td>
        </tr>
        <tr>
            <th><span>인수일/시간</span></th>
            <td>${dto.rent_day }  ${dto.rent_time }</td>
        </tr>
        <tr>
            <th><span>반납일/시간</span></th>
            <td>${dto.return_day }  ${dto.return_time }</td>
        </tr>
        <tr>
            <th><span>예약차량</span></th>
            <td>${dto.reserved_car }</td>
        </tr>
        <tr>
            <th><span>보험종류</span></th>
            <td>${dto.insurance }</td>
        </tr>
    </table>
    <a href="javascript:update()">수정</a>
    <a href="javascript:delete()">취소</a>
    <a href="javascript:history.back()">뒤로</a>
</div>
</body>
</html>