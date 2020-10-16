<%-- 
    Document   : Login
    Created on : Mar 14, 2019, 4:35:38 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1" >
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="320364682238-qnv522mnt2dmrr1copv85hr37esgg63j.apps.googleusercontent.com">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        <title>BookWorm: Login</title>
    </head>
    
    


    <body style="background:url(Backgrounds/bg.jpg);background-size: 100%;background-repeat: no-repeat;">
        <br>
       <br>
	

	<script>
	function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      console.log('id_token: ' + googleUser.getAuthResponse().id_token);

     //do not post above info to the server because that is not safe.
     //just send the id_token

      var redirectUrl = 'Login';
      //using jquery to post data dynamically
      var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
    $('body').append(form);
    form.submit();
    }

	</script>
        <div class="row">
            <p style="text-align:center"><img src="logo1.png" alt="BookWorm" width="370" height="194"></p>
        </div>
        <div class="row">
            <div class="column" style="width: 29.5%; opacity: 1"></div>
            <div class="column" style="width: 30%;">  
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
        <div class="transbox" style="width: 30%">
             <h2 align="center" style="color:black" ><b> Login Form </b></h2> <br> <!--blueviolet-->
            
          
            <form name="myform"   action="Login2" method="post" >
                <p align="center"><b><font size="4" color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:</font></b> 
                <input type="email" size="25" style="border: 2px groove activecaption" placeholder="Enter your Email" name="uname"><br><br>
                <b><font size="4" color="black">Password:</font></b> <input type="password" size="25" style="border: 2px groove activecaption" placeholder="Enter your password" name="pass"><br><br>
                <br><button class="button" type="submit" value="Login" style="width: 60px; height: 30px; padding: 0px">
                <span>  Login </span>
            </button></p>
           
        </form>
        
            <div align="center"  >
            <h4>Don't have an account?</h4>
                    
            <a href="forgot.jsp">Forgot Password</a>&nbsp;&nbsp;&nbsp;
            <a href="SignUp.jsp">Sign Up</a></div></div></div></div>
    </body>
</html>
