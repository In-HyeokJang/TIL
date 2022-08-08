<!--<%@ page contentType="text/html; charset=UTF-8" %>-->
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->
<!--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>-->
<!--<%@ taglib prefix="util" uri="/ELFunctions" %>-->

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Car Update</title>
  <meta charset="utf-8">

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/support/create.css">
  <link rel="stylesheet" type="text/css" href="/css/support/style.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>

<body>
  <div class="container">

  <header>CarOption</header>
    <form class="form-horizontal"
    action="/carinfo/optupdate"
    method="post"
    id="opt">

<input type="hidden" class="form-control" id="carnumber" name="carnumber" value="${carnumber}">

    <div class="form first">
      <div class="carpotion">   
        <span class="title">Car Option</span>
          <div class="fields" id="option">

            <div class="input-field">
              <label>bluetooth</label>
              <input type="checkbox" name="bluetooth" class="cm-toggle" value="블루투스" >
            </div>
            <div class="input-field">
              <label>rear_sensor</label>
              <input type="checkbox" name="rear_sensor" class="cm-toggle" value="후방센서" >
            </div>
            <div class="input-field">
              <label>rear_camera</label>
              <input type="checkbox" name="rear_camera" class="cm-toggle" value="후방카메라" >
            </div>
            <div class="input-field">
              <label>black_box</label>
              <input type="checkbox" name="black_box" class="cm-toggle" value="블랙박스" >
            </div>
            <div class="input-field">
              <label>heated_seat</label>
              <input type="checkbox" name="heated_seat" class="cm-toggle" value="열선시트" >
            </div>
            <div class="input-field">
              <label>heated_handle</label>
              <input type="checkbox" name="heated_handle" class="cm-toggle" value="열선핸들" >
            </div>
            <div class="input-field">
              <label>ventilated_seat</label>
              <input type="checkbox" name="ventilated_seat" class="cm-toggle" value="통풍시트" >
            </div>
            <div class="input-field">
              <label>navigation</label>
              <input type="checkbox" name="navigation" class="cm-toggle" value="네비게이션" >
            </div>
            <div class="input-field">
              <label>non_smoking_vehicle</label>
              <input type="checkbox" name="non_smoking_vehicle" class="cm-toggle" value="금연차량" >
            </div>
            <div class="input-field">
              <label>smart_key</label>
              <input type="checkbox" name="smart_key" class="cm-toggle" value="스마트키" >
            </div>
            <div class="input-field">
              <label>sunroof</label>
              <input type="checkbox" name="sunroof" class="cm-toggle" value="썬루프" >
            </div>
            <div class="input-field">
              <label>rear_warning_light</label>
              <input type="checkbox" name="rear_warning_light" class="cm-toggle" value="후방경고등" >
            </div>
            <div class="input-field">
              <label>lane_departure_prevention</label>
              <input type="checkbox" name="lane_departure_prevention" class="cm-toggle" value="차선방지이탈" >
            </div>
          </div>

          <div class="buttons">
           <button type="submit" id="closebtn" class="btn">Option 수정</button>
          </div>
        </div>
      </div>
    </form>
  </div>
</body>
<script>

// $("#closebtn").click(function(){
//  var bluetooth = document.querySelector("input[name=bluetooth ]").value;
//  var rear_sensor = document.querySelector("input[name=rear_sensor ]").value;
//  var rear_camera = document.querySelector("input[name=rear_camera]").value;
//  var black_box  = document.querySelector("input[name=black_box]").value;
//  var heated_seat = document.querySelector("input[name=heated_seate]").value;
//  var heated_handle  = document.querySelector("input[name=heated_handle]").value;
//  var ventilated_seat  = document.querySelector("input[name=ventilated_seat]").value;
//   var navigation  = document.querySelector("input[name=navigation]").value;
//  var non_smoking_vehicl = document.querySelector("input[name=non_smoking_vehicl]").value;
//  var smart_key  = document.querySelector("input[name=smart_key]").value;
//  var sunroof  = document.querySelector("input[name=sunroof]").value;
//  var rear_warning_light   = document.querySelector("input[name=rear_warning_light]").value;
//  var lane_departure_prevention   = document.querySelector("input[name=lane_departure_prevention]").value;

//      var data = {
// 		"carnumber" : carnumber,
// 		"bluetooth" : bluetooth,
// 		"rear_sensor" : rear_sensor,
// 		"rear_camera" : rear_camera,
// 		"black_box" : black_box,
// 		"heated_seat" : heated_seat,
// 		"heated_handle" : heated_handle,
// 		"navigation" : navigation,
// 		"ventilated_seat" : ventilated_seat,
// 		"non_smoking_vehicl" : non_smoking_vehicl,
// 		"smart_key" : smart_key,
// 		"sunroof" : sunroof,
// 		"rear_warning_light" : rear_warning_light,
// 		"lane_departure_prevention" : lane_departure_prevention
// 	}
// $.ajax({

//         type : "post",
// 	    url : "/carinfo/optupdate",
// 	    data : JSON.stringify(data),
// 	    //data: data,
// 	    // dataType:"json",
// 	    contentType: "application/json",
// 	    success:function(){
// 		   console.log('성공입니다.');
// 		   alert("성공이비다");
// 	    },
// 	    error:function(){
// 	        alert("에러입니다");
// 	    }
// 	});
    // setTimeout(function() {
    //   alert("수정되었습니다.");
    //   window.close();
    //  window.opener.location.reload();
    // }, 0);
  // });

  $(function() {

$("#closebtn").click( function() {
     $('#opt').submit();
     setTimeout(function() {   
         window.close();
         window.opener.location.reload();
      }, 100);
  });

});

</script>
</html>