# HTML

## Semantic tags

- tag에 의미가 부여된 것을 말한다.

  1. Semantic tag가 중요한 이유

     - SEO (Search Engine Optimization), Accessibility, 유지보수성

     - non-semantic elements: `<div>` and `<span>` = 불분명한 내용 정의

     - semantic elements: `<form>, <table>`, and `<img>` = 분명한 내용 정의

     - ```html
       <div id="nav">
         ,
         <div class="header">
           , or
           <div id="footer">를대신 하는 Semantic 요소</div>
         </div>
       </div>
       ```

       1. header

          - 소개 및 탐색에 도움을 주는 콘텐츠를 나타낸다
          - 제목, 로고, 검색 폼, 작성자 이름 등의 요소도 포함할 수 있다.

       2. nav

          - 문서의 부분 중 현재 페이지 내, 또는 다른 페이지로의 링크를 보여주는 구획을 나타낸다

          - 자주 쓰이는 예제는 메뉴, 목차, 색인이다.

          - header 안에서 사용될 수 있다.

            ```html
            <body>
              <nav class="crumbs">
                <ol>
                  <li class="crumb"><a href="#">Bikes</a></li>
                  <li class="crumb"><a href="#">BMX</a></li>
                  <li class="crumb">Jump Bike 3000</li>
                </ol>
              </nav>
            </body>
            ```

       3. main

          - 문서 body의 주요 콘텐츠를 나타낸다
          - 주요 콘텐츠 영역은 문서의 핵심 주제나 앱의 핵심 기능에 직접적으로 연결됐거나 확장하는 콘텐츠로 이루어진다.
          - `<main>`안에`<article>,<section>,<aside>`등 이 사용된다.

       4. article

          - 문서, 페이지, 애플리케이션, 또는 사이트 안에서 독립적으로 다른 내용과 구분해서 보여줄 때 사용한다.
          - 블로그 포스터에서 포스터 하나, 매거진이나 뉴스의 기사 하나 등을 나타낼때 사용

       5. section

          - `<main>,<article>`안에서 연관있는 내용을 하나로 묶어줄때 사용
          - 보통 `<section>`은 제목을 포함하지만, 항상 그런것은 아님

       6. aside

          - 문서의 주요 내용외 부가적인 내용을 주영역 주변에 배치
          - 주로 사이드바 혹은 콜아웃 박스로 표현

       7. button vs a

          - `<button>` : 사용자의 특정한 액역을 위해서 사용, 클릭했을때 발생한다
          - `<a>`: 어디론가 이동할때 (링크) 사용한다.

## HTML분류, HTML구조

### HTML tag의 분류

1. Box vs ltem
   - Box : 사용자에게 보이지 않고 item을 담을 수 있다.
     - 구조표현 : header, footer, nav, aside, main
     - main 표현 : section, article, div, span, form
   - ltem : 사용자에게 보여지고 Box안에 담겨진다.
     - a, button, input, label, img
     - video, audio, map, canvas, table
2. Block vs lnline
   - Block : 두개의 요소가 한줄에 하나씩 두줄에 배치된다.
     - `<div>`
   - lnline : 두개의 요소가 한줄에 배치된다.
     - `<p>,<span>,<b>`

# CSS

## css syntax

- Cascadin style sheet : Cascading은 위에서 아래로 떨어지는 느낌
- 어떤 UI의 스타일이 필요할때 이미정의된 스타일 시트가 있다면 그것을 사용하고 없다면
  브라우저에서 정의하고 있는 기본 스타일을 사용한다.
- ◎ Selectors
  Universal : **\***
  type : **Tag**
  ID : **#id**
  Class : **.class**
  State : **:**
  Attribute : **[]**

### css간단 용어 정리

- color : red; (font에 red색넣기)
- background-color : yellow (배경에 yellow 넣기)
- background-image: url("tree.jpg") (배경에 이미지 넣기)
- background-repeat : 배경이미지의 반복을 지정 4가지 사용
  - repeat : 배경이미지가 반복적으로 적용, 기본값
  - repeat-x : 배경이미지가 가로방향으로만 반복적으로 적용
  - repeat-y : 배경이미지가 세로방향으로만 반복적으로 적용
  - no-repeat : 배경이미지가 반복적으로 적용되지 않고 한번만 적용
  - backgroind-position: right top : 이미지 위치 정의
- text-align:center; (text를 center로 보내기)
- width : 100px; (가로 길이)
- height : 100px (세로 길이)
- 주석 넣는법 : /_ abc.. _/
