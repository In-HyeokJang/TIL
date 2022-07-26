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
          function optupdate(){
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

          .carname {
            font-weight: 600;
            font-size: 3.75rem;
            margin: -200px 861px 0 -190px;
            font-family: Raleway, sans-serif !important;
            margin-left: 100px;
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
            margin-top: 20%;
          }
          .Abtn{
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
        </style>


      </head>

      <body>

        <div class="container">
          <div class="layout">
            <div>

              <img class="img" src="/carinfo/storage/${dto.carimage}" style="width:400px;" , height="323px;" ,
                margin="90px auto 0 250px">

              <h2 class="carname">${dto.carname}</h2>

              <h3 class="carinfo">
                ${dto.carnumber}<br>
                ${dto.carseate} | ${dto.carpoint} | ${dto.category}<br>
                ${dto.caryearmodel}<br>
                ${dto.carprice}<br>

              </h3>
              <div>
                <h2>C a r O p t i o n  </h2>
                <br>
                <c:if test="${dto.cdto != null}">
                  ${dto.cdto.bluetooth}
                  ${dto.cdto.rear_sensor}
                  ${dto.cdto.rear_camera}
                  ${dto.cdto.black_box}
                  ${dto.cdto.heated_seat}
                  ${dto.cdto.heated_handle}
                  ${dto.cdto.ventilated_seat}
                  ${dto.cdto.navigation}
                  ${dto.cdto.non_smoking_vehicle}
                  ${dto.cdto.smart_key}
                  ${dto.cdto.sunroof}
                  ${dto.cdto.rear_warning_light}
                  ${dto.cdto.lane_departure_prevention}
                </c:if>
              </div>
              <!-- 수정 / 사진수정 버튼은 유저한테 안보이게 해야함 -->
              <p class="button">
              <div>
                <a class="res" href="javscropt:history.back()">RESERVATION</a>
              </div>
              <div class="Abtn">
              <button>
                <a href="/carinfo/update/${dto.carnumber}">정보 수정</a></button>
              <!-- <button><a href="/carinfo/optupdate/${dto.carnumber}">옵션 수정</a></button> -->
              <button onclick="optupdate()">옵션 수정</button>
              <button>
                <a href="/carinfo/updateFile/${dto.carnumber }/${dto.carimage}">사진 수정</a></button>
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