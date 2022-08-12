<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="util" uri="/ELFunctions" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>Bootstrap Example</title>
                    <meta charset="utf-8">
                    <link rel="stylesheet" type="text/css" href="/css/support/style.css">

                </head>


                <body>
                    <div class="container">
                        <form class="form-inline" action="/request/list">
                            <div class="form-group">
                                <select class="form-control" name="col">
                                    <option <c:if test="${col=='carnum'}"> selected </c:if>
                                        >차량번호</option>

                                    <option <c:if test="${col=='state'}"> selected </c:if>
                                        >상태</option>

                                    <option <c:if test="${col=='total'}"> selected </c:if>
                                        >전체출력</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter 검색어" name="word"
                                    value="${word}">
                            </div>
                            <div style="left: 0px;">
                                <button type="submit" class="btn btn-default">검색</button>
                                <button class="btn btn-default" onclick="createwindow();">등록</button>
                            </div>
                        </form>
                    </div>

                    <div class=table>
                        <table class="styled-table">
                            <thead>
                                <tr>
                                    <th>Car Number</th>
                                    <th>요청위치 - x</th>
                                    <th>요청위치 - y</th>
                                    <th>사유</th>
                                    <th>상태</th>
                                    <th>지원차량</th>
                                    <th>지원</th>
                                    <th>취소</th>
                                    <th>작업 완료</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty list}">
                                        <tr>
                                            <td colspan="6">등록된 글이 없습니다.</td>
                                    </c:when>
                                    <c:otherwise>

                                        <c:forEach var="dto" items="${list}">

                                            <tr class="active-row" style="text-align:center;">
                                                <td>${dto.carinfo_carnum}</td>
                                                <td>${dto.rx}</a></td>
                                                <td>${dto.ry}</td>
                                                <td>${dto.reason}</td>
                                                <td>${dto.state}</td>
                                                <td>${dto.supporter_carnum}</td>
                                                <td><a onclick="createwindow(`${dto.carinfo_carnum}`);"> accept</td>
                                                <td><a onclick="delete_help(`${dto.carinfo_carnum}`)"> ❌ </td>
                                                <td><a onclick="complete_help(`${dto.carinfo_carnum}`)"> ✔ </td>
                                            </tr>

                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        ${paging}
                    </div>
                    </div>

                    <script>

                        function createwindow(carnum) {
                            let windowObjectReference;
                            let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
                            windowObjectReference = window.open("/user/request/supporter?carnum=" + carnum, "mozillaTab", windowFeatures);

                        }

                        function delete_help(carnum) {
                            alert("요청을 취소 하시겠습니까?")
                            var url = `/user/request/help/delete/` + carnum;

                            let response = fetch(url)
                                .then((res) => {
                                    if (res.status == 200) {
                                        alert("삭제하였습니다.");
                                        location.reload();
                                    }
                                });
                        }

                        function complete_help(carnum) {
                            alert("요청을 처리 하시셨습니까?")
                            var url = `/user/request/help/complete/` + carnum;
                            let response = fetch(url)
                                .then((res) => {
                                    if (res.status == 200) {
                                        alert("삭제하였습니다.");
                                        location.reload();
                                    }
                                });
                        }
                    </script>

                </body>

                </html>