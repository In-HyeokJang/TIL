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

<form class="form-horizontal">

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
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>

</form>

</div>
<script>
// $("#deleteFile").click(function(){
//   // function deleteFile(){
//     // confirm("정말로 파일을 삭제하시겠습니까?")

//     var noticeno = document.querySelector("#noticeno").value;
//     var oldFile = document.querySelector("#oldFile").value;
//     console.log(noticeno);
//     console.log(oldFile);
//     var data = { "noticeno" : noticeno,
//                   "oldFile" : oldFile              
//   } 
    
//     alert(data); 
 
//     $.ajax({ 
      
//       type : "post", 
    
//     url : "/notice/deletefile", 
    
//     dataType:"json",
    
//     data : JSON.stringify(data),

// contentType: "application/json",

//     success:
    
//       function(data){ 
        
//           console.log('성공입니다.'); 
//           console.log(data); 
        
//           alert("성공입니다.") }, 
        
//           error:
//             function(){ alert("에러입니다"); } });



// let oldFile = document.getElementById("oldFile").value;
// alert(oldFile);

// // const formdata = new FormData();
// // alert(formdata);
// // formdata.append("oldfile",oldFile);

//     fetch('/notice/deletefile/${noticeno}',{
      
//       method: 'GET',
//     //  body:formdata,
//       body: 'text'
      
//     })
//     .then(response => response.text)
//     .then(function(response){
//       if(respons.oldFile == ''){
//         alert('삭제를 성공하였습니다')
//       }else{
//         alert('삭제를 실패하였습니다')
//       }
      
//     })
//     .then(result => document.getElementById('oldFile').value(result))
//     //이게맞나?
//     .catch(console.log('실패'))
//   });


document.getElementById("deleteFile").onclick = function () {

  let oldFile = document.getElementById("oldFile").value;
  
  let noticeno = document.getElementById("noticeno").value;
  
  alert(noticeno);
  alert(oldFile);

//   let formData = new FormData()

//   formdata.append("noticeno", noticeno);
//   formData.append("oldFile", oldFile);

  const data = {
            noticeno : noticeno,
            fname : oldFile
}

$.ajax({
  url: '/notice/deletefile',
  type: 'post',
  dataType:'json',
  data : JSON.stringify(data),
  contentType: 'application/json',
  
  success: function success(){
              alert('삭제를 성공하였습니다')
              location.reload()
            
  },            
  error: function error(){
          alert('삭제를 실패하였습니다')
            
  }

});
};
//  alert(data);
//       fetch('/notice/deletefile',{
      
//             method: 'POST',
//             body:JSON
//           })
//           .then(response => response.json())
//           .then(function(result){
//             if(result.fname == ''){
//               alert('삭제를 성공하였습니다')
//             }else{
//               alert('삭제를 실패하였습니다')
//             }
            
//           })
//           .then(result => document.getElementById('oldFile').value(result))
//           //이게맞나?
//           .catch(console.log('실패'))

//     };


  </script>
</body> 
</html> 