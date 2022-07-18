<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>조회</title>
<meta charset="utf-8">

<script type="text/javascript">
	function updateM() {
		var url = "/contents/list/update";
		url += "?listno=${dto.listno}";
		location.href = url;
	}
function deleteM() {
		var url = "/contents/list/delete";
		url += "?listno=${dto.listno}";
		location.href = url;
	}

	function listM() {
		var url = "/contents/list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
</script>

</head>
<body>
	<div class="container">

		 <h2>조회</h2>
		<div class="panel panel-default">
			<div class="panel-heading">작성자</div>
			<div class="panel-body">${dto.wname}</div>

			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.cnt}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.rdate}</div>

		</div>
		<div>
		 <c:if test="${sessionScope.grade=='A' }">
			<button type="button" class="btn" onclick="location.href='/list/create'">등록</button>
			<button type="button" class="btn" onclick="updateM()">수정</button>
			<button type="button" class="btn" onclick="deleteM()">삭제</button>
		</c:if>
		<button type="button" class="btn" onclick="location.href='/contents/list/create'">등록</button>
        <button type="button" class="btn" onclick="updateM()">수정</button>
        <button type="button" class="btn" onclick="deleteM()">삭제</button>
		<button type="button" class="btn" onclick="listM()">목록</button>
		</div>
	</div>
<hr>
	<div class="panel panel-default">

    <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i> 댓글
            <button id='addreviewBtn' class='btn btn-primary btn-xs pull-right'>New review</button>
    </div>




<!-- 댓글 -->
    <div class="panel-body">

            <ul class="chat list-group">
                    <li class="left clearfix" data-rno="12">
                            <div>
                                    <div class="header">
                                            <strong class="primary-font">user1</strong> <small
                                                    class="pull-right text-muted">2019-05-12</small>
                                    </div>
                                    <p>Good job!</p>

                            </div>
                    </li>
            </ul>
            <!-- ul end  -->
    </div>

    <div class="panel-footer">1234</div>

    </div>
    <!-- panel end-->
    </div>
    <!-- <!--  col-lg-12 end -->
    </div>
    <!-- row end -->
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">review MODAL</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>내용</label>
            <textarea cols="10" rows="3" class="form-control" name='content'>New review!!!!</textarea>
          </div>
        </div>
    <div class="modal-footer">
    <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
    <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
    <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
    <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
    </div>
    </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <script>
      let listno = "${dto.listno}";
     let sno = "${sno}";
      let eno = "${eno}";
      <!-- 댓글용 paging 로그인 id -->
      let nPage = "${nPage}";
      let id = "${sessionScope.id}";
   </script> 

    <script src="/js/producer.js" defer></script>

    <script src="/js/consumer.js" defer></script>
</body>
</html>