$(function(){
	$("#findId").click(function(){
        let mname = document.getElementById("mname").value;
		let email = document.getElementById("email").value;
		// alert(id + pw);
		return fetch(`/findId/${mname}/${email}`)
			   .then(response => response.json())
			   .then(response =>{
					alert("아이디는 " + response.id + "입니다.");
				})
			   .catch(() => {
                alert("아이디가 존재하지 않습니다.");
               });
			
	});

    $("#findPw").click(function(){
        let id = document.getElementById("id").value;
		let mname = document.getElementById("mname").value;
		// alert(id + pw);
		return fetch(`/findPw/${id}/${mname}`)
			   .then(response => response.json())
			   .then(response =>{
					alert("비밀번호는 " + response.passwd + "입니다.");
				})
			   .catch(() => {
                alert("아이디가 존재하지 않습니다.")
               });
			
	});
});