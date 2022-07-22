<!--<%@ page contentType="text/html; charset=UTF-8" %>-->
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->
<!--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>-->
<!--<%@ taglib prefix="util" uri="/ELFunctions" %>-->

<!DOCTYPE html>
<html lang="en">

<head>
  <title>자동차등록</title>
  <meta charset="utf-8">

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="/css/support/create.css">
  <link rel="stylesheet" type="text/css" href="/css/support/style.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>

<body>
  <div class="container">
    <header>Registration</header>
    <form>
      <div class="form">
        <div class="carpotion">
          <span class="title">Car Option</span>

          <div class="fields" id="option">

            <div class="input-field">
              <label for="carnumber">Car Number</label>
              <input type="text" name="carnumber" placeholder="Enter Car Number">
            </div>

            <div class="input-field">
              <label>bluetooth</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>rear_sensor</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>rear_camera</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>black_box</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>heated_seat</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>heated_handle</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>ventilated_seat</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>navigation</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>non_smoking_vehicle</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>smart_key</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>sunroof</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>rear_warning_light</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
            <div class="input-field">
              <label>Lane_Departure_Prevention</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" >
            </div>
          </div>
            <button type="submit" class="btn btn-default">등록</button>
          </div>
        </div>
      </div>
    </form>
  </div>



</body>

</html>