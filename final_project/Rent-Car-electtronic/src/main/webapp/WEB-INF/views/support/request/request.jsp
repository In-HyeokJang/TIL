<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <title>Contact Form 02</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" type="text/css" href="/css/map/map.css">
        <link rel="stylesheet" type="text/css" href="/css/support/request.css">

    </head>

    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="wrapper">
                            <div class="row no-gutters">
                                <div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
                                    <div class="contact-wrap w-100 p-md-5 p-4">
                                        <h3 class="mb-4">Rent Car center로 연결해 드립니다.</h3>
                                        <div id="form-message-warning" class="mb-4"></div>
                                        <div id="form-message-success" class="mb-4">
                                            Your message was sent, thank you!
                                        </div>

                                        <form>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="label" for="name">User Id</label>
                                                        <input type="text" class="form-control" name="mname" id="mname" placeholder="Name">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <!-- <div class="form-group">
                                                        <label class="label" for="email">Email Address</label>
                                                        <input type="email" class="form-control mb-5" name="email"
                                                            id="email" placeholder="Email">
                                                    </div> -->
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="label" for="subject">Car number</label>
                                                        <input type="text" class="form-control mb-5" name="carnum" id="carnum">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="label" for="#">Reason</label>
                                                        <textarea name="reason" class="form-control" id="reason"
                                                            cols="30" rows="4" placeholder="Message"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">

                                                        <button class="btn btn-default sumbit" 
                                                        style="color: rebeccapurple; width: 100%; height: 50px; margin-top: 5%;" onclick="help()">
                                                            <span class="btnText">Submit</span>
                                                        </button>

                                                    </div>

                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                                    <div class="info-wrap bg-primary w-100 p-md-1 p-4">

                                        <div id="map" style="width:100%; height:100%;"></div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae01749ed46288f45cd68bb87a3238&libraries=services"></script>

        <script>

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 1 // 지도의 확대 레벨 
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
            if (navigator.geolocation) {

                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function (position) {

                    var lat = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도

                    var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        message = ''; // 인포윈도우에 표시될 내용입니다

                    // 마커와 인포윈도우를 표시합니다
                    displayMarker(locPosition, message);

                });

            } else {
                var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                    message = 'geolocation을 사용할수 없어요..'

                displayMarker(locPosition, message);
            }

            // 지도에 마커와 인포윈도우를 표시하는 함수입니다
            function displayMarker(locPosition, message) {

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: locPosition
                });

                var iwContent = message, // 인포윈도우에 표시할 내용
                    iwRemoveable = true;

                // 지도 중심좌표를 접속위치로 변경합니다
                map.setCenter(locPosition);
            }

        </script>

        <script>
            function help() {
                navigator.geolocation.getCurrentPosition(helpMe, onGeoError);
                // 충전소 위치 표시
            }

            async function helpMe(position) {
                // Geolocation  and send

                const lat = position.coords.latitude;
                const lng = position.coords.longitude;

                const name = document.getElementById("mname").value;
                const carnum = document.getElementById("carnum").value;
                const reason = document.getElementById("reason").value;


                data = {
                    name:name,
                    carinfo_carnum: carnum,
                    reason: reason,
                    rx: lat,
                    ry: lng,
                };

                var url = "/user/request/help";
                const response = await fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                })
                    .then((res) => res.json())
                    .then((json)=>alert(json.result))
                    .catch(() => {
                        alert("잠시 후 다시 이용해 주세요");
                    }).finally(window.location="/");
            }


            function onGeoError() {
                alert("Can't find you. No weather for you.");
            }

        </script>
    </body>

    </html>