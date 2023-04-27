var modal = document.getElementById("modal");
var btn = document.getElementById("upload-btn");
var btnOne = document.getElementById("upload-btn-one");
var span = document.getElementById("close");
console.log(span);

btn.onclick = function () {
    modal.style.display = "block";
   
};

span.onclick = function () {
    console.log('vlivkrf');
    modal.style.display = "none";
};

btnOne.onclick = function () {
    modal.style.display = "block";
    
};

btnTwo.onclick = function () {
    modal.style.display = "block";
};


window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};
