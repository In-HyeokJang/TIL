<%@ page contentType="text/html; charset=UTF-8" %>

  <!DOCTYPE html>
  <html>

  <head>
    <title>notice</title>
    <meta charset="utf-8">




  </head>

  <body>
    <div class="container">
 <h1>맛집 추가</h1>

      <form class="form-horizontal" action="./create" method="post" enctype="multipart/form-data"
        onsubmit="return checkIn(this)">

 <br>
         <div class="form-group">

             <div class="col-sm-6">
             <input type="text" name="wname" id="wname" class="form-control"  style="width:100px;font-size:16px;border: none;" value="${sessionScope.id}" readonly>
             </div>
           </div>
           <div class="form-group">

             <div class="col-sm-8">
               <input type="text" name="title" id="title" class="form-control" placeholder= '제목을 입력해 주세요.' style="width:500px;font-size:16px;">
             </div>
           </div>

            <div class="form-group">

             <div class="col-sm-8">
              <textarea id="summernote" name="content" class="summernote"></textarea>
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


 <script src="/js/list/create.js" defer></script>
 <!-- include libraries(jQuery, bootstrap) -->
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

 <!-- include summernote css/js -->
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 <link rel="stylesheet" type="text/css" href="/css/list/create.css"/>
  </body>

  </html>