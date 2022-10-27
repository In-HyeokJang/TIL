const h1 = document.querySelector("div.hello:first-child h1");

function handleTitleClick(){
    h1.innerText = "That was a right click";
    h1.style.color = "orange"
}

function hadleMouseEnter(){
    h1.innerText = "The mouser is here!";
    h1.style.color = "skyblue";
}

function hadleMouuseLeave(){
    h1.innerText = "The mouser is gone!";
    h1.style.color = "blue";
}


h1.addEventListener("contextmenu",handleTitleClick);
h1.addEventListener("mouseenter", hadleMouseEnter); //마우스가 들어오면 이벤트 실행
h1.addEventListener("mouseleave", hadleMouuseLeave); // 마우스가 밖으로 나가면 이벤트 실행


function handleWindowResize(){
    h1.innerText = "Your just resized!";
    h1.style.color = "purple";
}

window.addEventListener("resize", handleWindowResize); //화면 크기 움직일때 이벤트 실행









