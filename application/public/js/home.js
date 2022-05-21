var container = document.getElementById("container");
if(container) {
    let fetchUrl = "https://jsonplaceholder.typicode.com/albums/2/photos";
    fetch(fetchUrl)
    .then(data => data.json())
    .then(photos => {
        photos.forEach((photo) => {
            createPhotoCard(photo, container);
        });
        total.innerText = photos.length;
    })
}

function createPhotoCard(photo, container){
    let card = document.createElement("div");
    card.className = "item";
    let img = document.createElement("img");
    img.src = photo.url;
    img.height = 200;
    img.width = 200;
    let textDiv = document.createElement("div");
    textDiv.innerText = photo.title;
    textDiv.classList = "text";
    card.appendChild(img);
    card.appendChild(textDiv);
    container.appendChild(card);
    card.onclick = function(){
        fadeOut(card);
    }    
}

function fadeOut(card) {
    var element = card;
    let num = total.innerText;
    var pic_opacity = 1; 
    var interval = setInterval(function () {
        if (pic_opacity <= 0.1)  {
            clearInterval(interval);
            element.remove();
            num--;
            total.innerText = num;
        }
        element.style.opacity = pic_opacity;
        pic_opacity -= 0.1;
    }, 50);
}