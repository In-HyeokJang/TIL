<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/JavaScript">
 $(function() {

     if (f.carname.value == ""){
             alert("차이름을 입력하세요");
             f.carname.focus()
             return false;
     }


     if (f.category.value == ""){
             alert("차 종을 입력하세요");
             f.category.focus()
             return false;
     }
        if (f.carseate.value == ""){
             alert("좌석수를 입력하세요");
             f.carseate.focus()
             return false;
     }
        if (f.carpoint.value == ""){
             alert("지점을 입력하세요");
             f.carpoint.focus()
             return false;
     }
}
 </script>
</head>
<body>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">차량정보 수정</h1>
<form class="form-horizontal"
      action="/carinfo/update"
      method="post"
      onsubmit="return checkIn(this)">
  <input type="hidden" name="carnumber" value="${carnumber}">

  <div class="form-group">
    <label class="control-label col-sm-2" for="carname">차이름</label>
    <div class="col-sm-8">
      <input type="text" name="carname" id="carname" class="form-control" value="${dto.carname }" >
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="category">차 종</label>
    <div class="col-sm-8">
      <input type="text" name="category" id="category" class="form-control" value="${dto.category }" >
    </div>
  </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="caryearmodel">차연식</label>
      <div class="col-sm-6">
        <input type="text" name="caryearmodel" id="caryearmodel" class="form-control" value="${dto.caryearmodel }" >
      </div>
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="carseate">좌석수</label>
    <div class="col-sm-6">
      <input type="text" name="carseate" id="carseate" class="form-control" value="${dto.carseate }" >
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="carpoint">지점</label>
    <div class="col-sm-8">
      <input type="text" name="carpoint" id="carpoint" class="form-control" value="${dto.carpoint }" >
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2">차옵션 선택</label>
      <input type="radio" class="btn-check" name="Bluetooth" value="블루투스" id="btn1">
    	<label class="btn btn-primary" for="btn1">블루투스</label>
    	<input type="radio" class="btn-check" name="rear_sensor" value="후방센서" id="btn2">
    	<label class="btn btn-primary" for="btn2">후방센서</label>
    	<input type="radio" class="btn-check" name="rear_camera" value="후방카메라" id="btn3">
    	<label class="btn btn-primary" for="btn3">후방카메라</label>
    	<input type="radio" class="btn-check" name="black_box" value="블랙박스" id="btn4">
      <label class="btn btn-primary" for="btn4">블랙박스</label>
      <input type="radio" class="btn-check" name="heated_seat" value="열선시트" id="btn5">
      <label class="btn btn-primary" for="btn5">열선시트</label>
      <br>
      <input type="radio" class="btn-check" name="heated_handle" value="열선핸들" id="btn6">
      <label class="btn btn-primary" for="btn6">열선핸들</label>
      <input type="radio" class="btn-check" name="ventilated_seat" value="통풍시트" id="btn7">
      <label class="btn btn-primary" for="btn7">통풍시트</label>
      <input type="radio" class="btn-check" name="navigation" value="네비게이션" id="btn8">
      <label class="btn btn-primary" for="btn8">네비게이션</label>
      <input type="radio" class="btn-check" name="non-smoking_vehicle" value="금연차량" id="btn9">
      <label class="btn btn-primary" for="btn9">금연차량</label>
      <br>
      <input type="radio" class="btn-check" name="smart_key" value="스마트키" id="btn10">
      <label class="btn btn-primary" for="btn10">스마트키</label>
      <input type="radio" class="btn-check" name="sunroof" value="썬루프" id="btn11">
      <label class="btn btn-primary" for="btn11">썬루프</label>
      <input type="radio" class="btn-check" name="rear_warning_light" value="후측방경고등" id="btn12">
      <label class="btn btn-primary" for="btn12">후측방경고등</label>
      <input type="radio" class="btn-check" name="Lane_Departure_Prevention" value="차선이탈방지" id="btn13">
      <label class="btn btn-primary" for="btn13">차선이탈방지</label>
    	</div>

   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
     <a href="javascript:history.back()">
        <img class='btn' src="/svg/arrow-return-left.svg"/>뒤로</a>
   </div>
 </div>
</form>
</div>
</body>
</html>