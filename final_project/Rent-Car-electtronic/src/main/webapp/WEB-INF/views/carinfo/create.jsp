<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html>

    <head>
      <title>자동차등록</title>
      <meta charset="utf-8">

      <script src="https://code.jquery.com/jquery-latest.min.js"></script>
      <link rel="stylesheet" type="text/css" href="/css/support/create.css">
      <link rel="stylesheet" type="text/css" href="/css/support/style.css">
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    </head>

    <body>
      <div class="container">
        <h1 class="col-sm-offset-2 col-sm-10">자동차 등록</h1>

        <form class="form-horizontal"
        action="/carinfo/create"
        method="post" 
        enctype="multipart/form-data">


          <div class="form first">

            <div class="details carinfo">
              <span class="title">Car Info</span>

              <div class="fields" id="carinfo">

                <div class="input-field">
                  <label for="carnumber">Car Number</label>
                  <input type="text" name="carnumber" id="carnumber" placeholder="Enter Car Number" required>
                </div>

                <div class="input-field">
                  <label for="carname">Car Name</label>
                  <input type="text" name="carname" id="carname" placeholder="Enter Car Name" required>
                </div>

                <div class="input-field">
                  <label for="rentcost">Car Rent Cost</label>
                  <input type="text" name="rentcost" id="rentcost" placeholder="Enter Car Rent Cost" required>
                </div>

                <div class="input-field">
                  <label for="category">Car Category</label>
                  <input type="text" name="category" id="category" placeholder="Enter Car Category" required>
                </div>

                <div class="input-field">
                  <label for="caryearmodel">Car Year Model</label>
                  <input type="text" name="caryearmodel" id="caryearmodel" placeholder="Enter Car Year Model" required>
                </div>

                <div class="input-field">
                  <label for="carseate">Car Seate</label>
                  <input type="text" name="carseate" id="carseate" placeholder="Enter Car Seate" required>
                </div>

                <div class="input-field">
                  <label for="carpoint">Car Point</label>
                  <input type="text" name="carpoint" id="carpoint" placeholder="Enter Car Point" required>
                </div>

                <div class="input-field">
                  <label for="carpoint">Rent Status</label>
                  <input type="text" name="rentstatus" id="rentstatus" placeholder="Enter Rent Status" required>
                </div>
                <div class="input-field">
                  <label for="carpoint">Rent Status</label>
                  <input type="text" name="x" id="x" placeholder="Enter 경도" required>
                </div>
                <div class="input-field">
                  <label for="carpoint">Rent Status</label>
                  <input type="text" name="y" id="y" placeholder="Enter 위도" required>
                </div>

                <div class="input-field">
                  <label for="filenameMF">Car Image</label>
                  <input type="file" name="filenameMF" id="filenameMF" required>

                  <div style="border:5px #33FF66 solid;display:none;">
                  <input type="text" class="form-control" id="carimage" name="carimage" value="">
                  </div>

                </div>
              </div>

              <div class="buttons">
                <button class="btn" id="btt">다음</button>
                <button type="reset" class="btn">취소</button>
              </div><!-- button div end -->
            </div>
          </div><!-- first div end -->
        </form>
        
      </div>
    </body>
<script>
        $("#filenameMF").change(function(){
        data = new FormData();
        data.append("filenameMF", $("input[name=filenameMF]")[0].files[0]);
        console.log(data);

        $.ajax({
          data: data,
          type: "POST",
          url: "/carinfo/resource",
          contentType: false,
          processData: false,
          success: function (data) {
            console.log(data);
            console.log(data.path);
            document.querySelector("#carimage").value = data.path;
          },
          error: function () {
            alert("1111에러입니다");
          }
        });
      });
</script>
    </html>