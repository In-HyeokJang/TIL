
$(function(){

	$("#btn1").click(function(){
//	if(id == null || id == ""){
//		if(confirm("로그인이 필요합니다. ")){
//			let url = "/member/login?rurl=/contents/detail/"+listno+"&"+param;
//			location.href=url;
//			return;
//		}
//	}else{

// 	}

//	 var content = document.querySelector("#content").value;
//
//
//      alert(content+":"+listno);



  	var data = {
		"listno" : listno
	}
	console.log(data);

 	$.ajax({

	    type : "post",
	    url : "/list/read", //+ "?id=" + id + "&pw=" + pw,
	     data : JSON.stringify(data),
	    //data: data,
	    // dataType:"json",
	    contentType: "application/json",
	    success:function(data){
		   console.log('성공입니다.');
		   console.log(data);

				console.log(data);
				alert(data+"성공");

	    },
	    error:function(){
	        alert("에러입니다");
	    }
	});
		});
});