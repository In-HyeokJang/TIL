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
                        <form class="form-inline">
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
                            <div style="position: relative; bottom: 10px;">
                                <button type="submit" style="" class="btn btn-default">검색</button>
                                <button onclick="createwindow();" class="btn btn-default">등록</button>
                            </div>
                        </form>
                    </div>

                    <div class=table>
                        <table class="styled-table">
                            <thead>
                                <tr>
                                    <th>차량번호</th>
                                    <th>등록일</th>
                                    <th>생산일</th>
                                    <th>브렌드</th>
                                    <th>모델</th>

                                    <th>dccombo</th>
                                    <th>dcdemo</th>
                                    <th>ac</th>
                                    <th>fullcharge</th>

                                    <th>상태</th>
                                    <th>비고</th>
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
                                                <td>${dto.registed}</td>
                                                <td>${dto.production}</td>

                                                <td>${dto.brand}</td>
                                                <td>${dto.model}</td>

                                                <td>${dto.dccombo}</td>
                                                <td>${dto.dcdemo}</td>
                                                <td>${dto.ac}</td>
                                                <td>${dto.fullcharge}</td>

                                                <td>${dto.state}</td>
                                                <td><a onclick="deletefun(`${dto.carnum}`)"> 폐차</td>
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

                    <script type="text/javascript">
                        function deletefun(carnum) {
                            alert(carnum + " 차량을 삭제 하시겠습니까?")

                            let response = fetch(`./delete/` + encodeURI(encodeURIComponent(carnum)))
                            .then((res) => {if(res.status==200){
                                alert("삭제하였습니다.");
                                location.reload();
                            }});
                            
                        }

                        function createwindow() {
                            let windowObjectReference;
                            let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
                            windowObjectReference = window.open("./create", "mozillaTab", windowFeatures);

                        }
                    </script>
                </body>

                </html>