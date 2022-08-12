<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <title>Car Update</title>
      <meta charset="utf-8">
      <link rel="stylesheet" type="text/css" href="/css/carinfo/update.css">
    </head>



    <body>

      <div class="container">


        <form class="form-horizontal"
        action="/carinfo/update"
        method="post">

        <input type="hidden" class="form-control" id="carnumber" name="carnumber" value="${dto.carnumber}">
          <h1 class="h1">차 정보 수정</h1>
          <img class="img" src="${dto.carimage}" style="width:400px;" , height="323px;" ,
            margin="90px auto 0 250px">


          <div class="update">

            <div class="form-group">
              <div class="form-group">
                <label class="control-label col-sm-2" for="carnumber">Car Number : </label>
                  ${dto.carnumber}
              </div> <br>

              <div class="form-group">
                <label class="control-label col-sm-2" for="carname">Car Name</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="carname" name="carname" value="${dto.carname}">
                </div>
              </div>


              <div class="form-group">
                <label class="control-label col-sm-2" for="rentcost">Rent Price</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="rentcost" name="rentcost" value="${dto.rentcost}">
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
                  <input type="text" class="form-control" id="caryearmodel" name="caryearmodel"
                    value="${dto.caryearmodel}">
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
              <div class="form-group">
                              <label class="control-label col-sm-2" for="rentstatus">Rent Status</label>
                              <div class="col-sm-6">
                                <input type="text" class="form-control" id="rentstatus" name="rentstatus" value="${dto.rentstatus}">
                              </div>
                            </div>

            </div>
          </div>
          <div class="button">

            <a href="javascript:history.back()">
                뒤로</a>
            <button class="btn btn-default">수정</button>
            <button type="reset" class="btn btn-default">취소</button>
          </div>

        </form>
      </div>
    </body>

    </html>