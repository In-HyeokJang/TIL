// alert("hi");
// hello;
// "hello " + "my name is Ethan";
// console.log(5454545454);
// console.log("lalalalal");
// console.log('asasfa');
// console.log(5+2);
// console.log(5*2);
// console.log(5/2);


// const : (상수, variable) 변함 없는 값 
// let : (상수, variable) 값을 변경 할 수 있음
// var : 언제든지 업데이트 가능 (뭐에 사용하는지 잘 알 수 없음 그래서 잘 사용 x)
// const a = 5;
// let b = 2;
// var myName = "Ethan";

// console.log(a + b);
// console.log(a * b);
// console.log(a / b);
// console.log("hello"+ myName);

// b =3 
// console.log(a + b);
// console.log(a * b);
// console.log(a / b);

// myName = "EthanJang";
// console.log("your name " + myName);

// Boolean
// true or false or null
// null 값이 없는 것으로 채워졌다 뜻
// const amIFat = null; 
// let something ; //undefined
// undefined 메모리 값은 있지만 비어 있다는 뜻
// console.log(something, amIFat);

// Arrays(배열)
// const mon ="mon";
// const tue = "tue";
// const wed = "wed";
// const thu = "thu";
// const fri = "fri";
// const sat = "sat";
// const sun = "sun";

// const days0fWeek = ["mon", "tue", "wed", "thu", "fri", "sat"];

// // const nonsense = [1, 2, "hello" , false, null, true, undefined, "ethan"]

// // console.log(days0fWeek, nonsense);
// // array []안 0부터 시작 

// // console.log(days0fWeek[4]);

// // Get Item fram Array
// console.log(days0fWeek);

// // Add on more day to the array
// // 배열에 추가 하는 법
// days0fWeek.push("sun");

// console.log(days0fWeek);

// const toBuy = ["ptoato", "tomato", "pizza"];
// toBuy.push("kimbab");
// console.log(toBuy[2]);
// console.log(toBuy[123456]); //undefined
// console.log(toBuy);

// Objects
// const playerName = "kaka";
// const playerPoints = 1212;
// const playerHandsome = true;
// const playerFat = "little bit";

// player.name
// player.points
// player.handsome

// const player = ["kaka",1212,false,"little bit"];

// const player = {
//     name:"kakak",
//     points: 10,
//     fat: true,
// };
// // ==
// // player.name
// // player.points
// // player.handsome

// // console.log(player);
// // console.log(player.name);
// console.log(player);
// // player = false; 에러남
// player.fat = false; //const 안에 object 수정 가능
// player.lastName = "potato"; // 추가 가능
// player.points = player.points + 15; //update 가능
// console.log(player.points);

// Functions part one
// 캡슐화 해서 계속 반복 할수 있게 해준다
// function sayHello(){
//     console.log("Hello my name is C");
// }

// // alert();
// // console.log();
// //function 실행 코드
// // sayHello();

// sayHello("kaka");
// sayHello("dad");
// sayHello("ekek");

// Function part Two
// function 적용 시켜 log 출력 하는법
// argument 생성 추가 시켜 출력할수 있음
// function sayHello(nameOfPerson, age){
//     console.log("Hello my name is " 
//     + nameOfPerson + "and I'm "+ age);
// }

// sayHello("kaka", 10);
// sayHello("dad", 23);
// sayHello("ekek", 13);

// function puls(fisrtNumber, secondNumber){
//     console.log(fisrtNumber + secondNumber);
// }
// // console.log(firstNumber); 오류 코드 function 안에서 사용해야함
// function divide(a,b){
//     console.log(a /b);
// }
// // function()에 데이터 넣는법
// puls(10, 20);
// divide(98, 20);

// const player = {
//     name : "kakak",
//     sayHello : function(otherPersonName) {
//         console.log("hello!" + otherPersonName + " nice to meet you!");
//     },
// };

// console.log(player.name); // funciton 출력하는법
// player.sayHello("lynn"); // function 넣는법
// player.sayHello("budi");


// function plus(a, b){
//     console.log(a + b);
// }
// //데이터를 function안으로 보내주는 법
// plus(5,5);


// Recap

// const a = 5;
// const isKakaFat = true;
// const d = null; // "비어있다" 할 때 사용
// // let hello;
// // console.log(hello);
// //undefined 는 안에 진짜 비어있다
// // var  사용 금지!!!

// console.log(a);
// isKakaFat = false; err // const ->let으로 변동 하면 가능

//array
// const arr = [1,2,false,true, null, undefined, "text, me"];
// const toBuy = ["potato", "pizza", "apple"];
// console.log(toBuy[2]); // 배열 출력
// toBuy[2] = "water"; // arr [] update
// console.log(toBuy); // 수정 후 배열 출력
// toBuy.push("one") // arr insert
// console.log(toBuy);

// property 묶기
// const player = {
//     name : "Kaka",
//     age : 100,
// };
// console.log(player);
// player.name = "buya"; //update
// // console.log(player, console);
// console.log(player.name = "kaupu"); // property update
// player.sexy = "soon"; //insert
// console.log(player);

//function
// function plus(a, b){ // a,b  표시언에 수정 가능
//     console.log(a + b);
// }

// // plus(); // function 실행
// // alert("dkfkdk"); // alert받기
// plus(5, 10) // a,b insert
// plus(234,12340) // a,b insert

//funciton 만들고 data 받는법
// function minusFive(pap){
//     console.log(pap -5);
// };

// console.log(pap -5); // err // function 안에 만들어야함
// minusFive(1,2,3,4,5,6,7,234); // 1만 받음


// +, -, /, *, **만들기
// const calculator = {
//     add : function (a, b){
//         console.log(a+b);
//     },
//     minus : function(a,b){
//         console.log(a-b);
//     },
//     div : function(a,b){
//         console.log(a/b);
//     },
//     multi : function(a,b){
//         console.log(a*b);
//     },
//     power : function (a, b) {
//         console.log(a**b);
//     }
// };
// calculator.add(5, 1);
// calculator.minus(10,2);
// calculator.div(10,5);
// calculator.multi(1,2);
// calculator.power(1,5);

// Returns

// const calculator = {
//     add : function (a, b){
//         return a+b;
//     },
//     minus : function(a,b){
//         return a-b;
//     },
//     div : function(a,b){
//         return a/b;
//     },
//     multi : function(a,b){
//         return a*b;
//     },
//     power : function (a, b) {
//         return a**b;
//     }
// };

// const plusResult = calculator.add(2,3);
// const minusResult = calculator.minus(plusResult,10);
// const divResult = calculator.div(10,minusResult);
// const multiResult = calculator.multi(divResult,plusResult);
// const powerResult = calculator.power(divResult,minusResult);

// // // calculator.add(5, 1);
// // // calculator.minus(10,2);
// // // calculator.div(10,5);
// // // calculator.multi(1,2);
// // // calculator.power(1,5);

// // console.log(calculator.add(2,3));


// const age = 95;
// function calculateKrAge(ageOfForeigner){ //95
//     ageOfForeigner + 2;  // return 95 + 2
//     return "hello";
// }

// const krAge = calculateKrAge(age); // 95

// console.log(krAge); // 97 //hello

// Conditionals (if,else 조건문)
    // const age =prompt("How old are you?"); // 오래된 방식
    // const age = parseInt( prompt("How old are you?"));

    // console.log(isNaN(age));
// isNaN number 타입인지 아닌지 blooean을 반환해서 알려줌 true number가 아님 fales number
    // console.log(age, parseInt(age)); 
// typeof 어떤 타입인지 볼 수 있음
// parseInt int로 변환 해주는 작업을 함

// true || true === true
// true || false === true
// false || true === true
// false || false == false

// true && true == true
// true && false == false
// false && true == false
// false && false == false

// if(isNaN(age) || age <0){
//     console.log("Please write a real positive number");
//     // condition === true
//     // || 경우 둘중 하나가 true경우 실행, 둘다 true여도 true
// }else if(age < 18){
//     console.log("You are too young.");
// }else if(age >= 18 && age <= 50) { 
//     // true && true 경우 실행
//     console.log("You cnn drink ")
// }else if(age > 50 && age <=80){
//     console.log("You should exercise");
// }else if(age === 100){
//     console.log("wow you are wise");
// }else if(age > 80){
//     console.log("You can do whatever you want");
// }

//HTML in Javascript
// document.title = "Hello! Frome JS!";

// const title = document.getElementById("something");


// // console.dir(title);
// title.innerText = "Got you!"; //text변경

// console.log(title.id);
// console.log(title.className);

// const hellos = document.getElementsByClassName("hello");

// console.log(hellos);

// const title = document.getElementsByTagName("h1");
// const title = document.querySelector(".hello h1");

// const h1 = document.querySelector("div.hello:first-child h1");
// const title = document.getElementById("hello");
// console.dir(title);

// title.style.color = "blue";

// title.innerText = "hello";

// console.dir(title);

// 클릭 이벤트 주는법
// function handleTitleClick(){
    // console.log("title was clicked!");
    // console.log(h1.style.color);
    // h1.style.color = "blue";
    // console.log(h1.style.color);

    // CSS : Javascript에서 사용하는거 별로 선호 안함
    // const currentColor = h1.style.color;
    // let newColor;
    // if(currentColor === "blue"){
    //     newColor = "tomato";
    // }else{
    //     newColor = "blue";
    // }
    // h1.style.color = newColor;

    // h1.className = "active";
    // const clickedClass = "clicked";
    // if(h1.classList.contains (clickedClass)){
    //     h1.classList.remove(clickedClass);
    // } else{
    //     h1.classList.add(clickedClass);
    // }

    // 위에 작성한 if문을 toogle로 한줄로 끝낼수 있음
//     h1.classList.toggle("clicked");
// }
// h1.addEventListener("click", handleTitleClick);

// function hadleMouseEnter(){
//     console.log("mouse is here!");
// }

// function hadleMouseEnter(){
//     h1.innerText = "Mouse is here!";
// }

// function heandleMouseLeave(){
//     h1.innerText = "Mouse is gone!";
// }

// function handleWindowResize(){
//     document.body.style.backgroundColor = "tomato";
// }

// function handleWindowCopy(){
//     alert("copeier!");
// }

// function handleWindowOffline(){
//     alert("SOS no Wife")
// }

// function handleWindowOnline(){
//     alert("ALL GOOOOD")
// }

// h1.addEventListener("click", handleTitleClick);
// h1.onClick("click", handleTitleClick);
// title.onclick = handleTitleClick;
// h1.addEventListener("mouseenter",hadleMouseEnter); // 누가 마우스 올리면 글 변경
// title.onmouseenter = hadleMouseEnter;
// h1.addEventListener("mouseleave",heandleMouseLeave); // 누가 글에 마우스 치우면 변경

// window.addEventListener("resize", handleWindowResize); //화면크기 변경 하면 이벤트 발생
// window.addEventListener("copy", handleWindowCopy); //copy하면 이벤트 발생
// window.addEventListener("offline", handleWindowOffline);
// window.addEventListener("online", handleWindowOnline);

// const loginForm = document.getElementById("login-form");
const loginInput = document.querySelector("#login-form input");
// const loginButton = document.querySelector("#login-form button");
const loginForm = document.querySelector("#login-form");
const greeting = document.querySelector("#greeting");
const HIDDEN_CLASSNAME = "hidden";

// function onLoginBtnClick(){
//     // console.dir(loginInput.value);
//     // console.log("hello", loginInput.value);
//     const username = loginInput.value;
//     console.log(username);
//     // if(username === ""){
//     //     alert("Please write your name");
//     // }else if(username.length > 15){
//     //     alert("Your name is too long.");
//     // }
//     // console.log("click!!");
// }

function onLoginSubmit(event){
    // const username = loginForm.value;
    event.preventDefault(); // 이벤트 막는 방법
    // console.log(loginInput.value);
    // submit버튼을 누르면 html에 있는 id 값이 greeting 거가 작동해서 hidden으로 숨기고
    // innerText를 사용해서 "Hello" + username 적은 값이 들어가는데
    // hidden을 사용해서 submit 버튼을 없애고 값이 출력하게 만든거
    loginForm.classList.add("hidden");
    const username = loginInput.value;
    greeting.innerText = `Hello ${username} Welcome`; // == "Hello" + username; // `${변수명}` //string랑 변수랑 합치는법
    greeting.classList.remove(HIDDEN_CLASSNAME);
    // console.log(username);
}

// loginButton.addEventListener("click", onLoginBtnClick);
loginForm.addEventListener("submit", onLoginSubmit);


// const link = document.querySelector("a")

// function hanldeLinkClick(event){
//     event.preventDefault(); // 이벤트 막는 방법
//     console.dir(event);
//     // console.log(event);
//     alert("clicked!");
// }

// link.addEventListener("click", hanldeLinkClick);