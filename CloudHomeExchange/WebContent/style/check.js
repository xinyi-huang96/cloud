function $(elementId){
  return document.getElementById(elementId).value;
    }
function divId(elementId){
  return document.getElementById(elementId);
    }
/*用户名验证*/    
function checkUser(){
  var user=$("user");
  var userId=divId("user_prompt");
   userId.innerHTML="";    
  var reg=/^[a-zA-Z][a-zA-Z0-9]{3,15}$/;    
    if(reg.test(user)==false){
       userId.innerHTML="Username is incorrect";
    return false;
      }
    userId.innerHTML="";
      return true;
    }
/*密码验证*/    
function checkPwd(){
  var pwd=$("psw");
  var pwdId=divId("pwd_prompt");
   pwdId.innerHTML="";    
  var reg=/^[a-zA-Z0-9]{4,10}$/;    
    if(reg.test(pwd)==false){
       pwdId.innerHTML="4-10 characters consisting of letters and numbers";
    return false;
      }
    pwdId.innerHTML="";
      return true;
    }
    
function checkRepwd(){
  var repwd=$("repsw");
  var pwd=$("psw");
  var repwdId=divId("repwd_prompt");
   repwdId.innerHTML="";
    if(pwd!=repwd){
       repwdId.innerHTML="Passwords are inconsistent";
    return false;
      }
    repwdId.innerHTML="";
      return true;
    }
 
/*验证邮箱*/
function checkEmail(){
  var email=$("email");
  var email_prompt=divId("email_prompt");
  email_prompt.innerHTML="";
  var reg=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;    
    if(reg.test(email)==false){
      email_prompt.innerHTML="Email format is incorrect,like abc@gmail.com";
      return false;
      }
      email_prompt.innerHTML="";
      return true;
}
/*验证手机号码*/
function checkMobile(){
    var mobile=$("mobile");
    var mobileId=divId("mobile_prompt");
    var regMobile=/^[06/07]\d{9}$/;
    if(regMobile.test(mobile)==false){
        mobileId.innerHTML="Mobile phone number is incorrect, please re-enter";
        return false;
        }
        mobileId.innerHTML="";
        return true;
    }