var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
var map, dong_dong, rvClient, rv;
var min_lat, min_lng;

// Map api 호출 및 생성
function mapcreate(lat, lng) {
// 지도를 표시할 div
var mapCenter = new kakao.maps.LatLng(lat, lng);
var mapOption = {
    center: mapCenter, // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

return map;
}



// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
// 로드뷰를 설정
function toggleRoadview(position) {
rvClient.getNearestPanoId(position, 50, function (panoId) {
    // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
    if (panoId === null) {
        toggleMapWrapper(true, position);
    } else {
        toggleMapWrapper(false, position);

        // panoId로 로드뷰를 설정합니다
        rv.setPanoId(panoId, position);
    }
});
}

// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
function toggleMapWrapper(active, position) {
if (active) {

    // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다
    container.className = '';

    // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
    map.relayout();

    // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
    map.setCenter(position);
} else {

    // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
    // 로드뷰가 함께 표시되게 합니다
    if (container.className.indexOf('view_roadview') === -1) {
        container.className = 'view_roadview';

        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
        map.relayout();

        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
        map.setCenter(position);
    }
}
}

// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
function toggleOverlay(active) {
if (active) {
    overlayOn = true;

    // 지도 위에 로드뷰 도로 오버레이를 추가합니다
    map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

    // 지도 위에 마커를 표시합니다
    dong_dong.setMap(map);

    // 마커의 위치를 지도 중심으로 설정합니다
    dong_dong.setPosition(map.getCenter());

    // 로드뷰의 위치를 지도 중심으로 설정합니다
    toggleRoadview(map.getCenter());
} else {
    overlayOn = false;

    // 지도 위의 로드뷰 도로 오버레이를 제거합니다
    map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

    // 지도 위의 마커를 제거합니다
    dong_dong.setMap(null);
}
}

// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
function setRoadviewRoad() {
var control = document.getElementById('roadviewControl');

// 버튼이 눌린 상태가 아니면
if (control.className.indexOf('active') === -1) {
    control.className = 'active';

    // 로드뷰 도로 오버레이가 보이게 합니다
    toggleOverlay(true);
} else {
    control.className = '';

    // 로드뷰 도로 오버레이를 제거합니다
    toggleOverlay(false);
    closeRoadview();
}
}

// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
function closeRoadview() {
var position = dong_dong.getPosition();
toggleMapWrapper(true, position);
}


// 로드뷰 동동 아이콘 생성 - > fetchData

async function fetchData(position) {
var lat = position.coords.latitude;
var lng = position.coords.longitude;

// Map create
map = mapcreate(lat, lng);

//add(map);

var mapCenter = new kakao.maps.LatLng(lat, lng);

// 로드뷰 객체를 생성합니다
rv = new kakao.maps.Roadview(rvContainer);

// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다
rvClient = new kakao.maps.RoadviewClient();

// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다
kakao.maps.event.addListener(rv, 'position_changed', function () {

    // 현재 로드뷰의 위치 좌표를 얻어옵니다
    var rvPosition = rv.getPosition();

    // 지도의 중심을 현재 로드뷰의 위치로 설정합니다
    map.setCenter(rvPosition);

    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
    if (overlayOn) {
        // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
        dong_dong.setPosition(rvPosition);
    }
});

// 마커 이미지를 생성합니다
var markImage = new kakao.maps.MarkerImage(
    'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
    new kakao.maps.Size(26, 46),
    {
        spriteSize: new kakao.maps.Size(1666, 168),
        spriteOrigin: new kakao.maps.Point(705, 114),
        offset: new kakao.maps.Point(13, 46)
    }
);

// 드래그가 가능한 마커를 생성합니다
dong_dong = new kakao.maps.Marker({
    image: markImage,
    position: mapCenter,
    draggable: true
});

// 마커에 dragend 이벤트를 등록합니다
kakao.maps.event.addListener(dong_dong, 'dragend', function (mouseEvent) {

    // 현재 마커가 놓인 자리의 좌표입니다
    var position = dong_dong.getPosition();

    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
    toggleRoadview(position);
});

//지도에 클릭 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다
    if (!overlayOn) {
        return;
    }

    // 클릭한 위치의 좌표입니다
    var position = mouseEvent.latLng;

    // 마커를 클릭한 위치로 옮깁니다
    dong_dong.setPosition(position);
    // 클락한 위치를 기준으로 로드뷰를 설정합니다
    toggleRoadview(position);
});

var url = "/kakao_url/" + lng + "/" + lat
const response = await fetch(url);
const data = await response.json();

itemlist = [];
var i = 0;
min_distance = Number.MAX_VALUE;
for (i = 0; i < 15; i++) {
    itemlist.push(data[i]);
}


facilitie(data[15].lng, data[15].lat);

var locPosition = new kakao.maps.LatLng(lat, lng);


// 현재 사용자 위치
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: locPosition, // 마커를 표시할 위치
    image: markerImage
});

// 마크 생성
var positions = markcreate(itemlist);

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
        position: positions[i].latlng, // 마커를 표시할 위치
        image: markerImage
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

function markcreate(itemlist) {
positions = [];
for (let i = 0; i < itemlist.length; i++) {
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
    };

    positions.push(position)
}
return positions;
}


async function facilitie(lat, lng) {
// 주소 - 좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var imageSrc = '',
    imageSize = new kakao.maps.Size(100, 62), // 마커이미지의 크기입니다
    imageOption = { offset: new kakao.maps.Point(50, 62) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.



var url = "/facilities/" + lat + "/" + lng

// list 로 반환 받기 List<store>
var facilities = await fetch(url);
const data = await facilities.json();

itemlist = []
len = 0;
data.forEach(obj => {
    itemlist.push(obj)
});

itemlist.forEach(obj => { geo(obj) })

// 주소를 화면에 출력한다.
function geo(obj) {
    var store = new kakao.maps.LatLng(obj.x, obj.y);
    console.log(obj);
    if (obj.type == "까페"){
        imageSrc = 'https://user-images.githubusercontent.com/65659478/182173528-9b320482-a8f3-44bd-a2c4-a8cfa4b79890.png'
    }else{
        imageSrc = 'https://user-images.githubusercontent.com/65659478/182173533-4013c473-4a60-493c-8a2c-5753faeb73f4.png'
    }

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: store, // 마커를 표시할 위치
        image: markerImage
    });
}

}

function onGeoError() {
alert("Can't find you. No weather for you.");
}

function init() {
navigator.geolocation.getCurrentPosition(fetchData, onGeoError);
}

init();

//5분 간격으로 메시지를 보여줌
let timerId = setInterval(() => init(), 5 * 36 * 1000);