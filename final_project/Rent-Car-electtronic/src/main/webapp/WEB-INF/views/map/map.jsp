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

        <div clss="map_info">고객의 현재 위치 기준 2km 이내의 충전소 정보를 표시합니다.</div>

        <div id="container">
            <div id="rvWrapper">
                <div id="roadview" style="width:100%;height:100%;"></div>
                <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
            </div>

            <div id="mapWrapper">
                <div id="map"></div>
                <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
            </div>

        </div>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae01749ed46288f45cd68bb87a3238&libraries=services"></script>

    </body>

    <!-- SHow up Map layout and Poiner -->
    <script src="/js/map/map_layout.js"></script>
    </html>