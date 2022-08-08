$(function(){
//$("#btn3").click(function(){
 var carnumber = document.querySelector("#carnumber").value;
 var carname = document.querySelector("#carname").value;
 var carprice = document.querySelector("#carprice").value;
 var category = document.querySelector("#category").value;
 var caryearmodel = document.querySelector("#caryearmodel").value;
 var carseate = document.querySelector("#carseate").value;
 var carpoint = document.querySelector("#carpoint").value;
 var filenameMF = document.querySelector("#filenameMF").value;

    
 console.log(carnumber);
 console.log(carname);
 console.log(carprice);
 console.log(category);
 console.log(caryearmodel);
 console.log(carseate);
 console.log(carpoint);
 console.log(filenameMF);
  	var data = {
		"carnumber" : carnumber,
		"carname" : carname,
		"carprice" : carprice,
		"category" : category,
		"caryearmodel" : caryearmodel,
		"carseate" : carseate,
		"carpoint" : carpoint,
		"filenameMF" : filenameMF
	}
	console.log(data);


//fetch(`/carinfo/create`,{method: 'POST', body : data})
//.then(response => response.text())
//.then(location.reload())
//.catch(console.log);
//});

//$.ajax({
//
//        type : "post",
//	    url : url,
//	    data : JSON.stringify(data),
//	    //data: data,
//	    // dataType:"json",
//	    contentType: "application/json",
//	    success:function(){
//		   console.log('성공입니다.');
//	    },
//	    error:function(){
//	        alert("에러입니다");
//	    }
//	});

});