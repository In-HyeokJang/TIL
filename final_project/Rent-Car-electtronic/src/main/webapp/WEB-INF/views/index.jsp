<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="util" uri="/ELFunctions" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
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
                            height: 750px;
                            width: 50%;
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
                            z-index: 2
                        }

                        .main__content .main__title {
                            position: relative;
                            font-size: 50px;
                            padding-left: 100px;
                            margin-top: 20%;
                            margin-bottom: 10%;
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

                        .main__content .noticeWrap {
                            padding-left: 100px
                        }

                        .main__content .noticeContent {
                            padding-left: 0
                        }


                        .noticeContent .notice-list {
                            flex-wrap: nowrap;
                            display: flex;
                            align-items: flex-start;
                            flex-direction: column;
                        }

                        .notice-list li {
                            font-weight: 400;
                            font-size: 22px;
                        }


                        .hline {
                            padding-left: 40px;
                            margin-right: 50px
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

                            <h3 class="main__title"> 여러분의 아늑한 여행을 <p>도와드립니다.</p>
                            </h3>


                            <div class="noticeWrap">
                                <div class="noticeInner">
                                    <div class="noticeContent">
                                        <div class="noticeHead" id="noticeHead">
                                            <h1>Notice</h1>
                                            <a href="./notice/list" class="btn-goLink">전체보기</a>
                                        </div>
                                        <ul class="notice-list" id="notice-list">
                                            <c:forEach var="dto" items="${mainNoticeList}">
                                                <li>
                                                    <input type='hidden' value="${dto.noticeno}">
                                                    <a href="javascript:read('${dto.noticeno}')">${dto.title}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>



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
                                    <span class="navigation__icon">
                                        <a href="https://github.com/ISOSIM/Rent-Car-electtronic">
                                        <img src="/images/github.gif" width="60" height="60"></img>
                                        </a>
                                    </span>
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
                                author: "- 로버트 루이스 스티븐슨 -",
                            },
                            {
                                quote: `"여행은 인간을 겸손하게 만든다. 세상에서 인간이 차지하는 영역이 얼마나 작은 것인지를 깨닫게 해준다."`,
                                author: "- 프리벨 -",
                            },
                            {
                                quote: `"여행이란, 우리가 사는 장소를 바꿔주는 것이 아니라 우리의 생각과 편견을 바꿔주는 것이다."`,
                                author: "- 아나톨 -",
                            },
                            {
                                quote: `"바보는 방황하고, 현명한 사람은 여행한다."`,
                                author: "- 토마스 플러 -",
                            },
                            {
                                quote: `"진정한 여행은 새로운 풍경을 보러 가는 것이 아니라, 세상을 바라보는 또 하나의 눈을 얻어오는 것이다."`,
                                author: "- 여몽 -",
                            }
                        ];
                        const quote = document.querySelector("#quote span:first-child");
                        const author = document.querySelector("#quote span:last-child");
                        const todaysQuote = quotes[Math.floor(Math.random() * quotes.length)];
                        quote.innerText = todaysQuote.quote;
                        author.innerText = todaysQuote.author;
                    </script>

                    <script>
                        function read(noticeno) {
                            var url = "/notice/read";
                            url += "?noticeno=" + noticeno;
                            location.href = url;

                        }
                    </script>

                </body>

                </html>
