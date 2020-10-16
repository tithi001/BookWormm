<%-- 
    Document   : Home
    Created on : Mar 14, 2019, 5:06:44 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style>
          *  {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 20%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
} 
.sideByside{
    width:150px;
  height:200px;
}
            
            
         .mySlides {display:none;
         width:100%;
  height:100%;
  float:top;
  
 padding: 0 20px 20px 0;
 opacity: 0.8;
  filter: alpha(opacity=80);
         }
         
         .example_c {
             color: #ffffff!important;
text-transform: uppercase;
text-decoration: none;
background: #9999ff;
padding: 20px;
border: 4px solid #000033 !important;
display: inline-block;
transition: all 0.4s ease 0s;
opacity: 0.6;
  filter: alpha(opacity=60);
  height: 50px;
  width: 120px;
}
.example_c:hover {
color: #ffffff !important;
background: #000066;
border-color: #000066 !important;
transition: all 0.4s ease 0s;
}
         
         
         
         
         
         h2 {
  color: white;
  text-shadow: 2px 2px 4px #000000;
}
h22{
    color: #000033;
  text-shadow: 2px 2px 4px #000000;
  font-size:  xx-large;
}


.glow {
  font-size: 80px;
  color: #000033;
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
   
      
* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 9px 15px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
      </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Worm Home</title>
        <link rel = "icon" href =  
"BookWormLogo.png" 
        type = "image/x-icon"> 
    </head>
    <body style="background:url(BookWorm.jpg);background-size: 100%;background-repeat: no-repeat;">
    
        
       
        
        
     <div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="#myboks">Mybooks</a>
  <a href="history.jsp">History</a>
  <a href="#browse">Browse</a>
  <a href="UserProfile.jsp">Profile</a>
  <a href="#acSettings">Account Settings</a>
  <div class="search-container">
    <form action="/Login.jsp">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit" style="width: 40px; height: 20px;" class="search-container button" value="search"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>



<div style="padding-left:16px">
  
</div>
        <img src="BookWormLogo.png" height="150" width="300"/><br><br><br>
        <h2 class= "glow" style="color:#000066; font-family: cursive; font-size: 200%">WELCOME</h2>
        <%-- <marquee behavior="slide" direction="left" scrollamount="40">
        

<h2 align="center" style="color:blueviolet">Welcome to BookWorm Home Page.</h2></marquee>--%>
        <%
            response.setHeader("Cache-Control","no cache,no store,must-revalidate");
            if(session.getAttribute("username")==null){
                response.sendRedirect("Login.jsp");
            }
            %>
        
        <div class="w3-content w3-section" style="max-width:500px">
            
  <img class="mySlides" style="float: left" src="academ.PNG" height="400" width="400">
  <img class="mySlides" style="float: left" src="fiction.PNG" height="400" width="400">
  <img class="mySlides" style="float: left" src="thriller.jpg" height="400" width="400">
  <img class="mySlides" style="float: left" src="romance.jpg" height="400" width="400">
            
</div>
        
        <script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script> 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
S
    <center><h2>Select Genre</h2></center>
        <div style="padding-bottom: 16px">
<% ResultSet rs = (ResultSet)session.getAttribute("rs");
         //System.out.println("here");
while(rs.next()){//System.out.println("her2e");
       // System.out.println(rs.getString("genre_name"));
        %>
        <div class="button_cont" align="center"><a class="example_c" href="add-website-here" target="_blank" rel="nofollow noopener"><%=rs.getString("genre_name") %></a></div>
        <br>


 <%               //out.println(genre1);
}
    %>
    
        </div>

    
    

        
        

<br>
<br>
<br>
<br>

<form method="get" action="Logout2" ><p><INPUT TYPE=SUBMIT VALUE='logout' name="s2"> </p> </form>

 

    
<h2>Most Recent This Month</h2>
    <div class="row">
  <div class="column">
    <a href="https://www.w3schools.com"><img class="sideByside" src="HP.jpg" alt="Snow" ></a>
  </div>
  <div class="column">
    <a href="https://www.w3schools.com"><img class="sideByside" src="fire_blood.jpg" alt="Forest" ></a>
  </div>
  <div class="column">
    <a href="https://www.w3schools.com"><img class="sideByside" src="hope.jpg" alt="Mountains" ></a>
  </div>
        <div class="column">
    <a href="https://www.w3schools.com"><img class="sideByside" src="living.jpg" alt="Mountains" ></a>
  </div>
        <div class="column">
    <a href="https://www.w3schools.com"><img class="sideByside" src="queen.jpg" alt="Mountains" ></a>
  </div>
</div>
</body>
        
</html>    
    

