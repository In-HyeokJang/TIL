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





