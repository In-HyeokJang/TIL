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
                        <form class="form-inline" action="/admin/support/list">
                            <div class="form-group">
                                <select class="my-select-menu" name="col">
                                    <option <c:if test="${col=='carnum'}"> selected </c:if>
                                        >차량번호</option>

                                    <option <c:if test="${col=='state'}"> selected </c:if>
                                        >상태</option>

                                    <option <c:if test="${col=='total'}"> selected </c:if>
                                        >전체출력</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
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
                                    <th>CARNUM</th>
                                    <th>DC Combo</th>
                                    <th>DC Demo</th>
                                    <th>AC</th>
                                    <th>Full Charge</th>
                                    <th>STATE</th>
                                    <th>선택</th>
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

                                            <tr class="active-row">
                                                <td>${dto.carnum}</td>
                                                <td>${dto.dccombo}</td>
                                                <td>${dto.dcdemo}</td>
                                                <td>${dto.ac}</td>
                                                <td>${dto.fullcharge}</td>
                                                <td>${dto.state}</td>
                                                <td><a onclick="accept(`${dto.carnum}`)"> ⭕</td>
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
                        async function accept(supporter){
                            var url = new URL(window.location.href);
                            const urlParams = url.searchParams;
                            var carnum = urlParams.get('carnum');
                            var new_url = "/user/request/help/accept?carnum=" + carnum;
                            new_url += "&supporter=" + supporter;
                            let response = await fetch(new_url);
                            
                            if(response.ok){
                                alert("등록되었습니다.")
                                window.close();
                                window.location.reload();
                            }else{
                                alert("HTTP-Error: " + response.status);
                            }
                        }
                    </script>
                </body>

                </html>