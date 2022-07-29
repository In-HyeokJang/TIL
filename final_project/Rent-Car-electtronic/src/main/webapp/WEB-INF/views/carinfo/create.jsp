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
        enctype="multipart/form-data"
        onsubmit="return checkIn(this)"
        >


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
                  <label for="carprice">Car Rent Price</label>
                  <input type="text" name="carprice" id="carprice" placeholder="Enter Car Rent Price" required>
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
                  <label for="filenameMF">Car Image</label>
                  <input type="file" name="carimage" id="filenameMF" required>
                </div>
              </div>

            <div class="buttons">
                <button class="btn">다음</button>
                <button type="reset" class="btn">취소</button>
              </div><!-- button div end -->
              
              </div>
            </div><!-- first div end -->
        </form>
      </div>
    </body>
    <script>

    $("#btn").click(function(){

    var data = document.querySelector("#filenameMF").value;
    console.log(data);

    $.ajax({
    data: data,
    type: "POST",
    url: "/s3/resource",
    contentType: false,
    processData: false,
    success: function (data)


    {alert("성공");
    },
    error: function () {
    alert("1111에러입니다"); }
     });
     });


    </script>

    </html>