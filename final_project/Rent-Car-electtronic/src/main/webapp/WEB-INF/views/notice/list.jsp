<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="util" uri="/ELFunctions" %>
        <!DOCTYPE html>
        <html>

          <head>
            <meta charset="utf-8">
            <script src="https://code.jquery.com/jquery-latest.min.js"></script>
            <link rel="stylesheet" type="text/css" href="/css/list/list.css" />
            <style>
              .pagination{
                justify-content: center;
                display: flex;
              }
              .pagination .active{
                width: 20px;
              }
            </style>
          </head>

        <body>
          <div class="container">

            <h1 class="col-sm-offset-2 col-sm-10">공지사항</h1>
            
            <form class="form-inline" action="/user/notice/list">
              <div class="form-group">
                <select class="control" name="col">
                  <option value="wname" <c:if test="${col=='wname'}"> selected </c:if>
                    >성명</option>
                  <option value="title" <c:if test="${col=='title'}"> selected </c:if>
                    >제목</option>
                  <option value="content" <c:if test="${col=='content'}"> selected </c:if>
                    >내용</option>
                  <option value="title_content" <c:if test="${col=='title_content'}"> selected</c:if>
                    >제목+내용</option>
                  <option value="total" <c:if test="${col=='total'}"> selected </c:if>
                    >전체출력</option>
                </select>
                
                <input type="text" class="control" placeholder="Enter 검색어" id="word" name="word" value="${word}">

                <button class="btn btn-default">검색</button>
                <c:if test="${sessionScope.id=='admin'}">
                 <button type="button" class="btn btn-default" onclick="location.href='/admin/notice/create'">등록
                </button>
                </c:if>
              </div>
            </form>

            <table class="table table-striped" style=" width: 1200px;">

              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록날짜</th>
                  <th>첨부파일</th>
                </tr>
              </thead>

              <tbody class="tbody">

                <c:choose>
                  <c:when test="${empty list}">
                    <br>
                    <tr>
                      <td colspan="6"><br>등록된 글이 없습니다.</td>
                    </tr>
                  </c:when>

                  <c:otherwise>
                    <c:forEach var="dto" items="${list}">

                      <tr>
                        <td>${dto.noticeno}</td>
                        <td>
                          <a href="javascript:read('${dto.noticeno}')">${dto.title}</a>


                          <c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
                            <img src="/images/icons/new.gif">
                          </c:if>
                        </td>
                        <td>${dto.wname}</td>
                        <td>${dto.wdate}</td>
                        <td>
                          <c:choose>
                            <c:when test="${empty dto.fname}">파일없음</c:when>
                            <c:otherwise>
                              <a href="javascript:fileDown('${dto.noticeno}','${dto.key}')">
                                ${dto.fname}
                              </a>
                            </c:otherwise>
                          </c:choose>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>

              </tbody>
            </table>

            <div>
              ${paging}
            </div>

          </div>


          <script type="text/javascript">

            function read(noticeno) {
              var url = "/notice/read";
              url += "?noticeno=" + noticeno;
              url += "&col=${col}";
              url += "&word=${word}";
              url += "&nowPage=${nowPage}";
              location.href = url;
            }

            function fileDown(noticeno, key) {
              var url = "./fileDown";
              url += "?noticeno=" + noticeno;
              url += "&key=" + key;
              alert(url);
              location.href = url;
            }

          </script>
        </body>

        </html>