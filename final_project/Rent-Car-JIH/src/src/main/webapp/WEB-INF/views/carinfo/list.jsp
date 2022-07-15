<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>


<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(carnumber){
       var url = "read";
       url += carnumber;
       location.href=url;

     }

     function fileDown(filename){
         var url = "fileDown";
         url += "?filename="+filename;
         location.href=url;
        }

     function del(carnumber){
        if(confirm("정말삭제하시겠습니까?")){
            let url ="delete/"+carnumber;
            location.href=url;
            }
         }

  </script>

</head>
<body>
<div class="container">

  <h2>자동차 목록</h2>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="category"
        <c:if test= "${col=='category'}"> selected </c:if>>차종류</option>
        <option value="carname"
        <c:if test= "${col=='carname'}"> selected </c:if>>차이름</option>
        <option value="carpoint"
        <c:if test= "${col=='carpoint'}"> selected </c:if>
        >지점</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어"
      name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='/carinfo/create'">등록</button>
  </form>

  <table class="table table-striped">
   <thead>
    <tr>
    <th>차번호</th>
    <th>차이미지</th>
    <th>자동차이름</th>
    <th>차종류</th>
    <th>좌석수</th>
    <th>지점</th>
    <th>등록일</th>
    <th>수정/삭제/이미지수정</th>
    </tr>
   </thead>
   <tbody>

<c:choose>
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 상품이 없습니다.</td>
</c:when>
<c:otherwise>

   <c:forEach var="dto" items="${list}">

   <tr>
    <td>${dto.carnumber}</td>
    <td>
    <img src="/carinfo/storage/${dto.carimage}"  class="img-rounded" width="100px" height="100px">
    </td>
    <td>
    <a href="/carinfo/read/${dto.carnumber}">${dto.carname}</a>
    </td>
    <td>${dto.category}</td>
    <td>${dto.carseate}</td>
    <td>${dto.carpoint}</td>
    <td>${dto.rdate}</td>

    <td> <a href="./update/${dto.carnumber }">
          <span class="glyphicon glyphicon-edit"></span>
        </a>
        /
        <a href="javascript:del('${dto.carnumber}')">
          <span class="glyphicon glyphicon-trash"></span>
        </a>
        /
        <a href="./updateFile/${dto.carnumber}/${dto.carimage}">
          <span class="glyphicon glyphicon-picture"></span>
        </a>
    </td>
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