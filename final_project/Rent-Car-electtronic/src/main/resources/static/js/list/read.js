
$(function(){


$("#btn_update").click(function(){ //글 삭제

	var url = "/contents/list/update";
           url += "?listno="+listno;
//           url += "&col=${col}";
//           url += "&word=${word}";
//           url += "&nowPage=${nowPage}";
           location.href=url;

});






$("#btn_delete").click(function(){ //글 삭제

	console.log(listno);





$.ajax({
	url : "http://localhost:9090/contents/list/delete",
	type : 'post',
	data : {
		listno : listno
	},
	success : function(data) {
				location.href="/contents/list";
     },
	error : function() {
		alert("error");
	}
});





});






	$("#btn1").click(function(){ // 추천 up

	console.log(listno);


		fetch(`/list/${listno}`,{method: 'post'})
                       .then(response => response.text())
                        .then(location.reload())
                       .catch(console.log);

});


$("#delete").click(function(){ // 리뷰 삭제

var rnum = document.querySelector("#rnum").value;


       	console.log(rnum);



fetch(`/review/${rnum}`,{method: 'delete'})
               .then(response => response.text())
               .then(location.reload())
               .catch(console.log);

        		});




	$("#addreviewBtn").click(function(){// review create


	 var content = document.querySelector("#review11").value;
           	console.log(content);
  	var data = {
		"content" : content,
		"listno" : listno
	}
	console.log(data);

 	$.ajax({

	    type : "post",
	    url : "/review/create",
	     data : JSON.stringify(data),
	    //data: data,
	    // dataType:"json",
	    contentType: "application/json",
	    success:function(data){
		   console.log('성공입니다.');
		   console.log(data);
            location.reload()

	    },
	    error:function(){
	        alert("에러입니다");
	    }
	});
		});

});