<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ISOSIM Rent-Car</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <style>
        :root {
            --greyColor: rgba(0, 0, 0, 0.6);
        }
        * {
            box-sizing: border-box;
        }
        h1,
  h2,
  h3,
  h4,
  h5 {
    margin: 0;
    padding: 0;
  }
        body{
            overflow-x: hidden;
            overflow-y:hidden;
            padding: 0;
            margin: 0;
        }
        .main {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 100%;
            color: #252523;
        }
        .swiper-slide .main__photo {
            position: fixed;
            background-size: cover;
            background-position: center;
            height: 800px;
            width: 100%;
            z-index: 0;
        }
        .main .main__content {
            position: absolute;
            width: 60%;
            height: 100%;
            align-self: center;
            background-color: #fafafc;
            left: 40%;
            top: 0%;
            z-index:2
        }
        .main__content .main__title {
            position: relative;
            font-size: 50px;
            padding-left: 100px;
            margin-top: 30%;
            margin-bottom: 10%;
            top: 200px;
        }
        .main .swiper-slide .main__pages {
            padding-left: 100px;
        }
        .main__pages .main__current-page {
            font-size: 50px;
            color: black;
            font-weight: 600;
        }
        .main__pages .main__total-pages {
            color: var(--greyColor);
            font-weight: 600;
            font-size: 30px;
        }
        .main__content .navigation {
            width: 100%;
            background-color: #fafafc;
            position: absolute;
            bottom: 0;
            padding: 12.5px 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 2;
        }
        .navigation .navigation__arrow {
            font-size: 55px;
            color: var(--greyColor);
            left: 10px;
        }
        .navigation svg {
            fill: var(--greyColor);
        }
        .navigation .navigation__icon {
            margin-right: 10px;
        }
        .navigation .navigation__icon:last-child {
            margin-right: 0;
        }
        .swiper-button-next {
            font-size: 55px;
            color: var(--greyColor);
        }
        .swiper-button-prev {
            font-size: 55px;
            color: var(--greyColor);
            position: relative;
            z-index: 3;
        }
        .swiper-button-next::after,
        .swiper-button-prev::after {
            display: none;
        }
        #quote {
            position: relative;
            font-size: 20px;
            top: 20%;
            color: gray;
        }
         #quote #quote1 {
            color: gray;
            margin-left: 5%;
        }
        #quote #quote2 {
            position: absolute;
            color: gray;
            margin-left: 20px;
        }
    </style>
</head>

<body>
    <main class="main">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                
                <div class="swiper-slide">
                    <div class="main__photo"
                        style="background-image: url(https://source.unsplash.com/random/1000×1000/?trip,car);">
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="main__photo"
                        style="background-image: url(https://source.unsplash.com/random/1000×1000/?trip);">
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="main__photo"
                        style="background-image: url(https://source.unsplash.com/random/1000×1000/?car);">
                    </div>
                </div>
            </div>
        </div>


        <div class="main__content">

            <h3 class="main__title"> 여러분의 아늑한 여행을 <p>도와드립니다.</p></h3>
            <div id="quote">
                <span id="quote1"></span>
                 <span id="quote2"></span> 
            </div>

            <div class="navigation">
                <div class="navigation__column">
                    <div class="swiper-button-prev">‹</div>
                    <div class="swiper-button-next">›</div>
                </div>


                <div class="navigation__column">
                    <!-- <span class="navigation__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24">
                            <path
                                d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm3 8h-1.35c-.538 0-.65.221-.65.778v1.222h2l-.209 2h-1.791v7h-3v-7h-2v-2h2v-2.308c0-1.769.931-2.692 3.029-2.692h1.971v3z" />
                        </svg>
                    </span>
                    <span class="navigation__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path
                                d="M14.829 6.302c-.738-.034-.96-.04-2.829-.04s-2.09.007-2.828.04c-1.899.087-2.783.986-2.87 2.87-.033.738-.041.959-.041 2.828s.008 2.09.041 2.829c.087 1.879.967 2.783 2.87 2.87.737.033.959.041 2.828.041 1.87 0 2.091-.007 2.829-.041 1.899-.086 2.782-.988 2.87-2.87.033-.738.04-.96.04-2.829s-.007-2.09-.04-2.828c-.088-1.883-.973-2.783-2.87-2.87zm-2.829 9.293c-1.985 0-3.595-1.609-3.595-3.595 0-1.985 1.61-3.594 3.595-3.594s3.595 1.609 3.595 3.594c0 1.985-1.61 3.595-3.595 3.595zm3.737-6.491c-.464 0-.84-.376-.84-.84 0-.464.376-.84.84-.84.464 0 .84.376.84.84 0 .463-.376.84-.84.84zm-1.404 2.896c0 1.289-1.045 2.333-2.333 2.333s-2.333-1.044-2.333-2.333c0-1.289 1.045-2.333 2.333-2.333s2.333 1.044 2.333 2.333zm-2.333-12c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6.958 14.886c-.115 2.545-1.532 3.955-4.071 4.072-.747.034-.986.042-2.887.042s-2.139-.008-2.886-.042c-2.544-.117-3.955-1.529-4.072-4.072-.034-.746-.042-.985-.042-2.886 0-1.901.008-2.139.042-2.886.117-2.544 1.529-3.955 4.072-4.071.747-.035.985-.043 2.886-.043s2.14.008 2.887.043c2.545.117 3.957 1.532 4.071 4.071.034.747.042.985.042 2.886 0 1.901-.008 2.14-.042 2.886z" />
                        </svg>
                    </span>
                    <span class="navigation__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path
                                d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6.066 9.645c.183 4.04-2.83 8.544-8.164 8.544-1.622 0-3.131-.476-4.402-1.291 1.524.18 3.045-.244 4.252-1.189-1.256-.023-2.317-.854-2.684-1.995.451.086.895.061 1.298-.049-1.381-.278-2.335-1.522-2.304-2.853.388.215.83.344 1.301.359-1.279-.855-1.641-2.544-.889-3.835 1.416 1.738 3.533 2.881 5.92 3.001-.419-1.796.944-3.527 2.799-3.527.825 0 1.572.349 2.096.907.654-.128 1.27-.368 1.824-.697-.215.671-.67 1.233-1.263 1.589.581-.07 1.135-.224 1.649-.453-.384.578-.87 1.084-1.433 1.489z" />
                        </svg>
                    </span> -->
                </div>
            </div>
            
        </div>

    </main>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        var mySwiper = new Swiper('.swiper-container', {
            // 슬라이드를 버튼으로 움직일 수 있습니다.
            navigation: {
                nextEl: '.swiper-button-prev',
                prevEl: '.swiper-button-next',
            },
            // 3초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
            autoplay: {
                delay: 3000,
            },
        });
    </script>

    <script>
        const quotes = [
            {
                quote: `"낯선 땅이란 없다. 단지, 그 여행자만이 낯설 뿐이다."`,
                author: "- 로버트 루이스 스티븐슨 - ",
            },
            {
                quote: `"여행은 인간을 겸손하게 만든다. 세상에서 인간이 차지하는 영역이 얼마나 작은 것인지를 깨닫게 해준다."`,
                author: "프리벨",
            },
            {
                quote: `"여행이란, 우리가 사는 장소를 바꿔주는 것이 아니라 우리의 생각과 편견을 바꿔주는 것이다."`,
                author: "아나톨",
            },
            {
                quote: `"바보는 방황하고, 현명한 사람은 여행한다."`,
                author: "토마스 플러",
            },
            {
                quote: `"진정한 여행은 새로운 풍경을 보러 가는 것이 아니라, 세상을 바라보는 또 하나의 눈을 얻어오는 것이다."`,
                author: "여몽",
            }
        ];
        const quote = document.querySelector("#quote span:first-child");
        const author = document.querySelector("#quote span:last-child");
        const todaysQuote = quotes[Math.floor(Math.random() * quotes.length)];
        quote.innerText = todaysQuote.quote;
        author.innerText = todaysQuote.author;
    </script>
</body>

</html>