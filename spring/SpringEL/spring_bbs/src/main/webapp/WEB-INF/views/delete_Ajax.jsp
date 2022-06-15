<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>글삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
  <script type="text/javascript">
        $(function(){
                $('#btn1').on('click',function(){
                        
                   var form = {
                        bbsno : $('#bbsno').val(),
                        passwd : $('#passwd').val(),
                        filename : $('#oldfile').val()            
                    }
                  alert(form.bbsno)  
                        //비공기 통신
                    $.ajax({
                    url: "./delete_Ajax",
                    type: "POST",
                    data: JSON.stringify(form),
                    contentType: "application/json; charset=utf-8;",
                    dataType: "json",
                    success: function(data){
                     
                        $('#red').text('');
                        $('#red').text(data.str);
                    },
                    error: function(request,status,error){
                       alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    }                    
                });//ajax end
                });     //버튼 이벤트설정 
        });//페이지로딩
                
  </script>
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
  <input type="hidden" name="bbsno" id="bbsno" value="${param.bbsno}">
  <input type="hidden" name="oldfile" id="oldfile" value="${param.oldfile}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn" id="btn1">삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</div>
</body> 
</html>