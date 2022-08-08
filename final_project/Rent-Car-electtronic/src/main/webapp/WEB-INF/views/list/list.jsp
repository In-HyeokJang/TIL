<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html> 
<html> 
<head>
 <script src="/js/list/list.js" defer></script>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(listno){
       var url = "/contents/list/read";
       url += "?listno="+listno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;

     }
  </script>
  <style>
  .container {
    width: 1200px;
    margin: 0 auto;
    position: relative;
  }
.tbody{
text-align: center;
}

.thead{
text-align: center;
}
.rcdStart blink{
  0% {opacity:0;}
  100% {opacity:1;}
}
  </style>

 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container">
 
    <h1 class="col-sm-offset-2 col-sm-10">맛집 목록</h1>
<form action="/contents/list" class='form-inline'>
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="wname"
        <c:if test= "${col=='wname'}"> selected </c:if>
        >성명</option>
        <option value="title"
        <c:if test= "${col=='title'}"> selected </c:if>
        >제목</option>
        <option value="content"
        <c:if test= "${col=='content'}"> selected </c:if>
        >내용</option>
        <option value="title_content"
        <c:if test= "${col=='title_content'}"> selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>
     </select>


      <input type="text" class="form-control" placeholder="Enter 검색어"
       id="word"   name="word" value="${word}">

      <!--        -------------------------------------------------------------- -->

      <span >
 <img src="/images/SJ/mic.png" style="height:25px;" id="rcdStart" class="blink">
</span>





          <!--        -------------------------------------------------------------- -->



    <button class="btn btn-default" >검색</button>
    <c:if test="${sessionScope.id==''}">
    <button type="button" class="btn btn-default" onclick="location.href='/contents/list/create'">등록</button>
  	</c:if>
  	  	 <button type="button" class="btn btn-default" onclick="location.href='/contents/list/create'">등록</button>
</div>
	</form>
 <br>
<table class="table table-striped" style=" width: 900px;">
   <thead>
    <tr>
    <th>제목</th>
    <th>작성자</th>
    <th>등록날짜</th>
    <th>조회수</th>
    <th><span style="color:#FF0040;">추천</span></th>
    </tr>
   </thead>
   <tbody class="tbody">

<c:choose>
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 글이 없습니다.</td></tr>
</c:when>
<c:otherwise>

   <c:forEach var="dto" items="${list}">

   <tr>
   &nbsp;&nbsp;
    <td>
    <a href="javascript:read('${dto.listno}')">${dto.title}</a>

    <c:if test="${util:newImg(fn:substring(dto.rdate,0,10)) }">
         <img src="/images/SJ/new.gif">
    </c:if>

    </td>
    <td>${dto.wname}</td>
    <td>${dto.rdate}</td>
    <td>${dto.cnt}</td>
    <td>
    <span style="color:#FF0040;">
    &emsp;${dto.recommend}</span> <img src="/images/SJ/free-icon-love-1029132.png" style="height:25px; " ></td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>

   </tbody>

  </table>

  <div>
      ${paging}
  </div>

</div>



</body> 
</html> 