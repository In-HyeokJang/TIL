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
      <script type="text/javascript">

        function del(carnumber) {
          if (confirm("정말삭제하시겠습니까?")) {
            let url = "delete/" + carnumber;
            location.href = url;
          }
        }

        function createwindow() {
          let windowObjectReference;
          let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
          windowObjectReference = window.open("./create", "mozillaTab", windowFeatures);
        }

        // function update() {
        //                   let windowObjectReference;
        //                   let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
        //                   windowObjectReference = window.open("./update/${dto.carnumber}", "mozillaTab", windowFeatures);
        //                 }

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
          margin-left: 45%;
        }
        .col-sm-3 {
          justify-content: center;
          margin: 15px;
        }
        .check{
          background-color: skyblue;
          color: black;
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
                <select class="form-control" name="col">
                <option value="carnumber" <c:if test="${col=='carnumber'}"> selected </c:if>>차번호</option>
                  <option value="carname" <c:if test="${col=='carname'}"> selected </c:if>>차이름</option>

                  <option value="total" <c:if test="${col=='total'}"> selected </c:if>>
                    전체출력</option>
                </select>
              </div>
          </div>
          <!--search1 end div-->
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
          </div>
          <button type="submit" class="check">검색</button>
          <!-- car create 버튼 나중에 유저는 안보이게 하고 관리자만 볼 수 있게 수정 필요 -->
          <button onclick="createwindow()">Car Create</button>
          
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
                  <h2> ${dto.carname }</h2>

                  <a href="/carinfo/read/${dto.carnumber}">
                    <img src="/carinfo/storage/${dto.carimage}" class="img-thumbnail" width="300" height="280"></a>
                  <p><b>차 번호 : ${dto.carnumber}</b><br>
                    <b>${dto.category} | ${dto.carseate }</b> | <b>${dto.caryearmodel}</b><br>
                    <b>차 위치 : ${dto.carpoint}</b><br>
                    <b>차 렌트비용 : ${dto.carprice}</b>

                    <!-- 나중에 수정/삭제는 유저한테 안보이게 처리 해야함 -->
                  </p><button>
                  <a href="./update/${dto.carnumber}">Car Info Update
                    <span class="glyphicon glyphicon-edit"></span>
                  </a></button>


                  <button>
                  <a href="javascript:del('${dto.carnumber}')">Car Delete
                    <span class="glyphicon glyphicon-trash"></span>
                  </a></button>

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