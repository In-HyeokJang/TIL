<%@ page contentType="text/html; charset=UTF-8" %>

  <!DOCTYPE html>
  <html>

  <head>
    <title>notice</title>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



    <style>
  .container {
    width: 1200px;
    margin: 0 auto;
    position: relative;
  }
    </style>

  </head>

  <body>
    <div class="container">
 <h1>맛집 추가</h1>

      <form class="form-horizontal" action="./create" method="post" enctype="multipart/form-data"
        onsubmit="return checkIn(this)">

 <br>
         <div class="form-group">

             <div class="col-sm-6">
             <input type="text" name="wname" id="wname" class="form-control" placeholder= '작성자를 입력해 주세요.' style="width:300px;font-size:14px;">
             </div>
           </div>
           <div class="form-group">

             <div class="col-sm-8">
               <input type="text" name="title" id="title" class="form-control" placeholder= '제목을 입력해 주세요.' style="width:1200px;font-size:14px;">
             </div>
           </div>

            <div class="form-group">

             <div class="col-sm-8">
              <textarea id="summernote" name="content" class="summernote"></textarea>
             </div>
          </div>











        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-5">
            <button id="btn">등록</button>
            <button type="reset" class="btn">취소</button>
          </div>

        </div>

      </form>
    </div>


 <script src="/js/list/create.js" defer></script>
     <script>
       let listno = "${dto.listno}";

     </script>
  </body>

  </html>