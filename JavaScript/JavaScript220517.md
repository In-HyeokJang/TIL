# JavaScript

- 마크 앤더슨이 개발한 모자이크 브라우저, 그 후 네스케이프 회사 설립 후 UI요소가 추가된 Netscape Navigator를 만든다.

- HTML과 Server Script(백엔드) 사이에서 **접속자의 마우스 클릭, 키보드 입력등 이벤트 처리 **를 주로 담당한다.

- HTML + CSS < --- > JavaScript < --- > 백엔드

  ​		출력				동작/이벤트			데이터베이스 접속 처리(Oracle, MySql...)

- 2004년 제스 제임스는 Ajax를 도입시킴 javascript는 ajax 통신을 이용하여 서버와 태그단위로 (JSP는 페이지 단위 통신, 페이지단위 이동) 비동기 통신이 가능하며, jQuery로 Framework화 되어 발전되어 사용

- 요즘은 Ajax 통신의 결과를 SPA(Single Page Application)로 구현하기 위해 typescript, React등을 사용 한다.

## Text Edior 비주얼 스튜디오 설치 및 확장하기

[Visualstiudio 설치 주소](https://code.visualstudio.com/download)

[VS설치 참고](https://github.com/In-HyeokJang/TIL/blob/master/git%26github/git%EC%A0%95%EB%A6%AC.md)

### Visualstidio 확장

- open in browser install : 브라우저에서 확인

- Material Theme istall - > ser color theme -> darker high contrast

- Material lcon Theme install

- Prettier - Code formatter install -> 아래부분 Manage -> Settings 선택 -> 

  save 검색 후 -> Editor: Format on Save 아래 체크 

  prettier 검색 후 -> Prettier : Tab width -> Number of spaces it should use per tab 2로 설정

  Quote 검색 후 -> Javascript;Preferences: Quote Style ... -> auto를 single로 변경

- Breaket Pair Colorizere install : 괄호 색깔 다르게 지정됨

- Indent Rainbow install : 들여쓰기가 보기 좋게 표현

- Auto Rename Tag install : html의 앞에 태그를 바꾸면 뒤에 닫는 태그도 바꾸어 준다.

- Css Peek install : CSS 착기 쉽게 한다. class의 이름 위에서 Ctrl + 클릭하면 Style로 이동

- HTML CSS Support install :html에서 css의 자동완성 이용할 수 있다.

- Live Server install : 서버사용, html, css 변경사항 저장후 바로 적용

  Manager -> Settings -> live server 검색 -> Use local ip 체크, Custom Browers : chrome 선택 ( html 파일의 Open with Live Server 선택 후 브라우저에서 확인할 수 있다.)
  
- 주석색상 변경하는 법

  - Manager -> settings -> .json검색 -> JSON:Schemas 아래 Edit in settings.json 클릭하여 아래 코드 추가

    ``` javascript
      "editor.tokenColorCustomizations": {
            "comments": "#eeff00"
        },
       "json.schemas": [
     
       ]
    }
    ```


### async 와 defer

- html 한줄 한줄 읽어가는것(이해, 분석)을 parsing이라고 한다.

  ``` javascript
  <script src='main.js'></script>
  ```

  :페이지가 준비되기 전에 js가 실행 될 수 있다.

  js 파일이 크다면 페이지가 준비 되기 까지 시간이 걸릴 수 있다.

  ``` javascript
  <script async src='main.js'></script>
  ```

  : 병렬로 html parsing과 js 다운로드 된다 그러나 먼저 js가 다운로드 되면 페이자기 준비되지 않은 상태에서 js가 실행될 수 있다.

  html parsiong -> blocked -> html parsing 

  js다운로드 - js실행

  ``` javascript
  <script defer src='main.js'></script
  ```

  : 병렬로 html parsing과 js 다운로드 된다. html parsing과 js 다운로드가 되면 js가 실행한다. 가장 안정적인 방법

  여러개의 js는 다운로드 시간과 상관없이 선언된 순서대로 실행

    html parsing   ┐ 
                -> 페이지를 보여지고 -> js실행
    js 다운로드       ┘ 

## 변수의 선언

- 변수 선언시 int등의 데이터 타입을 선언하지 않는다.

- js 작성시 처음부분에 'use strict';써주면 js에서 유연한(안전하지 못한) 변수 서언, 타입변경등을 좀더 안전하게 만들어준다.

- var, let(권장 ES6) 이용하여 선언, 

  let str = "message string";

- var는 var사용하지 않고 선언된 모든 변수는 전역변수, 함수안에서 선언해도 전역변수로 바뀜 (권장은 아님)

- const는 선언과 함께 할당된 값이 변경되지 못한다.

1. Data Type

   - 자바스크립트의 데이터타입은 하나의 변수에 여러가지 데이터형을 저장할 수 있다. (Dynamic typing : dynamically typed language)

   - primitive - 더이상 작은 단위로 나눠지지 않는 타임, single item

   - number: 정수, 실수, 숫자0으로 시작하는 8진수, 0x로 시작하는 16진수등을 저장할 수 있는 복합적인 데이터 타입.

   - string: "", ''를 이요해서 문자열을 표현한다. 또는 ``도 문자열로 표현

   - boolean : true, false를 값으로 가지며, 0, null, undefined, NaN, ''는 false로 해석되고  그 외의 값은 true로 해석

   - null : 데이터의 형식이 알려지지 않았거나 데이터가 없음을 나타내는데 사용

   - undefined : 변수를 선언후 데이터를 할장하지 않은 경우 갖는 값

   - symbol: 고유한 식별자가 필요할때 사용한다.

   - object: single item을 묶어서 한 단위나 box로 관리할 수 있다.

   - function: 함수는 작업을 수행하거나 값을 계산하는 문장 집합 같은 자바스크립트 절차, 함수를 사용하려면 함수를 호출하고자 하는 범위 내에서 함수를 정의해야 한다.

     - 함수
     - 화살표 함수

   - ``` javascript
     'use strict';
     let name = '홍';
     const maxNumber = 5;
     console.log(name); // 홍
     
     let a = 12;
     let b = 12.1;
     console.log(`value:${a}, type:${typeof a}`); // value: 12, type: number
     console.log(`value:${b}, type:${typeof b}`); // value: 12.1, type: number
     
     const infinity = 1/0;
     const negativeInfinity = -1/0;
     const nAn = 'not a number' / 2;
     
     console.log(infinity); // Infinity
     console.log(negativeInfinity); // -Infinity
     console.log(nAn); //NaN
     
     const char = 'c';
     const brendan = 'brendnan';
     const greeting = 'hello' + 'brendan';
     
     console.log(`value:${greeting}, type:${typeof greeting}`); // value:hellobrendan, type:string
     console.log("hi " + brendan+"!");//hi brendan!
     console.log(`hi ${brendan}!`);// hi brendan!
     
     const helloBob = `hi ${brendan}!`;
     console.log(`value: ${helloBob} type:${typeof helloBob}`);// value: hi brendan! tpye: sting
     console.log('value: '+helloBob + 'type:'+typeof helloBob);// value: hi brendan! tpye: sting
     
     //false : 0 , null, undefined, NaN, ''
     const canRead = true;
     const test = 3 < 1;
     console.log(`value: ${canRead} , type: ${typeof canRead}`); //value: true, tpye: boolean
     console.log(`value: ${test}, type: ${typeof test}`); //value: fales, type:boolean
     
     //null : empty value
     
     let nothing = null;
     console.log(`value: ${nothing}, type: ${typeof nothing}`); //value: null, type: object
     
     
     //undefined : 정해지지 않은 값
     let x;
     console.log(`value: ${x}, type: ${typeof x}`);//value: undefined, type: undefined
     
     // sybol: 고유식별자
     
     const symbol1 = Symbol('id');
     const symbol2 = Symbol('id');
     console.log(symbol1 === symbol2) // false
     const gsymbol1 = Symbol.for('id');
     const gsymbol2 = Symbol.for('id');
     console.log(gsymbol1 === gsymbol2); //true
     
     console.log(`value: ${symbol1.description}, type: ${typeof symbol1}`); //value: id, type: symbol
     console.log(`value: ${gsymbol1.description}, type: ${typeof gsymbol1}`);//value: id, type: symbol
     
     let text = 'hello';
     console.log(text.charAt(0)); //h
     console.log(`value:${text}, type:${typeof text}`);// value: hello, type: string
     text =1;
     console.log(`value:${text}, type:${typeof text}`); //value: 1, type:number
     text = '8' /'2'; //8과2가 숫자로 변환됨
     console.log(`value:${text}, type${typeof text}`); // value: 4, type: number
     // console.log(text.charAt(0));; // 오류남 문자열로 가져올수 없음
     text ='7' + 5; // +는 산술연산도 되지만 문자열 연결도 됨 , 그래서 +때문에 5가 문자열로 변환됨 
     console.log(`value:${text}, type:${typeof text}`); // 75 출력 // String형으로 출력
     
     //object
     const obj = {name:'obj', age:20} // 객체
     console.log(`value:${obj}, type: ${typeof obj}`); // value : [object Object], type: object
     console.log(`name: ${obj.name}, age: ${obj.age}`); // name: obj, age: 20
     ```

## Operator (연산자)

  ``` javascript
  // 산술연산 
  let i = 10;
  let j = 3;
  
  pl(`더하기: (${i+j})`);
  pl(`빼기: (${i-j})`);
  pl(`곱하기: (${i*j})`);
  pl(`나누기: (${i/j})`); //정수 /정수 = 실수로 나옴
  pl(`나머지: (${i%j})`);
  function pl(str){
  document.write(`${str} <br><br>`);
  }
  console.log('my' + ' dog');
  console.log('1' + 2); // 2는 문자열로 변환
  console.log(`string literals: 1 + 2 = ${1 + 2}`)
  let counter =2;
  const preIncrement = ++counter;
  console.log(`preIncrement:${preIncrement}, counter:${counter}`);// 3, 3
  
  const postIncrement = counter++;
  console.log(`postIncrement:${postIncrement}, counter:${counter}`); // 3, 4
  
  //인산후 할당 연산
  let x= 3;
  let y= 6;
  console.log(x += y);
  console.log(x -= y);
  console.log(x /= y);
  console.log(x *= y);
  
  // 비교연산
  console.log(10 < 6);
  console.log(10 <= 6);
  console.log(10 > 6);
  console.log(10 >= 6);
  
  //논리연산
  const value1 = true;
  const value2 = 4<2;
  
  console.log(`or: ${value1 || value2 || check()}`);
  console.log(`and: ${value2 && value2 && check()}`);
  
  function check(){
      for(let i = 0; i<10; i++){
          console.log('wating');
      }
      return true;
  }
  
  
  //equality(==, ===)
  const stringfive = '5';
  const numberfive = 5;
  //== loose equality, with type conversion (타입변환을 사용한 약한 비교)
  console.log(stringfive == numberfive); // 문자열이 숫자형으로 바뀜
  console.log(stringfive != numberfive);
  
  //=== strict equality, no type convrsion(타입변환을 하지 않는 엄격한 비교)
  console.log(stringfive === numberfive);
  console.log(stringfive !== numberfive);
  
  //object equality by reference
  console.log('-----------------');
  const js1 = {name:'js'};
  const js2 = {name:'js'};
  const js3 = js1;
  console.log(js1 == js2); // 참조값이 서로 달라서 false
  console.log(js1===js2); // 참조값이 서로 달라서 false
  console.log(js1===js3); // js1을 js3에 넣어서 true
  
  //equality 확인 
  console.log('------------------------');
  console.log(0 == false);
  console.log(0 === false);
  console.log('' == false);
  console.log('' === false);
  console.log(null == undefined);
  console.log(null === undefined);
  ```



  