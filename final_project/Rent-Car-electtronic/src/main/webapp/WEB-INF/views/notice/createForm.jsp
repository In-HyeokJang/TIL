<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <title>notice</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <script
        type="text/JavaScript"> // function checkIn(f){ // if (f.wname.value == ""){ // alert("글쓴이를 입력하세요"); // f.wname.focus() // return false; // } // if (f.title.value == ""){ // alert("제목를 입력하세요"); // f.title.focus(); // return false; // } // if (f.content.value == '') { // window.alert('내용을 입력해 주세요.'); // f.content.focus(); // return false; // } // if (f.passwd.value == ""){ // alert("패스워드를 입력하세요"); // f.passwd.focus(); // return false; // } // } </script>
</head>
<<<<<<< HEAD

<body>
    <div class="container">
        <h2 class="col-sm-offset-2 col-sm-10">공지 생성</h2>
        <form class="form-horizontal" id="form1">
            <div class="form-group"> <label class="control-label col-sm-2" for="wname">작성자</label>
                <div class="col-sm-6"> <input type="text" name="wname" id="wname" class="form-control" required> </div>
            </div>
            <div class="form-group"> <label class="control-label col-sm-2" for="title">제목</label>
                <div class="col-sm-8"> <input type="text" name="title" id="title" class="form-control" required> </div>
            </div>
            <div class="form-group"> <label class="control-label col-sm-2" for="content">내용</label>
                <div class="col-sm-8"> <textarea rows="12" cols="7" id="content" name="content"
                        class="form-control"></textarea> </div>
            </div>
            <div class="form-group"> <label class="control-label col-sm-2" for="fnameMF">첨부파일</label>
                <div class="col-sm-6"> <input type="file" name="fnameMF" id="fnameMF" class="form-control"> </div>
            </div>
            <div class="form-group"> <label class="control-label col-sm-2" for="passwd">비밀번호</label>
                <div class="col-sm-6"> <input type="password" name="passwd" id="passwd" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5"> <button class="btn" onClick="create()">등록</button> <button
                        class="btn" onClick="javscript:location.href = '/notice/list'">목록</button> <button type="reset"
                        class="btn">취소</button> </div>
            </div>
        </form>
=======
<body> 
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">공지 생성</h2>
<div class="form-horizontal" id="form1" >
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="wname" id="wname" class="form-control" required>
>>>>>>> bd9a9eadf5d02d91de22e4bcc4919756d93b13ff
    </div>
    <script>
     function add(formdata) {
            //wname, title, content, fnameMF, passwd
            return fetch('/notice/create', {
                method: 'POST',
                body: formdata,
            })
                .then(function (response) {
                    return response.text()
                })
                .then(result => alert(result))
                .catch(alert('실패'));
        }
        function create() {
            var wname = document.getElementById('wname').value;
            var title = document.getElementById('title').value;
            var content = document.getElementById('content').value;
            var passwd = document.getElementById('passwd').value;
            var key = document.getElementById('fnameMF').value;

            const formdata = new FormData();
            const fileField = document.querySelector('input[type="file"]');
            formdata.append('wname', wname); formdata.append('title', title);
            formdata.append('content', content);
            formdata.append('passwd', passwd);
            if (fileField.files[0] != null) {
                formdata.append('fnameMF', fileField.files[0]);
            }
            add(formdata).then(function (url) {
                return alert(url)
            })
            return location.href = "/notice/list";
        }
    </script>
</body>

<<<<<<< HEAD
</html>
=======
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control" required>
    </div>
  </div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn" onClick="create()">등록</button>
    <button class="btn" onClick="javscript:location.href = '/notice/list'">목록</button>

    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</div>
</div>
<script>

function add(formdata){

  return fetch('/admin/notice/create',{
                  method: 'POST',
                  body: formdata,
      
                  })
                  .then(function(response){
                    return response.text()
                  })
                  .catch(alert('글등록에 성공했습니다'));
  
  }
  
  function create(){
  
    var wname = document.getElementById('wname').value;
    var title = document.getElementById('title').value;
    var content = document.getElementById('content').value;
    var passwd = document.getElementById('passwd').value;
    var key = document.getElementById('fnameMF').value;
  

  const formdata = new FormData();
  const fileField = document.querySelector('input[type="file"]');
  
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
>>>>>>> bd9a9eadf5d02d91de22e4bcc4919756d93b13ff
