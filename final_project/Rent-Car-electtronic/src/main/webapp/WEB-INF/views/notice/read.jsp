<%@ page contentType="text/html; charset=UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <!DOCTYPE html>
                <html>

                <head>
                        <meta charset="utf-8">
                        <title>조회</title>
                        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

                        <script type="text/javascript">
                                function updateM() {
                                        var url = "/admin/notice/update";
                                        url += "?noticeno=${dto.noticeno}";
                                        location.href = url;
                                }
                                function deleteM() {
                                        var url = "./delete";
                                        url += "?noticeno=${dto.noticeno}";

                                        location.href = url;
                                }

                                function listM() {
                                        var url = "./list";
                                        url += "?nowPage=${param.nowPage}";
                                        url += "&col=${param.col}";
                                        url += "&word=${param.word}";
                                        location.href = url;
                                }

                                function fileDown(fname) {
                                        var url = "./fileDown";
                                        url += "?fname=" + fname;
                                        location.href = url;
                                }
                        </script>

                </head>

                <body>
                        <div class="container">

                                <h2>조회</h2>
                                <div class="panel panel-default">
                                        <div class="panel-heading">작성자</div>
                                        <div class="panel-body">${dto.wname}</div>

                                        <div class="panel-heading">제목</div>
                                        <div class="panel-body">${dto.title}</div>

                                        <div class="panel-heading">내용</div>
                                        <div class="panel-body">${dto.content}</div>

                                        <div class="panel-heading">첨부파일</div>
                                        <div class="panel-body">
                                                <c:choose>
                                                        <c:when test="${empty dto.fname}">파일없음</c:when>
                                                        <c:otherwise>
                                                                <a href="javascript:fileDown('${dto.fname}')">
                                                                        ${dto.fname}
                                                                </a>
                                                        </c:otherwise>
                                                </c:choose>
                                        </div>

                                        <div class="panel-heading">등록일</div>
                                        <div class="panel-body">${dto.wdate}</div>

                                </div>

                                <div>
                                        <button type="button" class="btn"
                                                onclick="location.href='${root}/admin/notice/create'">등록</button>
                                        <button type="button" class="btn" onclick="updateM()">수정</button>
                                        <button type="button" class="btn" onclick="deleteM()">삭제</button>
                                        <button type="button" class="btn" onclick="listM()">목록</button>
                                </div>

                        </div>
                </body>

                </html>