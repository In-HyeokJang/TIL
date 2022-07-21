

$(function(){
	$("#addreviewBtn").click(function(){


	 var content = document.querySelector("#content").value;


      alert(content+":"+listno);



  	var data = {
		"content" : content,
		"listno" : listno
	}
	console.log(data);

 	$.ajax({

	    type : "post",
	    url : "/review/create", //+ "?id=" + id + "&pw=" + pw,
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


		$("#delete").click(function(){






          	var data = {
        		"rnum" : rnum
        	}
        	console.log(data);

         	$.ajax({

        	    type : "delete",
        	    url : "/review/${rnum}", //+ "?id=" + id + "&pw=" + pw,
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