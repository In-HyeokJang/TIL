<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <title>차량정보 조회</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">

          function optupdate() {
            let windowObjectReference;
            let windowFeatures = "left=100, top=100, width=320, height=900, width=640";
            windowObjectReference = window.open("/carinfo/optupdate/${carnumber}", "mozillaTab", windowFeatures);


          }

        </script>
        <style>
          .layout {
            display: flex;
            justify-content: center;

          }

          .carinfocolor {
            background: #F8F8F8;
            align-items: center;
          }

          .carname {
            font-weight: 600;
            font-size: 3.75rem;
            margin: -200px 861px 0 -190px;
            font-family: Raleway, sans-serif !important;
            margin-left: 110px;
          }

          .carinfo {
            display: flex;
            justify-content: center;
            line-height: 2;
            font-weight: 700;
            font-size: 1.8rem;
            margin: -80px 13px 150px 13px;
            font-family: Roboto, sans-serif !important;
            margin-left: 770px;
          }

          .img {
            display: flex;
            justify-content: center;
            margin-left: 350px;
          }

          .button {
            display: flex;
            justify-content: center;
            margin-top: 7%;
          }

          .Abtn {
            display: flex;
            justify-content: center;
          }

          .res {
            border-style: solid;
            border-radius: 23px !important;
            border-color: #000000 !important;
            color: #000000 !important;
            background-color: transparent !important;
            margin-left: 500px;
          }

          .option {
            background-color: rgb(228, 248, 246);
            text-align: center;
            font-size: 1.6rem;
            border-style: solid;
            border-radius: 23px !important;
            border-color: #000000 !important;
            color: #000000 !important;
          }

          .option>span.on {
            color: #000000;
            border-color: #63a1ff;
            background-color: #fff;
            border-style: solid;
            border-radius: 10px !important;
            border-color: #000000 !important;
          }
          .option>span.off{
            color: #000000;
            
          }
        </style>


      </head>

      <body>

        <div class="container">
          <div class="layout">
            <div>
              <div class="carinfocolor">
                <img class="img" src="${dto.carimage}" style="width:400px;" , height="260px;" >

                <h2 class="carname">${dto.carname}</h2>

                <h3 class="carinfo">
                  🚗${dto.carnumber}<br>
                  🙍‍♂${dto.carseate} | 🚩${dto.carpoint} | 🚙${dto.category}<br>
                  🧭${dto.caryearmodel}<br>
                  <!-- 💲(시간당)${dto.rentcost}<br> -->

                </h3>
              </div>
              <div class="option">
              <h3> C a r O p t i o n </h3>
                <br>
                <c:choose>
                  <c:when test="${empty dto.cdto.bluetooth}">블루투스</c:when>
                  <c:otherwise> <span class="on">${dto.cdto.bluetooth}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_sensor}">후방센서 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_sensor}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_camera}">후방카메라 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_camera}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.black_box}">블랙박스 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.black_box}</span>
                  </c:otherwise>
                </c:choose>

                <br><br>

                <c:choose>
                  <c:when test="${empty dto.cdto.heated_seat}">열선시트</c:when>
                  <c:otherwise> <span class="on">${dto.cdto.heated_seat}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.heated_handle}">열선핸들</c:when>
                  <c:otherwise> <span class="on">${dto.cdto.heated_handle}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.ventilated_seat}">통풍시트 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.ventilated_seat}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.navigation}">네비게이션 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.navigation}</span> </c:otherwise>
                </c:choose>


                <br><br>

                <c:choose>
                  <c:when test="${empty dto.cdto.non_smoking_vehicle}">금연차량 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.non_smoking_vehicle}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.smart_key}">스마트키 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.smart_key}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.sunroof}"> 썬루프</c:when>
                  <c:otherwise> <span class="on">${dto.cdto.sunroof}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_warning_light}"> 후방경고등</c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_warning_light}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.lane_departure_prevention}">차선방지이탈 </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.lane_departure_prevention}</span> </c:otherwise>
                </c:choose>



              </div>
              <!-- 수정 / 사진수정 버튼은 유저한테 안보이게 해야함 -->
              <p class="button">
              <div>
                <a class="res" href="#">RESERVATION</a>
              </div>
              <div class="Abtn">
                <button>
                  <a href="/carinfo/update/${dto.carnumber}">정보 수정</a></button>
                <button onclick="optupdate()">옵션 수정</button>
                <button>
                  <a href="/carinfo/updateFile/${dto.carnumber}">사진 수정</a></button>
                <button>
                  <a href="javascript:history.back()">
                    뒤로</a></button>
              </div>
              </p>
            </div>
          </div>
        </div>
      </body>

      </html>