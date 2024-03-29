<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>

    <!DOCTYPE html>
     <html lang="en">

    <head>
      <title>상품메인페이지</title>
      <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/common.css">
      <script type="text/javascript">

        function del(carnumber) {
          if (confirm("정말삭제하시겠습니까?")) {
            let url = "/admin/carinfo/delete/" + carnumber;
            location.href = url;
          }
        }

        function createwindow() {
          let windowObjectReference;
          let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
          windowObjectReference = window.open("/admin/carinfo/create", "mozillaTab", windowFeatures);
        }

      </script>
      <style>
        #row {
          display: flex;
          justify-content: center;
        }
        .search {
          display: flex;
          justify-content: center;
          margin-bottom: 10px;
          margin-top: 10px;
        }
        .carlist {
          margin-left: 40%;
        }
        .col-sm-3 {
          justify-content: center;
          margin: 15px;
          font-size: 1.6rem;
        }
        .check{
          background-color: skyblue;
          color: black;
        }
        .control{
        height: auto;
            border: 1px solid #bfc9d4;
            color: #3b3f5c;
            letter-spacing: 1px;
            padding: 0.35rem 1.25rem;
            border-radius: 6px;
            }
            .create{
            margin-left: 10px;
            }
      </style>
    </head>
    <body>

      <div class="container">
        <div class="carlist">
          <h2>C A R S L I S T</h2>
        </div>
        <div class="search">
          <div class="search1">
            <form class="form-inline" action="./list">
              <div class="form-group">
                <select class="control" name="col">
                <option value="category" <c:if test="${col=='category'}"> selected </c:if>>차 종</option>
                  <option value="carname" <c:if test="${col=='carname'}"> selected </c:if>>차이름</option>

                  <option value="total" <c:if test="${col=='total'}"> selected </c:if>>
                    전체출력</option>
                </select>
              </div>
          </div>
          <!--search1 end div-->
          <div class="form-group">
            <input type="text" class="control" placeholder="Enter Category" name="word" value="${word}">


          <button type="submit" class="btn btn-default">검색</button>

          <c:if test="${sessionScope.grade == 'A'}">
          <button class="btn btn-defaul" onclick="createwindow()">Car Create</button>
          </c:if>
</div>
          </form>

        </div>
        <!--search end div-->
        <c:choose>
          <c:when test="${empty list}">
            <div class="row">
              <h2>차량 준비중 입니다.</h2>
            </div>
          </c:when>

          <c:otherwise>
            <div class="row" id="row">
              <c:forEach var="dto" items="${list}">
                <div class="col-sm-3">
                  <h1> ${dto.carname }</h1>

                  <a href="/user/carinfo/read/${dto.carnumber}" class="btn btn-defaul">
                     <img src="/carinfo/storage/${dto.carimage}" class="img-thumbnail" width="350" height="300"></a>

                  <p><b>차 번호 : ${dto.carnumber}</b><br>
                    <b>${dto.category} | ${dto.carseate }</b> | <b>${dto.caryearmodel}</b><br>
                    <b>차 위치 : ${dto.carpoint}</b><br>
                    <b>차 렌트비용(시간당) : ${dto.rentcost}\</b>
                  </p>
                  
                  <c:if test="${sessionScope.grade == 'A'}">

                  <a href="javascript:del('${dto.carnumber}')" class="btn btn-defaul">Car Delete
                  </a>
                </c:if>
                </div>

              </c:forEach>
            </div>

          </c:otherwise>
        </c:choose>
      
      <div>
        ${paging}
      </div>

    </div>
    </body>

    </html>