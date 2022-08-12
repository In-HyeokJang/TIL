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
        <link rel="stylesheet" type="text/css" href="/css/carinfo/read.css">
        <link rel="stylesheet" type="text/css" href="/css/carinfo/readmap.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">

          function optupdate() {
            let windowObjectReference;
            let windowFeatures = "left=100, top=100, width=320, height=900, width=640";
            windowObjectReference = window.open("/admin/carinfo/optupdate/${carnumber}", "mozillaTab", windowFeatures);
          }
          function mapupdate() {
            let windowObjectReference;
            let windowFeatures = "left=100, top=100, width=320, height=900, width=640";
            windowObjectReference = window.open("/admin/carinfo/mapupdate/${carnumber}", "mozillaTab", windowFeatures);
          }

          function reservation() {
            if ('${dto.rentstatus}' == '0') {
              alert('예약가능 합니다.');


              let url = "/user/carinfo/list"
              location.href = url;
            } else {
              alert("이미 예약이 되어 있어 예약이 불가능 합니다.");
            };
          };

        </script>
      </head>

      <body>

        <div class="container">
          <div class="layout">
            <div>
              <div class="carinfocolor">
                <input type="hidden" class="form-control" id="rentstatus" name="rentstatus" value="${dto.rentstatus}">
                <input type="hidden" class="form-control" id="x" name="x" value="${dto.x}">
                <input type="hidden" class="form-control" id="y" name="y" value="${dto.y}">
                <img class="img" src="${dto.carimage}" style="width:400px;" , height="260px;">

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
                  <c:when test="${empty dto.cdto.bluetooth}"><span class="off">블루투스</span></c:when>
                  <c:otherwise> <span class="on">${dto.cdto.bluetooth}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_sensor}"><span class="off">후방센서</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_sensor}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_camera}"><span class="off">후방카메라</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_camera}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.black_box}"><span class="off">블랙박스</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.black_box}</span>
                  </c:otherwise>
                </c:choose>

                <br><br>

                <c:choose>
                  <c:when test="${empty dto.cdto.heated_seat}"><span class="off">열선시트</span></c:when>
                  <c:otherwise> <span class="on">${dto.cdto.heated_seat}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.heated_handle}"><span class="off">열선핸들</span></c:when>
                  <c:otherwise> <span class="on">${dto.cdto.heated_handle}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.ventilated_seat}"><span class="off">통풍시트</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.ventilated_seat}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.navigation}"><span class="off">네비게이션</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.navigation}</span> </c:otherwise>
                </c:choose>


                <br><br>

                <c:choose>
                  <c:when test="${empty dto.cdto.non_smoking_vehicle}"><span class="off">금연차량</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.non_smoking_vehicle}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.smart_key}"><span class="off">스마트키</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.smart_key}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.sunroof}"> <span class="off">썬루프</span></c:when>
                  <c:otherwise> <span class="on">${dto.cdto.sunroof}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.rear_warning_light}"><span class="off">후방경고등</span></c:when>
                  <c:otherwise> <span class="on">${dto.cdto.rear_warning_light}</span> </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${empty dto.cdto.lane_departure_prevention}"><span class="off">차선방지이탈</span> </c:when>
                  <c:otherwise> <span class="on">${dto.cdto.lane_departure_prevention}</span> </c:otherwise>
                </c:choose>


              </div>
              <!-- 수정 / 사진수정 버튼은 유저한테 안보이게 해야함 -->
              <p class="button">
              <div>
                <a class="res" id="reserv" href="javascript:reservation()" value="${dto.rentstatus}">RESERVATION</a>
              </div>
              <c:if test="${sessionScope.grade == 'A'}">
                <div class="Abtn">
                  <button><a href="/admin/carinfo/update/${dto.carnumber}">정보 수정</a></button>

                  <button onclick="optupdate()">옵션 수정</button>

                  <button><a href="/admin/carinfo/updateFile/${dto.carnumber}">사진 수정</a></button>

                  <button onclick="mapupdate()">차위치수정</button>
                </div>
              </c:if>
              </p>
            </div>
          </div>


          <!-- 추가 -->
          <div class="viewContents rentcar">
            <div class="boxWhite">
              <div class="plusbutton">
                <ul class="pulsbutton01">
                  <a href="#tabContents01" role="button" class="tabCont" aria-selected="true"
                    data-controls="tabContents01">유의사항</a>
                  <a href="#tebContents03" role="button" class="tabCont" aria-selected="false"
                    data-controls="tabContents02">차량/보험</a>
                  <a href="#tebContents04" role="button" class="tabCont" aria-selected="false"
                    data-controls="tabContents04">차 위치</a>
                </ul>
              </div>
              <!-- 유의사항 -->
              <div id="tabContent01"></div>
              <div id="tabContents01" class="tabContentWrap tabON">
                <div class="detailCont">
                  <div class="rentcarBanner" noticeBanner>

                  </div>
                  <div class="tabContRentcar">
                    <div class="beware">
                      <strong class="careful">👀주의하세요!</strong>
                      <p cautionText><br>EV RentCar 추가 요금 및 대여 불가한 항목에 대해 꼼꼼히 확인하시기 바랍니다.</p>
                    </div>
                  </div>
                </div>
                <div id="tabContent02"></div>
                <div class="borderTop">
                  <h4 class="titDep4">인수불가 규정 안내</h4>
                  <ul class="listType01">
                    <li>반려동물 동반 시 &lt;인수 가능한 경우 상단에 별도 안내&gt;</li>
                    <li>낚시용품 소지 시 &lt;인수 가능한 경우 상단에 별도 안내&gt;</li>
                    <li>전기차 충전카드의 의무적인 구매 거부 시</li>
                  </ul>
                </div><br>
                <div id="tabContent03"></div>
                <div class="borderTop">
                  <h4 class="titDep4">환불불가 안내</h4>
                  <ul class="listType01">
                    <li>인수불가 규정 위반에 따른 책임은 예약 당사자에게 있습니다.</li>
                    <li>인수불가 시 선택한 요금제에 따라 당일취소 수수료가 부과됩니다.</li>
                  </ul>
                  <br>
                </div>
              </div>
            </div>


            <!-- //유의사항 -->
            <!-- 차량/보험 -->
            <div id="tabContent04"></div>
            <div id="tabContents02" class="tabContentWrap">
              <h4 class="titDep4">대여규정</h4>
              <ul class="infoTypeIco">
                <div class="txt">
                  <figure class="fig"><img
                      src="https://static-www.jejupass.com/resource/PC/images/rentcar/ico_rent01.png" alt="연령아이콘">
                  </figure><br>
                  <b>연령</b>
                  <br>
                  <span>만 20세 이상</span>

                </div>

                <div class="txt">
                  <figure class="fig"><img
                      src="https://static-www.jejupass.com/resource/PC/images/rentcar/ico_rent02.png" alt="운전경력아이콘">
                  </figure><br>
                  <b>운전경력</b>
                  <br>
                  <span>1년 이상</span>


                </div>

                <div class="txt">
                  <figure class="fig"><img
                      src="https://static-www.jejupass.com/resource/PC/images/rentcar/ico_rent03.png" alt="운전면허아이콘">
                  </figure><br>
                  <b>운전면허</b>
                  <br>
                  <span>2종 보통 이상</span>

                </div>
              </ul>
              <div id="tabContent05"></div>
              <div id="tebContents03" class="anchorTab"></div>
              <h4 class="titDep4" companyPartnerInsuranceTitle>종합보험</h4>
              <ul>
                <li><b>파트너사명 </b>: EV Rent Car</li>
                <li><b>종합보험명 </b>: 렌트가공제조합</li>
                <li><b>보상범위 및 비고</b></li>
              </ul>
              <div class="tblH" companyPartnerInsuranceInfo>
                <table class="table table-striped">
                  <colgroup>
                    <col style="width:calc(100%/5)" span="5">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">파트너사명</th>
                      <th scope="col">종합보험명</th>
                      <th scope="col" colspan="2">보상범위</th>
                      <th scope="col">비고</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row" rowspan="3" partnernm> <strong>EV Rent Car</strong></th>
                      <th scope="row" rowspan="3">렌트카공제조합</th>
                      <td>대인</td>
                      <td>무제한</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td>대물</td>
                      <td>건당 2,000만원</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td>자손</td>
                      <td>건당 1,500만원</td>
                      <td>-</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="titArea">
                <h4 class="titDep4">자차보험</h4><br>
              </div>
              <div class="tblH">
                <table class="table table-striped">
                  <colgroup>
                    <col style="width:calc(100%/3)" span="3">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">보상내용</th>
                      <th scope="col" class="on" insuNm>보상범위</th>
                      <th scope="col" superInsuNm>슈퍼무제한</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">면책금</th>
                      <td class="on" insuranceDeductible>면제</td>
                      <td superInsuranceDeductible>면제</td>
                    </tr>
                    <tr>
                      <th scope="row">보상한도</th>
                      <td class="on" insuranceCoverageLimitAmount>300만원</td>
                      <td superInsuranceCoverageLimitAmount>무제한</td>
                    </tr>
                    <tr>
                      <th scope="row">휴차보상료</th>
                      <td class="on" insuranceLeaveCompensationYn>면제</td>
                      <td superInsuranceLeaveCompensationYn>면제</td>
                    </tr>
                    <tr>
                      <th scope="row">단독사고</th>
                      <td class="on" insuranceSoleAccidentCoverageYn>보상안됨</td>
                      <td superInsuranceSoleAccidentCoverageYn>면제</td>
                    </tr>
                    <tr>
                      <th scope="row">휠/타이어</th>
                      <td class="on" insuranceWheelAndTireCoverageYn>보상안됨</td>
                      <td superInsuranceWheelAndTireCoverageYn>면제</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- //차량/보험 -->
            <!-- 업체정보 -->
            <div id="tabContent06"></div>
            <div id="tebContents04" class="anchorTab"></div>
            <div id="tabContents04" class="tabContentWrap">
              <div class="reviewArea">
                <h4 class="titDep4" compName>차 위치</h4><br>
              </div>
            </div>
            <div class="map_wrap">
              <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
              <div class="hAddr">
                <span class="title">${dto.carpoint}<br>
                </span>
              </div>
            </div>
            <script type="text/javascript"
              src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae01749ed46288f45cd68bb87a3238&libraries=services"></script>
            <script>
              var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                  center: new kakao.maps.LatLng('${dto.x}', '${dto.y}'), // 지도의 중심좌표
                  level: 4 // 지도의 확대 레벨
                };
              var map = new kakao.maps.Map(mapContainer, mapOption);
              var imageSrc = 'https://kr.object.ncloudstorage.com/imagetest/carinfo/5b30ba63-3c38-4d93-b519-6898f2f0a840icon-charging-station-7144586.png', // 마커이미지의 주소입니다
                imageSize = new kakao.maps.Size(26, 40), // 마커이미지의 크기입니다
                imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

              // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
              var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng('${dto.x}', '${dto.y}'); // 마커가 표시될 위치입니다

              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                position: markerPosition,
                image: markerImage // 마커이미지 설정
              });

              // 마커가 지도 위에 표시되도록 설정합니다
              marker.setMap(map);
            </script>
          </div>
        </div>
        </div>
        <!-- //업체정보 -->
        </div>
        </div>
        <p class="button">
              <input type="button" value="TOP" onClick="javascript:window.scrollTo(0,0)"/>
        </p>
        </div>

      </body>

      </html>