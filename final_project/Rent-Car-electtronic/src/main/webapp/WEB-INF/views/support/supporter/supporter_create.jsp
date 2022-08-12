<%@ page contentType="text/html; charset=UTF-8" %>
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
        <header>Registration</header>

        <form>
            <div class="form first">
                <div class="details personal">
                    <span class="title">Vehicle Info</span>

                    <div class="fields" id="vehicle">
                        <div class="input-field">
                            <label>Vehicle Number</label>
                            <input type="text" placeholder="Enter your Number" required>
                        </div>

                        <div class="input-field">
                            <label>Production date</label>
                            <input type="date" placeholder="Enter birth date" required>
                        </div>

                        <div class="input-field">
                            <label>Brand</label>
                            <input type="text" placeholder="Enter your brad" required>
                        </div>

                        <div class="input-field">
                            <label>Model</label>
                            <input type="text" placeholder="Enter mobile Model" required>
                        </div>
                    </div>

                </div>

                <div class="details ID">
                    <span class="title">Register Info</span>

                    <div class="fields" id="charge">
                        <div class="input-field">
                            <label>DC 콤보</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>DC차 데모</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>AC 3상</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                        <div class="input-field">
                            <label>완속</label>
                            <input type="checkbox" name="checkbox" class="cm-toggle" value="1">
                        </div>

                    </div>

                    <button class="nextBtn">
                        <span class="btnText">Next</span>
                        <i class="uil uil-navigator"></i>
                    </button>
                </div>
            </div>

            <div class="form second">
                <div class="vehicle">
                    <span class="title">Register Details</span>

                    <div class="fields" id="register">
                        <div class="input-field">
                            <label>Branch</label>
                            <input type="text" placeholder="Enter Branch" required>
                        </div>

                        <div class="input-field">
                            <label>Cheif</label>
                            <input type="text" placeholder="Enter Cheif" required>
                        </div>

                        <div class="input-field">
                            <label>Branch Phone Number</label>
                            <input type="text" placeholder="Enter Branch Phone Number" required>
                        </div>

                        <div class="input-field">
                            <label>Address</label>
                            <input type="text" placeholder="Enter your Branch Address" required>
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

            var url = "/admin/support/create_supporter";
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            }).then((res) => {
                if (res.ok()) {
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
                } else {
                    selected.push('0');
                }
            }

            return selected;
        };


        
    </script>

</body>

</html>