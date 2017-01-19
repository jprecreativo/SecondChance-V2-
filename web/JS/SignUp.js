
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

var errorMessage = "";

function validateEmail(email)
{
    var validateEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    
    if(!validateEmail.test(email))
        errorMessage += "Invalid email.\n";
}

function validatePassword(pass, passConf)
{
    var validatePass = new RegExp("(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");
    
    if(!validatePass.test(pass))
        errorMessage += "Invalid password.\n";
    
    if(pass !== passConf)
        errorMessage += "Password and repeat password not match.\n";
}

function validateZC(ZC)
{
    if(isNaN(ZC))
        errorMessage += "Invalid zip/postal code.\n";
}

function validateFB(FB)
{
    var validateFB = new RegExp("^[a-z\\d\\.]{5,}$");
    
    if(!validateFB.test(FB))
        errorMessage += "Invalid Facebook username.\n";
}

function validateTW(TW)
{
    var validateTW = new RegExp("^@[a-zA-Z0-9]+$");
    
    if(!validateTW.test(TW))
        errorMessage += "Invalid Twitter '@'.\n";
}

function validatePhoneNumber(phoneNumber)
{
    var validatePhoneNumber = /^\d{9}$/;
    
    if(!validatePhoneNumber.test(phoneNumber))
        errorMessage += "Invalid phone number.\n";
}

function validateCaptcha(captcha)
{
    switch(numCaptcha)
    {
        case 1:
                if(captcha != "95inb")
                    errorMessage += "Invalid captcha";
                
                break;
                
        case 2:
                if(captcha != "zenwj")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 3:
                if(captcha != "qa8uf")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 4:
                if(captcha != "eduzt")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 5:
                if(captcha != "jnjd5")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 6:
                if(captcha != "ndtf9")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 7:
                if(captcha != "tza3p")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 8:
                if(captcha != "8l3qs")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 9:
                if(captcha != "bdpkr")
                    errorMessage += "Invalid captcha";
                
                break;
            
        case 10:
                if(captcha != "9lup6")
                    errorMessage += "Invalid captcha";
                
                break;
    }
}

function validate()
{
    validateEmail(document.getElementById("emailValue").value);
    validatePassword(document.getElementById("pass").value, document.getElementById("passConfirmation").value);
    
    // if("" != document.getElementById("ZC_value").value)
        // validateZC(document.getElementById("ZC_value"));
    
    if("" != document.getElementById("FB").value)
        validateFB(document.getElementById("FB").value);
    
    if("" != document.getElementById("TW").value)
        validateTW(document.getElementById("TW").value);
    
    if("" != document.getElementById("phoneNumber").value)
        validatePhoneNumber(document.getElementById("phoneNumber").value);
    
    validateCaptcha(document.getElementById("captchaText").value);
    
    if("" == errorMessage)
        return true;
    
    else
    {
        alert(errorMessage);
        
        return false;
    }
}
