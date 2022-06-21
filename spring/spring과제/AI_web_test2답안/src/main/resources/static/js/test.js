$(function(){
	$("#login_btn").click(function(){
		alert($("#id").val() +" "+$("#pw").val());
		loginCheck($("#id").val(),$("#pw").val())
			.then(text => alert(text))
			.catch(console.log);
		
	});
});

function loginCheck(id,pw){
	return fetch(`/loginCheck?id=${id}&passwd=${pw}`)
			.then(response => response.text())
			.catch(console.log)
}