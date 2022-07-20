<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>이미지 수정</title>
  <meta charset="utf-8">
  <style>
    .imageup{
      display: flex;
    justify-content: center;
    }
    .one{
      margin-right: 20px;
    }
    .oldfile{
      display: flex;
    justify-content: center;
      margin: 10px;

    }
    .fileMF{
      display: flex;
    justify-content: center;
    margin-right: 50px;
    }
    .filech{
      margin-left: 20px;
    }
    .button{
      display: flex;
    justify-content: center;
    margin-right: 130px;
    }
  </style>
</head>
<body>

<div class="container">

<h1 class="imageup">이미지 수정</h1>
  <form class="form-horizontal" 
        action="/carinfo/updateFile"
        method="post"
        enctype="multipart/form-data"
        >   
    <input type="hidden" name="oldfile" value="${oldfile}">    
    <input type="hidden" name="carnumber" value="${carnumber}">
        
    <div class="oldfile">
      <label class="one" for="oldfile">원본파일</label>
      <div class="col-sm-6">
        <img src="/carinfo/storage/${oldfile}"
        class="img-rounded" width="300" height="280"">
      </div>
    </div>
    <div class="fileMF">
      <label class="control-label col-sm-2" for="filenameMF">변경파일</label>
      <div class="filech">          
        <input type="file" class="form-control" id="filenameMF" 
        name="filenameMF" accept=".jpg,.png,.gif" required="required">
      </div>
    </div>
    <div class="button">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">수정</button>
        <button type="button" class="btn btn-default" 
        onclick="history.back()">취소</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>