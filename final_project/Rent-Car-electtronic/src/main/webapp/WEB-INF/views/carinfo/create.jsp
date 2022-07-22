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

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/support/create.css">
  <link rel="stylesheet" type="text/css" href="/css/support/style.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>

<body>
  <div class="container">
    <header>Registration</header>
    <form>

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
              <input type="file" name="filenameMF" id="filenameMF" required>
            </div>

          </div>
          <button class="nextBtn" id="btn2">
          <button id="btn3">123</button>
            <span class="btnText">Next</span>
            <i class="uil uil-navigator"></i>
          </button>
        </div>
      </div>
      <!--first end-->

      <div class="form second">
        <div class="carpotion">
          <span class="title">Car Option</span>

          <div class="fields" id="option">

            <div class="input-field">
              <label for="carnumber">Car Number</label>
              <input type="text" name="carnumber" placeholder="Enter Car Number">
            </div>

            <div class="input-field">
              <label>bluetooth</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>rear_sensor</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>rear_camera</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>black_box</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>heated_seat</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>heated_handle</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>ventilated_seat</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>navigation</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>non_smoking_vehicle</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>smart_key</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>sunroof</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>rear_warning_light</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
            <div class="input-field">
              <label>Lane_Departure_Prevention</label>
              <input type="checkbox" name="checkbox" class="cm-toggle" value="1" required>
            </div>
          </div>
          <div class="buttons">
            <div class="backBtn">
              <i class="uil uil-navigator"></i>
              <span class="btnText">Back</span>
            </div>

            <button class="sumbit" id="btn1" onclick="getInfo()">
              <span class="btnText">Submit</span>
              <i class="uil uil-navigator"></i>
            </button>
          </div>
        </div>
      </div>
      <!--second end-->
    </form>
  </div>
  <script src="/js/asd.js"></script>

<!--
  <script>
    const form = document.querySelector("form"),
      nextBtn = form.querySelector(".nextBtn"),
      backBtn = form.querySelector(".backBtn"),
      allInput = form.querySelectorAll(".first input");

    nextBtn.addEventListener("click", () => form.classList.add('secActive'));
    backBtn.addEventListener("click", () => form.classList.remove('secActive'));
  </script>



  <script type="text/javascript">

    async function getInfo() {
      const answer = GetWrited();
      const selected = GetSelected();
      // data 를 체크 해서 null값이 있다면 
      // 페이지 새로고침?!
      answer.forEach(data => {
        if (data.value == "") {
          console.log("data")
          location.reload();
        }
      })

      data = {
        answer: answer,
        selected: selected
      };

      var url = "/carinfo/create";
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
      }).then((res) => {
        if (res.status == 200) {
          alert("등록했습니다.");
          window.close();
        }
      }).catch(() => {
        alert("잠시후 다시 시도해 보세요.");
        window.close();
      });
      location.reload();
    }

    function GetWrited() {
      const answer = new Array();
      var carinfo = document.getElementById("carinfo");
      //Reference all the CheckBoxes in Table.
      console.log(carinfo);
      alert(carinfo);

      var res = carinfo.getElementsByTagName("input");

      // Loop and push the checked CheckBox value in Array.
      for (var i = 0; i < res.length; i++) {
        answer.push(res[i].value);
      }
      return answer;
    }

    function GetSelected() {
      var selected = new Array();
      //Reference the Table.
      var tblFruits = document.getElementById("option");

      //Reference all the CheckBoxes in Table.
      var chks = tblFruits.getElementsByTagName("INPUT");

      // Loop and push the checked CheckBox value in Array.
      for (var i = 0; i < chks.length; i++) {
        if (chks[i].checked) {
          selected.push(chks[i].value);
        } else {
          selected.push('0');
        }
      }

      return selected;
    };

  </script>
-->
</body>

</html>