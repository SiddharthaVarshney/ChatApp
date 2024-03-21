document.getElementById("btn1").addEventListener("click", changeContent1);
document.getElementById("btn2").addEventListener("click", changeContent2);

function changeContent1(){
    var text = document.getElementById("textarea2").value();
    document.getElementById("textarea1").innerHTML = `Second: ${text}`;
}

function changeContent2(){
    var text = document.getElementById("textarea1").value();
    document.getElementById("textarea2").innerHTML = `Second: ${text}`;    
}