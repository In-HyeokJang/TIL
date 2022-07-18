    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="util" uri="/ELFunctions" %>
    <!DOCTYPE html>
    <html>
    <head>

      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">
      <title>JS Bin</title>
       <link rel="stylesheet" type="text/css" href="/css/list2.css"/>
    </head>
    <body>

      <div class="container">
        <div id="div1">
         <table class="table table-striped">
          <th>${dto.wname}</th>
          <th>${dto.rdate}</th>
          <th>조회: ${dto.cnt} | 추천: <span id="bbsRecommendNum1">6</span></th>

          </table>
        </div>
        <div style="display: inline-block; margin: 0 5px;  float: right;"><span style="color: #787878;">
    <a style="color: #787878;" href="/contents/list">목록</a>
    | <a style="color: #787878;" href="javascript:void(0);" onClick="document.getElementById('powerbbsCmt2').scrollIntoView();">댓글(<span style="color:#F94B4B;">5</span>)</a>
          </span></div>
          <br><br><br>
        <h1>${dto.title}</h1>

        <br><br><br>
        <h4>${dto.content}</h4>

          <br><br><br>
            <br><br><br>
            <div id=review>
                    <span>댓글&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>  <a style="color: #787878;">등록순</a>
                <a style="display: inline-block; margin: 0 5px;  float: right; cursor: pointer;" style="color: #787878;" onClick="window.location.reload()">새로고침</a>
            </div>
            <hr>
            <!-- -------------------------------------------------------------------------  -->

            <table class="table table-striped">

               <tbody>

            <c:choose>
            <c:when test="${empty rlist}">
               <tr><td colspan="6">등록된 글이 없습니다.</td>
            </c:when>
            <c:otherwise>

               <c:forEach var="dto" items="${rlist}">

               <tr>
                <td>${dto.rnum}</td>

                <td>${dto.wname}</td>
                <td>${dto.rdate}</td>
                <td>${dto.cnt}</td>
               </tr>
               </c:forEach>
                </c:otherwise>
               </c:choose>

               </tbody>

              </table>

              <!-- -------------------------------------------------------------------------  -->
              <!-- <form action="/review/create" method="post"> -->
             <table  style=" width:930px; height:150px; margin:0 auto;">
             <th>
                <textarea id="content" name="content" class="content" rows="3" tabindex="99" placeholder="명예훼손,개인정보 유출,분쟁,허위사실 유포 등의 글은 이용약관에 의해 제재는
법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다." style="width:800px; height:100px;"></textarea>
             </th>
             <th>
             <button id='addreviewBtn' class='btn btn-primary btn-xs pull-right' type="submit">등 록</button>
             </th>
             </table>
            <!-- </form> -->






    </div>





            <script>
              let listno = "${dto.listno}";
             let sno = "${sno}";
              let eno = "${eno}";
              <!-- 댓글용 paging 로그인 id -->
              let nPage = "${nPage}";
              let id = "${sessionScope.id}";
           </script>
  <!-- <script src="/js/pro2.js" defer></script>-->

    <script src="/js/con2.js" defer></script>
    </body>
    </html>