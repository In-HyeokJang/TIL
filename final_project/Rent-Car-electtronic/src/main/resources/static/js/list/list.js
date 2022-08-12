
$("#create_btn").click(function(){ //글 만들기
var id =document.querySelector("#id").value;
if(id === ""){
alert("로그인 후 이용해주세요.");
location.href='/user/login';
}else{
 location.href='/user/contents/list/create';
}
});


 function read(listno){
       var url = "/user/contents/list/read";
       url += "?listno="+listno;
       location.href=url;
       }

$("#rcdStart").click(function(){ //마이크 클릭 함수
 if(!("webkitSpeechRecognition") in window){
        alert("Connect in Chrome Browser");
    }else{
        const speech = new webkitSpeechRecognition;

        document.getElementById("rcdStart").addEventListener("click",()=>{
         var result = confirm("마이크 사용을 허용합니다.")
         if(result){




        rcdStart.src ="/images/SJ/mic(red).png";
            speech.start();
            console.log('start!');

            setTimeout(function() {
             speech.stop();
             console.log('stop!');
              rcdStart.src ="/images/SJ/mic.png";
            }, 3000);

}else{
     alert("마이크 권한 불허용")
}
        });



        speech.addEventListener("result", (event)=>{
            console.log(event);
            const { transcript } = event["results"][0][0];
            console.log(transcript);
            resultListView(transcript);
        });

        function resultListView(transcript){
            document.getElementById("word").value = transcript;

        }
        }
});




