
var numCaptcha;

window.onload = function() {
  
    numCaptcha = reloadCaptcha();
};

function reloadCaptcha()
{
    var num = Math.floor((Math.random() * 10) + 1);
    var captcha = document.getElementById("imgCaptcha");
    
    captcha.src = "/SecondChance/images/Captchas/Captcha" + num + ".png";
    
    return num;
}

var refreshButton = document.getElementById("refreshCaptcha");

refreshButton.onclick = function() {
  
    numCaptcha = reloadCaptcha();
};

function validate()
{
    alert(numCaptcha);
}
