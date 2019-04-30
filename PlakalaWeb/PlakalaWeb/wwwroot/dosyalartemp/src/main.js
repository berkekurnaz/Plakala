var icon = document.querySelector("i");
var nav = document.querySelector(".Header-nav");

icon.addEventListener("click", () => {

    if(nav.classList.contains("down")){
        nav.classList.remove("down");
        icon.classList.add("yeni");       
    }else{
        nav.classList.add("down");
    }

    
});

icon.addEventListener("click", () => {
    icon.classList.add("down-icon")
})