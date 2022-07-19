<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>상품메인페이지</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script type="text/javascript">

    function del(carnumber){
        if(confirm("정말삭제하시겠습니까?")){
            let url ="delete/"+carnumber;
            location.href=url;
            }
         }

    function createwindow() {
        let windowObjectReference;
        let windowFeatures = "left=100,top=100,width=320,height=900, width=640";
        windowObjectReference = window.open("./create", "mozillaTab", windowFeatures);
        }
  </script>
  <style>
#row{
display: flex;
justify-content: center;
margin-right: 10%;
}
.search{
  display: flex;
  justify-content: center;
  margin-left: 50%;
}
.carlist{
  margin-left: 46%;
}
.paging{
  display: flex;
    justify-content: space-around;
}
.col-sm-3{
  justify-content: center;
    margin-left: 10%;
}
</style>

</head>
         <body>

         <div class="container">
          <div class="carlist">
         <h2>C A R S L I S T</h2>
        </div>
         <div class="search">
           <form class="form-inline" action="./list">
             <div class="form-group">
               <select class="form-control" name="col">
                 <option value="category"
                 <c:if test= "${col=='category'}"> selected </c:if>>차종류</option>
                 <option value="carname"
                 <c:if test= "${col=='carname'}"> selected </c:if>>차이름</option>
                 <option value="carpoint"
                 <c:if test= "${col=='carpoint'}"> selected </c:if>>
                 지점</option>
                 <option value="total"
                 <c:if test= "${col=='total'}"> selected </c:if>>
                 전체출력</option>
              </select>
             </div>
             <div class="form-group">
               <input type="text" class="form-control" placeholder="Enter 검색어"
               name="word" value="${word}">

             </div>
             <button type="submit" class="btn btn-default" >검색</button>
             <button onclick="createwindow()">등록</button>
           </form>
          </div>
         <c:choose>
         <c:when test="${empty list}">
            <div class="row">
            <h2>차량 준비중 입니다.</h2>
            </div>
         </c:when>

         <c:otherwise>
         <div class="row" id="row">
             <c:forEach var="dto" items="${list}">
             <div class="col-sm-3">
              <h2> ${dto.carname }</h2>
               
               <a href="/carinfo/read/${dto.carnumber}">
                <img src="/carinfo/storage/${dto.carimage}" class="img-thumbnail"  width="350" height="306"></a>
                <p><b>차 번호 : ${dto.carnumber}</b><br>
                <b>${dto.category}${dto.carseate }</b> |  <b>${dto.caryearmodel}</b><br>
              <b>${dto.carpoint}</b></p>
                 <a href="./update/${dto.carnumber }">수정
                  <span class="glyphicon glyphicon-edit"></span>
                </a>
                /
                <a href="javascript:del('${dto.carnumber}')">삭제
                  <span class="glyphicon glyphicon-trash"></span>
                </a>
                
                </div>
             
             </c:forEach>
         </div>

         </c:otherwise>
         </c:choose>
         </div>
         <div class="paging">
          ${paging}
          </div>
         </body>
        </html>