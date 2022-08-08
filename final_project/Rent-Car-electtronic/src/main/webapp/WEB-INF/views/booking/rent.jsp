<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/booking.css">
<script type="text/JavaScript">
    let date = new Date();
    let offset = date.getTimezoneOffset() * 60000;
    let dateOffset = new Date(date.getTime() - offset);
    /*
    console.log(date); // 한국표준시
    console.log(dateOffset); // toISOString()이 UTC 기준이므로 +9시간
    console.log(dateOffset.toISOString().substring(11, 16)); // 현재시간 09:00
    console.log(dateOffset.toISOString().substring(0, 10)); // 현재날짜 2022-08-05
    */
    function clickBtn(return_day, category) {
        if (return_day == ""){
            alert("반납일을 선택하세요");
            document.frm.return_day.focus()
            return false;
        } else {
            const arr = [];
            const category = document.getElementsByName("category");
            for (let i = 0; i < category.length; i++) {
                if (category[i].checked == true) {
                    arr.push(category[i].value);
                }
            }
            document.getElementById("checked").textContent = arr;
            console.log(arr);

            let url = "./search/" + arr;
            location.href=url;
        }
    }
</script>
</head>
<body>
    <div class="container">
    <h2 class="contents_title">차량 검색</h2>
        <form class="form-horizontal" name="frm">
            <div class="kf_innergray">
                <div class="kf_flightInner selectON">
                    <ul class="k1_flight_panel is_on">
                        <p class="tit">인수일/시간</p>
                        <input type="date" name="rent_day" id="rent_day">
                        <input class="timepicker" type="time" name="rent_time" id="rent_time">
                            <script>
                                document.getElementById('rent_day').value = dateOffset.toISOString().substring(0, 10);
                                document.getElementById('rent_time').value = dateOffset.toISOString().substring(11, 16);
                            </script>
                    </ul>
                </div>
                <div class="kf_flightInner selectON">
                    <ul class="k1_flight_panel">
                        <p class="tit">반납일/시간</p>
                        <input type="date" name="return_day" id="return_day">
                        <input class="timepicker" type="time" name="return_time" id="return_time" value="09:00">
                    </ul>
                </div>
                <div class="kf_flightInner selectON">
                    <ul class="k1_flight_panel">
                        <p class="tit">차종 선택</p>
                        <ul class ="frmBox">
                            <span id="checked"></span>
                            <li><input type="radio" name="category" id="category" value="1" checked><label>소형</label></li>
                            <li><input type="radio" name="category" id="category" value="2"><label>중형</label></li>
                            <li><input type="radio" name="category" id="category" value="3"><label>대형</label></li>
                            <li><input type="radio" name="category" id="category" value="4"><label>SUV</label></li>
                        </ul>
                    </ul>
                </div>
                <div class="kf_flightInner">
                    <button type="button" class="k1_btn_price_search btnDefault action" onclick="clickBtn(document.frm.return_day.value, document.frm.category.value)">검색</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>