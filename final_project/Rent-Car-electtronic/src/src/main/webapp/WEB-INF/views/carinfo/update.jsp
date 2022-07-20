<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Car Update</title>
  <meta charset="utf-8">
</head>
<body>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">차 정보 수정</h1>
<form class="form-horizontal"
      action="/carinfo/update"
      method="post">

<div class="form-group">
    <label class="control-label col-sm-2" for="carnumber">차번호</label>
    <div class="col-sm-8">
      <input type="text" name="carnumber" id="carnumber" class="form-control" value="${dto.carnumber}" >
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="carname">차이름</label>
    <div class="col-sm-8">
      <input type="text" name="carname" id="carname" class="form-control" value="${dto.carname }" >
    </div>
  </div>

  <div class="form-group">
      <label class="control-label col-sm-2" for="carprice">렌트 비용</label>
      <div class="col-sm-8">
        <input type="text" name="carprice" id="carprice" class="form-control" value="${dto.carprice }" >
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
   <div class="col-sm-offset-2 col-sm-5">
    <button type="submit" class="btn btn-default">수정</button>
    <button type="reset" class="btn">취소</button>
     <a href="javascript:history.back()">
        <img class='btn' src="/svg/arrow-return-left.svg"/>뒤로</a>
   </div>
 </div>
</form>
</div>
</body>
</html>