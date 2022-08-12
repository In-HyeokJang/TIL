<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath }" />
    <c:choose>
      <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
        <c:set var="str">Admin</c:set>
      </c:when>
      <c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
        <c:set var='str'>Log Out</c:set>
      </c:when>
      <c:otherwise>
        <c:set var="str">Log In</c:set>
      </c:otherwise>
    </c:choose>


    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">

      <title>EV Rent Car</title>

      <link rel="stylesheet" type="text/css" href="/css/common.css">
      <link rel="stylesheet" type="text/css" href="/css/top.css">
    </head>

    <body>
      <div style="position: relative; z-index:20">
      <header class="header">
        <h1 onclick="location.href='/'">EV Rent Car</h1>
      </header>

      <nav class="navigaiton">
        <ul class="navigation__list" style="z-index: 1;">

          <div class="dropdown">
            <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">🌇</span></span><span
                class="item__text">Board</span></li>
            <div class="dropdown-content">
              <a href="/notice/list">공지사항</a>
              <a href="/user/contents/list">자유게시판</a>

              <a href="#">xx</a>
            </div>
          </div>

          <div class="dropdown" style="z-index:2">
            <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">🚖</span></span><span
                class="item__text">Rent</span></li>
            <div class="dropdown-content">
              <a href="/carinfo/list">차량 리스트</a>
              <a href="/user/booking/rent">차량 예약</a>
            </div>
          </div>

          <div class="dropdown">
            <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">🗺️</span></span><span
                class="item__text">지원</span></li>
            <div class="dropdown-content">
              <a href="/map/map">충전소 조회</a>
              <a href="/user/request/create">지원 요청</a>
              <a href="/">xx</a>
            </div>
          </div>

          <c:choose>

            <c:when test="${empty sessionScope.id}">
              <div class="dropdown">
                <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">🙋‍♂️</span></span>
                  <span class="item__text"><a id="grade">${str}</span></li>
                <div class="dropdown-content">
                  <a href="/exception/user/login">Sign In</a>
                  <a href="/exception/user/agree">Sign Up</a>
                </div>
              </div>
            </c:when>


            <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
              <div class="dropdown">
                <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">👨‍💻</span></span><span
                    class="item__text">Admin</span></li>
                <div class="dropdown-content">
                  <a href="/admin/user/list">회원목록</a>
                  <a href="/booking/list">예약 현황</a>
                  <a href="/map/facilities/create">가게 등록</a>
                  <a href="/exception/user/logout">Sign Out</a>
                </div>
              </div>
            </c:when>


            <c:otherwise>
              <div class="dropdown">
                <li class="navigation__item"><span class="item__icon"><span class="icon__emoji">🙋‍♂️</span></span><span
                    class="item__text">${str}</span></li>
                <div class="dropdown-content">
                  <a href="/user/member/mypage">My Page</a>
                  <a href="/exception/user/logout">Logout</a>
                </div>
              </div>
            </c:otherwise>
          </c:choose>

        </ul>
      </nav>
      </div>
    </body>

    </html>