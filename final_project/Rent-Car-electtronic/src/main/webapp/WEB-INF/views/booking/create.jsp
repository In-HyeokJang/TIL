<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/booking.css">
<script type="text/JavaScript">
    let date = new Date().toISOString().substring(11, 16)
    console.log(date);

    function checkIn(f){
        if (f.user_id.value == ""){
            alert("아이디를 입력하세요");
            f.user_id.focus();
            return false;
        }
        if (f.return_day.value == ""){
            alert("반납일을 선택하세요");
            f.return_day.focus()
            return false;
        }
        if (f.reserved_car.value == ""){
            alert("차량을 선택하세요");
            f.reserved_car.focus();
            return false;
        }
        if (f.insurance.value == ""){
            alert("보험을 선택하세요");
            f.insurance.focus();
            return false;
        }
    }
</script>
</head>
<body>
    <div class="container">
    <h2 class="col-sm-offset-2 col-sm-10">차량 예약(검색)</h2>
        <form class="form-horizontal"
            action="/booking/search"
            method="post"
            enctype="multipart/form-data"
            onsubmit="return checkIn(this)">
        <div class="form-group">
            <label class="control-label col-sm-2" for="user_id">예약자</label>
            <div class="col-sm-8">
                <input type="text" name="user_id" id="user_id" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="rent_day">인수일</label>
            <input type="date" name="rent_day" id="rent_day">
            <script>
                document.getElementById('rent_day').value = new Date().toISOString().substring(0, 10);
                //document.getElementById('return_day').value = new Date().toISOString().substring(0, 10);
            </script>
            <label for="rent_time">인수시간</label>
            <input class="timepicker" type="time" name="rent_time" id="rent_time" value="09:00">
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="return_day">반납일</label>
            <input type="date" name="return_day" id="return_day">
            <label for="return_time">반납시간</label>
            <input class="timepicker" type="time" name="return_time" id="return_time" value="09:00">
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="reserved_car">차량종류</label>
            <div class="col-sm-6">
            <select class="form-control" name="reserved_car">
            <option value="k5">k5</option>
            <option value="k7">k7</option>
            <option value="G80">G80</option>
            <option value="G90">G90</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="insurance">보험종류</label>
            <div class="col-sm-6">
            <select class="form-control" name="insurance">
            <option value="일반자차">일반자차</option>
            <option value="완전자차">완전자차</option>
            <option value="부분무제한">부분무제한</option>
            </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-5">
            <button class="btn">등록</button>
            <button type="reset" class="btn">취소</button>
            </div>
        </div>
        </form>
    </div>
</body>
</html>