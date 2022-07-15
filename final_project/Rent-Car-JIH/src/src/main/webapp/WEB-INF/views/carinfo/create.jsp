<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>자동차등록</title>
  <meta charset="utf-8">
    <script type="text/JavaScript">
   function checkIn(f){
       if (f.carname.value == ""){
               alert("차이름을 입력하세요");
               f.carname.focus();
               return false;
       }
       if (f.carnumber.value == ""){
               alert("차번호를 입력하세요");
               f.carnumber.focus();
                return false;
       }
       if (f.carseate.value == ""){
                alert("좌석수를 지정해 주세요");
                f.carseate.focus()
                return fales;
       }
       if (f.carpoint.value == ""){
             alert("지점을 입력해 주세요");
             f.carpoint.focus();
             return fales;
       }

       if (f.carimage.value == ""){
               alert("차량이미지를 선택하세요");
               f.carimage.focus();
               return false;
       }
  }
   </script>

   <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
       }
   </style>
</head>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">자동차 등록</h1>
<form class="form-horizontal"
      action="/carinfo/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">

  <div class="form-group">
      <label class="control-label col-sm-2" for="carnumber">자동차번호</label>
      <div class="col-sm-8">
        <input type="text" name="carnumber" id="carnumber" class="form-control"
        placeholder="Enter carnumber">
      </div>
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="carname">자동차이름</label>
    <div class="col-sm-8">
      <input type="text" name="carname" id="carname" class="form-control"
      placeholder="Enter carname">
    </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2" for="category">차 종류</label>
      <div class="col-sm-8">
        <input type="text" name="category" id="category" class="form-control"
        placeholder="Enter Car category">
      </div>
    </div>
      <div class="form-group">
          <label class="control-label col-sm-2" for="carseate">좌석 수</label>
          <div class="col-sm-8">
            <input type="text" name="carseate" id="carseate" class="form-control"
            placeholder="Enter carseate">
          </div>
       </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="carpoint">지점</label>
    <div class="col-sm-6">
      <input type="text" name="carpoint" id="carpoint" class="form-control"
      placeholder="Enter carpoint">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">차이미지</label>
    <div class="col-sm-6">
      <input type="file" name="filenameMF" id="filenameMF" class="form-control">
    </div>
  </div>
  <div class="form-group">
  <label class="control-label col-sm-2">차옵션 선택</label><br>
    <input type="checkbox" class="btn" name="bluetooth" value="블루투스" id="btn1">
  	<label class="btn btn-primary" for="btn1">블루투스</label>
  	<input type="checkbox" class="btn-check" name="rear_sensor" value="후방센서" id="btn2">
  	<label class="btn btn-primary" for="btn2">후방센서</label>
  	<input type="checkbox" class="btn-check" name="rear_camera" value="후방카메라" id="btn3">
  	<label class="btn btn-primary" for="btn3">후방카메라</label>
  	<input type="checkbox" class="btn-check" name="black_box" value="블랙박스" id="btn4">
    <label class="btn btn-primary" for="btn4">블랙박스</label>
    <input type="checkbox" class="btn-check" name="heated_seat" value="열선시트" id="btn5">
    <label class="btn btn-primary" for="btn5">열선시트</label>
    <br>
    <input type="checkbox" class="btn-check" name="heated_handle" value="열선핸들" id="btn6">
    <label class="btn btn-primary" for="btn6">열선핸들</label>
    <input type="checkbox" class="btn-check" name="ventilated_seat" value="통풍시트" id="btn7">
    <label class="btn btn-primary" for="btn7">통풍시트</label>
    <input type="checkbox" class="btn-check" name="navigation" value="네비게이션" id="btn8">
    <label class="btn btn-primary" for="btn8">네비게이션</label>
    <input type="checkbox" class="btn-check" name="non-smoking_vehicle" value="금연차량" id="btn9">
    <label class="btn btn-primary" for="btn9">금연차량</label>
    <br>
    <input type="checkbox" class="btn-check" name="smart_key" value="스마트키" id="btn10">
    <label class="btn btn-primary" for="btn10">스마트키</label>
    <input type="checkbox" class="btn-check" name="sunroof" value="썬루프" id="btn11">
    <label class="btn btn-primary" for="btn11">썬루프</label>
    <input type="checkbox" class="btn-check" name="rear_warning_light" value="후측방경고등" id="btn12">
    <label class="btn btn-primary" for="btn12">후측방경고등</label>
    <input type="checkbox" class="btn-check" name="Lane_Departure_Prevention" value="차선이탈방지" id="btn13">
    <label class="btn btn-primary" for="btn13">차선이탈방지</label>
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