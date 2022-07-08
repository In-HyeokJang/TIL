<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>자동차등록</title>
  <meta charset="utf-8">
    <script type="text/JavaScript">
   $(function() {
  	 CKEDITOR.replace('detail'); // <TEXTAREA>태그 id 값
  	 });

   function checkIn(f){
       if (f.carname.value == ""){
               alert("차이름을 입력하세요");
               f.carname.focus()
               return false;
       }
       if (f.carnumber.value == ""){
               alert("차번호를 입력하세요");
               f.carnumber.focus()
                return false;
       }
       if (f.carseate.value == ""){
                alert("좌석수를 지정해 주세요");
                f.carseate.focus()
                return.fales;

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
        <input type="text" name="carnumber" id="carnumber" class="form-control">
      </div>
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="carname">자동차이름</label>
    <div class="col-sm-8">
      <input type="text" name="carname" id="carname" class="form-control">
    </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2" for="category">차 종류</label>
      <div class="col-sm-8">
        <input type="text" name="category" id="category" class="form-control">
      </div>
    </div>
      <div class="form-group">
          <label class="control-label col-sm-2" for="carseate">좌석 수</label>
          <div class="col-sm-8">
            <input type="text" name="carseate" id="carseate" class="form-control">
          </div>
       </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="carpoint">지점</label>
    <div class="col-sm-6">
      <input type="text" name="carpoint" id="carpoint" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">차이미지</label>
    <div class="col-sm-6">
      <input type="file" name="filenameMF" id="filenameMF" class="form-control">
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