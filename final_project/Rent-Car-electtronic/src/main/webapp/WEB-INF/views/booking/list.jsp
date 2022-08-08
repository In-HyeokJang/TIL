<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/booking.css">
<script type="text/javascript">
	function read(booking_no) {
		var url = "read/" + booking_no;
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="contents_title">예약 현황</h2>
		<table id="keywords" cellspacing="0" cellpadding="0">
			<thead>
                <tr>
                    <th><span>번호</span></th>
                    <th><span>예약자</span></th>
                    <th><span>인수일/시간</span></th>
                    <th><span>반납일/시간</span></th>
                    <th><span>예약차량</span></th>
                    <th><span>보험종류</span></th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="3">등록된 예약이 없습니다.</td>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td>${dto.booking_no}</td>
                                <td><a href="javascript:read('${dto.booking_no}')">${dto.user_id}</td>
                                <td>${dto.rent_day}  ${dto.rent_time}</td>
                                <td>${dto.return_day}  ${dto.return_time}</td>
                                <td>${dto.reserved_car}</td>
                                <td>${dto.insurance}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
		</table>
	</div>
</body>
</html>