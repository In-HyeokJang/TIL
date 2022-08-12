<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>수정</title>
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta charset="utf-8">

</head>
<body> 

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 수정</h1>

<div class="form-horizontal">

<input type="hidden" name="noticeno" id="noticeno" value="${dto.noticeno}">
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
    <textarea rows="12" cols="7" id="content" name="content" 
    class="form-control">${dto.content}</textarea>
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="fname">첨부파일</label>
    <div class="col-sm-6">
      <input type="text" name="oldFile" id="oldFile" class="form-control" value="${dto.fname}">
      <input type="button" id="deleteFile" value="첨부파일 제거">

    </div>
  </div>

  <div class="form-group">
        <label class="control-label col-sm-2" for="fname">첨부파일</label>
        <div class="col-sm-6">
          <input type="file" name="fnameMF" id="fnameMF" class="form-control" value="${dto.fname}">
        </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn" onClick="update()">수정</button>
    <button class="btn" onClick="javscript:location.href = '/user/notice/list'">취소</button>
   </div>
 </div>

</div>

</div>
<script>

document.getElementById("deleteFile").onclick = function () {

  let oldFile = document.getElementById("oldFile").value;
  
  let noticeno = document.getElementById("noticeno").value;

  const data = {
            noticeno : noticeno,
            fname : oldFile
}

$.ajax({
  url: '/admin/notice/deletefile',
  type: 'post',
  dataType:'text',
  data : JSON.stringify(data),
  contentType: 'application/json',
  
  success: function (){
              alert('삭제를 성공하였습니다')
              console.log('삭제를 성공하였습니다');
              location.reload()
  },            
  error: function (request, status, error){
          alert(request.status + '\n' + request.responseText + '\n' + error)
  }

});
};
  
  function add(formdata){

return fetch('/admin/notice/update',{
                method: 'POST',
                body:  formdata,
                // dataType: 'text',
                // headers: {
                //   "Content-Type":"text/xml"
                // },
                })
                .then(function(response){
                  return response.text()
                })
               .catch(alert("수정 되었습니다."));

}

function update(){

  let noticeno = document.getElementById('noticeno').value;
  let wname = document.getElementById('wname').value;
  let title = document.getElementById('title').value;
  let content = document.getElementById('content').value;
  let passwd = document.getElementById('passwd').value;
  let key = document.getElementById('fnameMF').value;


const formdata = new FormData();
const fileField = document.querySelector('input[type="file"]');

formdata.append('noticeno', noticeno);
formdata.append('wname', wname);
formdata.append('title', title);
formdata.append('content', content);
formdata.append('passwd', passwd);

if(fileField.files[0] != null){
formdata.append('fnameMF', fileField.files[0]);
}

  add(formdata)
  .then(function(url){
    return location.href = url
  });
}

  </script>
</body> 
</html> 