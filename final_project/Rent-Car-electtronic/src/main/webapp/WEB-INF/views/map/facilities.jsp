<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>좌표로 주소를 얻어내기</title>
        <link rel="stylesheet" type="text/css" href="/css/common.css">
        <link rel="stylesheet" type="text/css" href="/css/map/map.css">
        <link rel="stylesheet" type="text/css" href="/css/map/facilities.css">

    </head>

    <body>
        <div clss="map_info">사장님의 가게 위치와 정보를 입력해주세요. 가게 위치는 정확할수록 좋습니다.</div>
        <div class="map_wrap">

            <div id="map" style="width:100%;height:100%; position:relative; overflow:hidden;"></div>

            <div class="data">
                <label>Store Name</label>
                <input id="name" required>

                <label>Store phonenum</label>
                <input id="phonenum" required>

                <label>Store Type</label>
                <input id="type" required>

                <button class="sumbit" onclick="getInfo()">
                    <span class="btnText">Submit</span>
                    <i class="uil uil-navigator"></i>
                </button>
            </div>


            <div class="hAddr">
                <span class="title">지도중심기준 행정동 주소정보</span>
                <span id="centerAddr"></span>
            </div>
        </div>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae01749ed46288f45cd68bb87a3238&libraries=services"></script>

        <!-- SHow up Map layout and Poiner -->
        <script src="/js/map/addtocoor.js"></script>


    </body>

    </html>