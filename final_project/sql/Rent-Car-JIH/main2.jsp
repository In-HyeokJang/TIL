<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
    <title>Document</title>
    <style>

#mainReservationTable{
  border: 2px solid #EAEAEA;
  height: 600px;
  width: 750px;
}

#mainBottomDiv{
  border: 2px;
  float: left;
  width: 33%;
}

    </style>
</head>
<body>

  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">ISOSIM-Car</a>
      </div>
  
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">차량대여 <span class="sr-only">(current)</span></a></li>
          <li><a href="#">충전소위치</a></li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span class="caret"></span></a>
            
          <ul class="dropdown-menu" role="menu">
              <li><a href="#">자유게시판</a></li>
              <!-- <li><a href="#">실시간채팅</a></li> -->
              <li><a href="#">event</a></li>
              <li><a href="#">Q&A</a></li>
            </li>
            </ul>
          
        </ul>
        <form class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">로그인 / 회원가입</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">차량관리 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

    <div class="container" id="mainReservationTable" >

        <h1 class="col-sm-offset-2 col-sm-10">예약</h1>
          <form class="form-horizontal" 
                action=""
                method="">
            
                <div class="form-group">
                  <label class="control-label col-sm-2">언제 필요하세요?</label>
                </div>

            <div class="form-group">
              <label class="control-label col-sm-2" for="">대여일</label>
              <div class="col-sm-4">
                <input type="date" class="" id="" 
                placeholder="" name="" required="required" 
                value=''>
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-sm-2" for="">반납일</label>
              <div class="col-sm-4">          
                <input type="date" class="" id="" 
                placeholder="" name="" required="required">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-sm-2" for="">어디서 사용하실예정인가요?</label>
              <div class="col-sm-4">
                <select name="" id="" required="required">
                  <option value="">--지점을 선택해주세요--</option>
                  <option value="">서울지점</option>
                  <option value="">인천지점</option>
                  <option value="">수원지점</option>
              </select>
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-sm-2" for="">어떤 차가 필요하세요?</label>
              <div class="col-sm-4">
                <select name="" id="" required="required">
                  <option value="">--차량을 선택해주세요--</option>
                  <option value="">현대차</option>
                  <option value="">테슬라</option>
                  <option value="">홍차</option>
              </select>
              </div>
            </div>        
        
            <div class="form-group">
            <div class="col-sm-4">

              <button>예약</button>&nbsp;&nbsp;<button>예약조회</button>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#findReservation">
                예약확인
              </button> 
            </div>
            </div>

        </div>

        <div class="container" id="mainBottomDiv">
          <div>
						<h3>2022입고 차량랜트 하기</h3>
						<p>
							2022 신형 전기차<BR>
              체험할 절호의 기회!!
						</p>
						<div>
							<a href="">바로가기</a>
        </div>
        

        <div class="container" id="mainBottomDiv">
          <div>
						<h3>후기 남기러 가기</h3>
						<p>
							후기작성하고<BR>
              선물 받아가세요<BR>
              
						</p>
						<div>
							<a href="">바로가기</a>
        </div>
        </div>

</div>

<!-- Modal -->
<div class="modal fade" id="findReservation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예약조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
      
        <div class="form-group">
          <label class="control-label col-sm-2" for="">휴대폰 번호</label>
          <div class="col-sm-4">
            <input type="text" class="" id="" 
            placeholder="" name="" required="required" 
            value=''>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="">대여일</label>
          <div class="col-sm-4">
            <input type="date" class="" id="" 
            placeholder="" name="" required="required" 
            value=''>
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-2" for="">반납일</label>
          <div class="col-sm-4">          
            <input type="date" class="" id="" 
            placeholder="" name="" required="required">
          </div>
        </div>
      
      </div>
      
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="findIDInModal">아이디 찾기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>        
</body>
</html>

