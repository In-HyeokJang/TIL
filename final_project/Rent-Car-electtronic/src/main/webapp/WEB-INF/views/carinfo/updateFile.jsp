<%@ page contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <title>이미지 수정</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    
    <style>
      .h1 {
        display: flex;
        justify-content: center;
      }

      .carimg {
                margin: 10px;
        margin-left: 100px;

      }

      .imginput {
        margin-left: 553px;
      }

      .button {
        display: flex;
        justify-content: center;
        margin-right: 200px;
      }
    </style>
  </head>

  <body>

    <div class="container">

      <h1 class="h1">이미지 수정</h1>
      <form class="form-horizontal" 
      action="/carinfo/updateFile" 
      method="post" 
      enctype="multipart/form-data">

        
        <input type="hidden" name="carnumber" value="${carnumber}">

        <div class="carimg">
          <div class="col-sm-6">
            <img src="${dto.carimage}" class="img-rounded" width="400px" height="260px"">
      </div>
    </div>

    <div class="imginput">
      <label for="filenameMF">Car Image</label>
      <input type="file" name="filenameMF" id="filenameMF" required>

      <div style="border:5px #33FF66 solid;display:none;">
      <input type="text" class="form-control" id="carimage" name="carimage" value="">
      </div>

    </div>

          <div class="button">
            <div class="col-sm-offset-2 col-sm-8">
              <button type="submit" class="btn btn-default">수정</button>
              <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
            </div>
          </div>

      </form>
    </div>
  </body>
  <script>
    // $("#btt").click(function () {
      $("#filenameMF").change(function(){ 
      data = new FormData();
      data.append("filenameMF", $("input[name=filenameMF]")[0].files[0]);

      console.log(data);
      // alert(data);

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
          // function product(){ 
          //   return data.path; }
          

        },
        error: function () {
          alert("1111에러입니다");
        }
      });
    });
</script>
  </html>