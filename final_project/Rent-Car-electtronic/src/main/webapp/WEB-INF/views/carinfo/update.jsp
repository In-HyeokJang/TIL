<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Car Update</title>
  <meta charset="utf-8">
</head>
<style>
  .container{
    display: flex;
          justify-content: center;

  }
  .update {
    font-weight: 700;
    font-size: 1.2rem;
    margin: -350px 0 30px 550px;
    font-family: Roboto,sans-serif !important;
}

.h1{
  margin-left: 300px;
    margin-bottom: 50px;
}
.button{
  margin-left: 350px;
}
</style>
<body>

<div class="container">


<form class="form-horizontal"
      action="/carinfo/update"
      method="post">

      <h1 class="h1">차 정보 수정</h1>
     <img class="img" src="/carinfo/storage/${dto.carimage}"
   style="width:400px;", height="323px;", margin="90px auto 0 250px">


   <div class="update">

    <div class="form-group">

        <div class="form-group">
          <label class="control-label col-sm-2" for="carname">Car Name</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="carname" name="carname" value="${dto.carname}">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="carnumber">Car Number</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="carnumber" name="carnumber" value="${dto.carnumber}">
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-2" for="carprice">Rent Price</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="carprice" name="carprice" value="${dto.carprice}">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="category">Car category</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="category" name="category" value="${dto.category}">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="caryearmodel">Car Year Model</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="caryearmodel" name="caryearmodel" value="${dto.caryearmodel}">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="carseate">Car Seate</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="carseate" name="carseate" value="${dto.carseate}">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="carpoint">Car Point</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" id="carpoint" name="carpoint" value="${dto.carpoint}">
          </div>
        </div>
</div>
</div>
 
 <div class="form-group">        
  <div class="col-sm-offset-2 col-sm-5">
    <button type="submit" class="btn btn-default">등록</button>
    <button type="reset" class="btn btn-default">취소</button>
    <a href="javascript:history.back()">
    <img class='btn' src="/svg/arrow-return-left.svg"/>뒤로</a>
  </div>
</div>
</form>
</div>
</body>
</html>