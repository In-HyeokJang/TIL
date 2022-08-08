window.onload = function(){
   
    const sliderWrap = document.querySelector('#slide_wrap');
    const slideGroup = document.querySelector('#slide_group');
    const lastImg = slideGroup.lastElementChild;
    const firstImg = slideGroup.firstElementChild;
    const nav = document.querySelector('#nav');
    let current = 1;
    let prev;
    let next;
    //노드복사!!!  중요 
    let clonedFirst = firstImg.cloneNode(true);
    //노드복사!!!  중요 
    let clonedLast = lastImg.cloneNode(true);

    //첫번째전에 추가하기
    slideGroup.insertBefore(clonedLast,slideGroup.firstElementChild);
    //마지막에 추가하기
    slideGroup.appendChild(clonedFirst);
    const slideImg = document.querySelectorAll('.slide_img');

    //스타일 작성하기
    //이미지를 감싸는 div의 크기를 이미지갯수 * 100%로 변경
    slideGroup.style.width = (slideImg.length) * 100 +'%';
    slideGroup.style.left = -(current*100)+'%';
    //슬라이드 이미지의 크기를 100/이미지갯수 %로 변경
    for(let i=0; i< slideImg.length; i++){
            slideImg[i].style.width = (100 / slideImg.length) + '%';
            slideImg[i].style.left = (i * (100 / slideImg.length)) + '%';
    }

    //nav에 이벤트 연결하기
    nav.addEventListener('click',function(e){
            e.preventDefault();
            if(e.target.className == 'next'){
                   
                    if(current <= 4){
                            next = current+1;
                            slideMove(next);
                    }
                     
                  
            }else {
                    if(current >= 0){
                            prev = current-1;
                            slideMove(prev);
                    }
                    if(current == 0){
                           lastCurrent();
                    }
                   
            }
            
    })
    isStop = false;
    nav.addEventListener('mouseenter',stopIt);
    nav.addEventListener('mouseleave',startIt);

    function slideMove(imgNum){
          
            slideGroup.style.transition = 0.5+'s';
            slideGroup.style.left = -(imgNum*100)+'%';
            current = imgNum;
//            console.log(current);
            if(imgNum==4){
                    firstCurrent();
            }
    }
    // let autoMove = setInterval(function(){
    //         if(!isStop){
    //                 slideMove(current+1);
    //         }else {
    //                 clearInterval(autoMove); 
    //                 // 밖에서 선언한 interval을 안에서 중지시킬 수 있음
    //         }
            
    // },2000);
    let timer;
    function startIt(){
            if(timer) stopIt()
            timer = setInterval(function(){
                    slideMove(current+1); 
 //                   console.log('진행중');
            }, 2000);

            
    }
    function stopIt(){
    clearInterval(timer);
 //   console.log('중지');
    }
    startIt() 
    function firstCurrent(){
            setTimeout(function() {
                    slideGroup.style.transition = "0ms";
                    slideGroup.style.left = -(0*100)+'%';
                    current = 0;
            }, 500);
    }
    function lastCurrent(){
            setTimeout(function() {
                    slideGroup.style.transition = "0ms";
                    slideGroup.style.left = -(400)+'%';
                    current = 4;
            }, 500);
    }

}