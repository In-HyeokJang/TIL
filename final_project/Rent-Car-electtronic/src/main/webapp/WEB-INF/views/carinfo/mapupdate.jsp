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

    <header>CarMapUpdate</header>
    <form class="form-horizontal" action="/carinfo/mapupdate" method="post" id="mapup">

      <input type="hidden" class="form-control" id="carnumber" name="carnumber" value="${carnumber}">

      <div class="form first">
        <div class="mapupdate">
          <span class="title">Car Option</span>
          <div class="fields" id="option">

            <div class="input-field">
              <label for="carnumber">Car Number</label>
              <input type="text" name="x" id="x" placeholder="Enter 경도" required>
            </div>

            <div class="input-field">
              <label for="carnumber">Car Number</label>
              <input type="text" name="y" id="y" placeholder="Enter 위도" required>
            </div>
            <div class="buttons">
              <button type="submit" id="closebtn" class="btn">Map 수정</button>
            </div>
          </div>
        </div>
    </form>
  </div>
</body>
<script>
  $(function () {
    $("#closebtn").click(function () {
      $('#mapup').submit();
      setTimeout(function () {
      alert("수정했습니다.");
        window.close();
        window.opener.location.reload();
      }, 10);
    });
  });
</script>

</html>