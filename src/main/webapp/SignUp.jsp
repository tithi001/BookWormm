<%-- 
    Document   : SignUp
    Created on : Mar 14, 2019, 4:45:23 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- <style>
            h2 {
  color: white;
  text-shadow: 2px 2px 4px #000000;
}
.glow {
  font-size: 80px;
  color: whitesmoke;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #EBF5FB, 0 0 40px #D6EAF8  , 0 0 50px #85C1E9 , 0 0 60px #3498DB  , 0 0 70px #21618C  ;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #D6DBDF  , 0 0 40px #AEB6BF  , 0 0 50px #566573  , 0 0 60px #283747  , 0 0 70px #1C2833, 0 0 80px #1C2833  ;
  }
}

div.transbox {
    position: relative;
    width: 30%;
    height: 320px;
  margin: 10px;
  background-color: #ffffff;
  border: 3px solid black;
  opacity: .5;
  filter: alpha(opacity=50); /* For IE8 and earlier */
}


.button {
  display: inline-block;
  padding: 20px 40px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  text-decoration: #fff;
  outline: #ccccff;
  color: #fff;
  background-color: darkblue;
  border: #fff;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #6666ff}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style> -->
        
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
h2 {
  color: white;
  text-shadow: 2px 2px 4px #000000;
}

.column{
    float: left;
    padding: 16px;
    color: black;
}

.row:after{
    content: "";
    display: table;
    clear: both;
}

.glow {
  font-size: 80px;
  color: whitesmoke;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #EBF5FB, 0 0 40px #D6EAF8  , 0 0 50px #85C1E9 , 0 0 60px #3498DB  , 0 0 70px #21618C  ;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #D6DBDF  , 0 0 40px #AEB6BF  , 0 0 50px #566573  , 0 0 60px #283747  , 0 0 70px #1C2833, 0 0 80px #1C2833  ;
  }
}

div.transbox {
    position: absolute;
    float: left;
    padding: 20px;
  margin: 10px;
  background-color: #ffffff;
  border: 3px solid black;
  opacity: 0.5;
  filter: alpha(opacity=50); /* For IE8 and earlier height: 320px;*/
}


.button {
  display: inline-block;
  border-radius: 4px;
  background-color: darkblue;
  border: none;
  color:#fff;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  
  
}

.button:hover {background-color: #6666ff}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
        <title>BookWorm: Registration</title>
    </head>
    <body style="background:url(Backgrounds/bg.jpg);background-size: 100%;background-repeat: no-repeat;">
        <h2 class= "glow" style="color:#000066; font: Helvetica; font-size: 300%">BookWorm</h2>
        <br><br><br>
       <br>
        <script>  
function validateform(){  
var name=document.myform.uname.value;  
var password=document.myform.pass.value;  
  
if (name==null || name==""){  
  alert("Name can't be blank");  
  return false;  
}if (!(/\d/.test(password)&&/[a-z]+/.test(password)&&/[A-Z]+/.test(password))) {
        alert("Password must contain atleast one letter, small letter, capital letter");
        return false;
    }
   if (password.length < 8 || password.length > 20) {
        alert("Password must be 8-20 characters long");
        return false;
    }
}  
</script>  

<div class="row">
            <div class="column" style="width: 29.5%; opacity: 1"></div>
            <div class="column" style="width: 30%;">  
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
        <div class="transbox" style="width: 30%">
             <h2 align="center" style="color:black" ><b> Registration Form </b></h2> <br> <!--blueviolet-->
            
          
            <form name="myform"   action="SignUp" method="post" onsubmit="return validateform()">
                <p align="center"><b><font size="4" color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:</font></b> 
                <input type="email" size="25" style="border: 2px groove activecaption" placeholder="Enter your Email" name="uname"><br><br>
                <b><font size="4" color="black">Password:</font></b> <input type="password" size="25" style="border: 2px groove activecaption" placeholder="Enter your password" name="pass"><br><br>
                <br><button class="button" type="submit" value="Login" style="width: 60px; height: 30px; padding: 0px">
                <span>  Signup </span>
            </button></p>
            </form>
        
            <div align="center"  >
            <h4>Already have an account?</h4>
            <a href="Login.jsp">Login</a></div></div></div></div>





       <!-- <div class="transbox" position="relative" >
      <h1 align="center" style="color:blueviolet">Registration Form</h1>
      
          
       <form name="myform" action="SignUp" method="post" color="yellow" align="center" onsubmit="return validateform()"> -->
             <%-- <table align="center" color="yellow" width="250px" border=0 style="background-color:ffeeff">
                <tr>
                    <td style="font-size:12pt;" align="center">
                        <b><font size="4" color="black"> Email:</font></b></b>
                    </td>
                    <td>
                        <input type="email"size="25" style="border: 2px groove activecaption" placeholder="Enter your User Name" name="uname"><br><br>
                        
                    </td>
                </tr>
               
                <tr>
                    <td style="font-size:12pt;" align="center">
                        <b><font size="4" color="black">Password:</font></b>
                    </td>
                    <td>
                        <input type="password"size="25" style="border: 2px groove activecaption" placeholder="Enter your password" name="pass"><br><br>
                        
                    </td>
                </tr>
               
                 <tr>
                    <td>
                        
                        <button class="button" align="center"class="button" type="submit" value="Signup" style="width: 80px; height: 13px;">
                 Signup
            </button>
                    </td>
                </tr>
               
            </table> --%>
            <!--<b><font size="4" color="black">Email:</font></b> <input type="email"size="25" style="border: 2px groove activecaption"color="blue" placeholder="Enter your Email" name="uname"><br><br>
                <b><font size="4" color="black">Password:</font></b> <input type="password" size="25" style="border: 2px groove activecaption" placeholder="Enter your password" name="pass"><br><br>
            <button class="button" type="submit" value="Login" style="width: 100px; height: 13px;">
                 Signup
            </button>
        </form>
      
      <div align="center" class="bg" ></div>
      <center><h4>Already have an account?<h4><center>

                      <a href="Login2.jsp">Login</a></div> -->
    </body>
</html>
