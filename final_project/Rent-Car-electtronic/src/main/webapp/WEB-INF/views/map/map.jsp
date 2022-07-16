<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>마커 생성하기</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Project Two</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="/css/common.css">
        <link rel="stylesheet" type="text/css" href="/css/map/map.css">
    </head>

    <body>

        <div>고객의 현재 위치 기준 2km 이내의 충전소 정보를 표시합니다.</div>
        <div id="map" style="z-index: -1;"></div>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae01749ed46288f45cd68bb87a3238"></script>
        <script>


            async function fetchData(position) {

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };


                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                const lat = position.coords.latitude;
                const lng = position.coords.longitude;
                var url = "/kakao_url/" + lat + "/" + lng

                const response = await fetch(url);
                const data = await response.json();

                itemlist = []
                len = 0;
                data.forEach(obj => {
                    itemlist.push(obj)
                });

                len = itemlist.length;

                positions = []
                for (let i = 0; i < len; i++) {

                    var iwContent =
                        `
                        <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                            <h3>` + itemlist[i].place_name + `</h3>
                            <p class="mb-4">실시간 충전소 현황은 아래 링크를 클릭해주세요.</p>
                            <div class="dbox w-100 d-flex align-items-start">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-map-marker"></span>
                                </div>
                                <div class="text pl-3">
                                    <p>` + itemlist[i].road_address_name + `</p>
                                </div>
                            </div>
		
                            <div class="dbox w-100 d-flex align-items-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-phone"></span>
                                </div>
                                <div class="text pl-3">
                                    <p>+ ` + itemlist[i].phone + `</p>
                                </div>
                            </div>

                            <div class="dbox w-100 d-flex align-items-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-car"></span>
                                </div>
                                <div class="text pl-3">
                                    <p> `+ itemlist[i].distance + ` 미터</p>
                                </div>
                            </div>

                            <div class="dbox w-100 d-flex align-items-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-globe"></span>
                                </div>
                                <div class="text pl-3">
                                    <p><a href="`+ itemlist[i].place_url + `" onclick="window.open(this.href, '_blank', 'width=930, height=700'); return false;">` + itemlist[i].place_url + `</a></p>
                                </div>
                            </div>
	                    </div>`,

                        iwRemoveable = true;
                    position = {
                        content: iwContent,
                        removable: iwRemoveable,
                        latlng: new kakao.maps.LatLng(itemlist[i].y, itemlist[i].x),
                    }


                    positions.push(position)
                }




                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                for (var i = 0; i < positions.length; i++) {

                    // 마커 이미지의 이미지 크기 입니다
                    var imageSize = new kakao.maps.Size(24, 35);

                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng // 마커를 표시할 위치
                    });

                    var infowindow = new kakao.maps.InfoWindow({
                        content: positions[i].content,
                        removable: positions[i].removable
                    });
                    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

                }

                // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
                function makeOverListener(map, marker, infowindow) {
                    return function () {
                        infowindow.open(map, marker);
                    };
                }

            }

        </script>


        <script>


            function onGeoError() {
                alert("Can't find you. No weather for you.");
            }

            function init() {
                navigator.geolocation.getCurrentPosition(fetchData, onGeoError);
                // 충전소 위치 표시
            }

            init()

        </script>

    </body>

    </html>