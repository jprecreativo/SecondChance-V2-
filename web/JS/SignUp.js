
var numCaptcha;

window.onload = function() {
  
    numCaptcha = reloadCaptcha();
};

function reloadCaptcha()
{
    var num = Math.floor((Math.random() * 40) + 1);
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
    var validateEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    
    if(!validateEmail.test(document.getElementById("emailValue").value))
    {
        window.open("/SecondChance/ViewItems.jsp", "_self");
        
        return false;
    }
}
