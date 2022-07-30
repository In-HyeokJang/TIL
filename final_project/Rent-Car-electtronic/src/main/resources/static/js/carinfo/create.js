      $("#btt").click(function () {
        // filenameMF.name = "file";
        var file = new FormData($("#car")[0]);
        file.append("carimage", $("input[name=carimage]")[0].files[0]);


        console.log(file);



        $.ajax({
          data: file,
          type: "POST",
          url: "/s3/resource",
          contentType: false,
          processData: false,
          success: function (file) {
            alert("성공");
          },
          error: function () {
            alert("1111에러입니다");
          }
        });
      });
