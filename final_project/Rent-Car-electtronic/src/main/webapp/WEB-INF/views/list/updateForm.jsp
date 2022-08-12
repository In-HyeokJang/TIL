<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>수정</title>
  <meta charset="utf-8">
    <script src="/js/list/update.js" defer></script>
<style>

  </style>
      <!-- include libraries(jQuery, bootstrap) -->
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

      <!-- include summernote css/js -->
      <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
       <link rel="stylesheet" type="text/css" href="/css/list/update.css"/>
</head>
<body>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">글 수정</h1>
<form class="form-horizontal"
      action="./update"
      method="post"
      >
<input type="hidden" name="listno" value="${dto.listno}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="wname" id="wname"
      class="form-control" value="${dto.wname}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title"
      class="form-control" value="${dto.title}">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="summernote" name="content"
    class="summernote">${dto.content}</textarea>
    </div>
  </div>



   <div class="form-group">
    <div style="display: inline-block; margin: 0 5px;  float: right;">
               <button id='btn_delete' class='btn' style="width:10; height:5;" >취 소</button>
               <button id='btn_update' class='btn' style="width:10; height:5;" >등 록</button>
             </div>
 </div>
</form>
</div>
</body>
</html>