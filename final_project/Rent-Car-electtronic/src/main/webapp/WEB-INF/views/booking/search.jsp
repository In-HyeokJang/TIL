<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/booking.css">
<script type="text/JavaScript">
</script>
</head>
<body>
    <div class="container">
    <h2 class="contents_title">차량 선택</h2>
        <form action="./detail">
        <table id="keywords" cellspacing="0" cellpadding="0">
            <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="5">예약 가능한 차량이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="dto" items="${list}">
                            <tr>
								<td>${dto.category}</td>
								<td>  ${dto.carname}</td>
								<td>  ${dto.carseate}</a>
								<td>  ${dto.rentcost}</td>
								<td>
                                    <c:set var="carnumber" value="${dto.carnumber}" />
                                    <%
                                        String carnumber = (String)pageContext.getAttribute("carnumber");
                                    %>
                                    <script>
                                        var carnumber = "<%=carnumber%>";
                                            console.log(carnumber);
                                            function clickBtn() {
                                                let url = "../detail/" + carnumber;
                                                location.href=url;
                                            }
                                    </script>
                                    <div class="kf_flightInner">
                                        <button type="button" class="k1_btn_price_search2 btnDefault" onclick="clickBtn()">예약</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </div>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        </form>
    </div>
</body>
</html>