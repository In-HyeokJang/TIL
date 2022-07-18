<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html>

    <head>
      <title>자동차등록</title>
      <meta charset="utf-8">
    </head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/support/create.css">
    <link rel="stylesheet" type="text/css" href="/css/support/style.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <body>
      <div class="container">
        <header>Registration</header>
        <form class="form-horizontal" action="/carinfo/create" method="post" enctype="multipart/form-data"
          onsubmit="return checkIn(this)">

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
                  <label for="category">Car Category</label>
                  <input type="text" name="category" id="category" placeholder="Enter Car Category" required>
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
                  <input type="file" name="filenameMF" id="filenameMF" placeholder="Enter Car Image" required>
                </div>
              </div>

              <button class="nextBtn">
                <span class="btnText">Next</span>
                <i class="uil uil-navigator"></i>
              </button>
            </div>
          </div>

          <div class="form second">
            <div class="carpotion">
              <span class="title">Car Option</span>

              <div class="fields" id="option">

                <div class="input-field">
                  <label for="bluetooth">bluetooth</label>
                  <input type="checkbox" name="checkbox" id="bluetooth" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="rear_sensor">rear_sensor</label>
                  <input type="checkbox" name="checkbox" id="rear_sensor" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="rear_camera">rear_camera</label>
                  <input type="checkbox" name="checkbox" id="rear_camera" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="black_box">black_box</label>
                  <input type="checkbox" name="checkbox" id="black_box" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="heated_seat">heated_seat</label>
                  <input type="checkbox" name="checkbox" id="heated_seat" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="heated_handle">heated_handle</label>
                  <input type="checkbox" name="checkbox" id="heated_handle" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="ventilated_seat">ventilated_seat</label>
                  <input type="checkbox" name="checkbox" id="ventilated_seat" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="navigation">navigation</label>
                  <input type="checkbox" name="checkbox" id="navigation" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="non_smoking_vehicle">non_smoking_vehicle</label>
                  <input type="checkbox" name="checkbox" id="non_smoking_vehicle" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="smart_key">smart_key</label>
                  <input type="checkbox" name="checkbox" id="smart_key" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="sunroof">sunroof</label>
                  <input type="checkbox" name="checkbox" id="sunroof" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="rear_warning_light">rear_warning_light</label>
                  <input type="checkbox" name="checkbox" id="rear_warning_light" class="cm-toggle" value="1">
                </div>
                <div class="input-field">
                  <label for="Lane_Departure_Prevention">Lane_Departure_Prevention</label>
                  <input type="checkbox" name="checkbox" id="Lane_Departure_Prevention" class="cm-toggle" value="1">
                </div>
              </div>
              <div class="buttons">
                <div class="backBtn">
                  <i class="uil uil-navigator"></i>
                  <span class="btnText">Back</span>
                </div>

                <button class="sumbit" onclick="getInfo()">
                  <span class="btnText">Submit</span>
                  <i class="uil uil-navigator"></i>
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
      
      <script>
        const form = document.querySelector("form"),
            nextBtn = form.querySelector(".nextBtn"),
            backBtn = form.querySelector(".backBtn"),
            allInput = form.querySelectorAll(".first input");


        nextBtn.addEventListener("click", () => {
            allInput.forEach(input => {
                if (input.value != "") {
                    form.classList.add('secActive');
                } else {
                    form.classList.remove('secActive');
                }
            })
        })
        backBtn.addEventListener("click", () => form.classList.remove('secActive'));
    </script>
    <script type="text/javascript">
        async function getInfo() {
            const answer = GetWrited();
            const selected = GetSelected();
            const registe = GetRegiste();

            data = {
                answer: answer,
                selected: selected,
                registe: registe
            };

            var url = "/support/create_supporter";
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then((res) => { if (res.ok) { window.close(); } })
                .catch("잠시후 다시 시도해 보세요.");
        }

        function GetWrited() {
            const answer = new Array();
            var vehicle = document.getElementById("vehicle");
            //Reference all the CheckBoxes in Table.
            var res = vehicle.getElementsByTagName("INPUT");

            // Loop and push the checked CheckBox value in Array.
            for (var i = 0; i < res.length; i++) {
                answer.push(res[i].value);
            }
            return answer;
        }

        function GetRegiste() {
            const answer = new Array();
            var register = document.getElementById("register");
            //Reference all the CheckBoxes in Table.
            var res = register.getElementsByTagName("INPUT");

            // Loop and push the checked CheckBox value in Array.
            for (var i = 0; i < res.length; i++) {
                answer.push(res[i].value);
            }
            return answer;
        }

        function GetSelected() {
            var selected = new Array();
            //Reference the Table.
            var tblFruits = document.getElementById("charge");

            //Reference all the CheckBoxes in Table.
            var chks = tblFruits.getElementsByTagName("INPUT");

            // Loop and push the checked CheckBox value in Array.
            for (var i = 0; i < chks.length; i++) {
                if (chks[i].checked) {
                    selected.push(chks[i].value);
                }
            }

            return selected;
        };

    </script>
    
    </body>

    </html>