<!--<%@ page contentType="text/html; charset=UTF-8" %>-->
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->
<!--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>-->
<!--<%@ taglib prefix="util" uri="/ELFunctions" %>-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/support/create.css">
    <link rel="stylesheet" type="text/css" href="/css/support/style.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

</head>

<body>
    <div class="container">
        <header>Car Registration</header>

        <form>
            <div class="form first">
                <div class="details personal">
                    <span class="title">Car Info</span>

                    <div class="fields" id="carinfo">
                        <div class="input-field">
                            <label>Car Number</label>
                            <input type="text" placeholder="Enter Car Number" required>
                        </div>

                        <div class="input-field">
                            <label>Car Name</label>
                            <input type="text" placeholder="Enter Car Name" required>
                        </div>

                        <div class="input-field">
                            <label>Car Category</label>
                            <input type="text" placeholder="Enter Car Category" required>
                        </div>

                        <div class="input-field">
                            <label>Car Seate</label>
                            <input type="text" placeholder="Enter Car Seate" required>
                        </div>

                        <div class="input-field">
                            <label>Car Point</label>
                            <input type="text" placeholder="Enter Car Point" required>
                        </div>

                    </div>

                </div>

                <div class="details ID">
                    <span class="title">Car Image</span>

                    <div class="fields" id="carimage">
                          <div class="form-group">
                            <label class="control-label col-sm-2" for="filenameMF">차이미지</label>
                            <div class="col-sm-6">
                              <input type="file" name="filenameMF" id="filenameMF" class="form-control">
                            </div>
                          </div>
                    </div>

                    <button class="nextBtn">
                        <span class="btnText">Next</span>
                        <i class="uil uil-navigator"></i>
                    </button>
                </div>
            </div>

            <div class="form second">
                <div class="carinfo">
                    <span class="title">Car Option</span>

                    <div class="fields" id="option">
                        <div class="input-field">
                            <label>bluetooth</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>rear_sensor</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>rear_camera</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>black_box</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>heated_seat</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>heated_handle</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>ventilated_seat</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>navigation</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>
                        <div class="input-field">
                            <label>non_smoking_vchicle</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>non_smoking_vchicle</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>non_smoking_vchicle</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>non_smoking_vchicle</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
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

            var url = "/carinfo/create";
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
            var carinfo = document.getElementById("carinfo");
            //Reference all the CheckBoxes in Table.
            var res = carinfo.getElementsByTagName("INPUT");

            // Loop and push the checked CheckBox value in Array.
            for (var i = 0; i < res.length; i++) {
                answer.push(res[i].value);
            }
            return answer;
        }

        function GetRegiste() {
            const answer = new Array();
            var register = document.getElementById("carimage");
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
            var tblFruits = document.getElementById("option");

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