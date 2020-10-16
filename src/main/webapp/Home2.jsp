<%-- 
    Document   : Home
    Created on : Mar 14, 2019, 5:06:44 AM
    Author     : User
--%>


<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            
       * {box-sizing: border-box;}

body {
  font-family: Arial, Helvetica, sans-serif;
}

a:link {
  color: black;
  text-decoration: none
}

/* visited link */
a:visited {
  color: black;
  text-decoration: none
}

/* mouse over link */
a:hover {
  color: blue;
  text-decoration: none
}

/* selected link */
a:active {
  color: blue;
  text-decoration: none
}

.column{
    float: left;
    padding: 1px;
    color: black;
    background-color: white;
}

.row:after{
    content: "";
    display: table;
    clear: both;
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: #3E1B0F; 
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.topnav {
  list-style-type: none;
  overflow: hidden;
  margin: 0;
  padding: 0;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #EFEAE2;
}

.topnav a {
  float: right;
  font-size: 16px;
  color: #3E1B0F; 
  text-align: left;
  padding: 14px 16px;
  text-decoration: none;
}

.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #3E1B0F; 
  color: white;
}

.topnav a.active {
  background-color: #3E1B0F;
  color: white;
}

.topnav .search-container {
  float: left;
}

.dropdown-content {
  display: none;
  position: fixed;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: #564A3D;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: white;
  font-size: 17px;
  border: none;
  cursor: pointer;
  width : 36px;
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
     
            
            
            
            
            
            
         .mySlides {display:none;
         width:600px;
  height:400px;
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
border: 4px solid #9999ff !important;
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
        
    </head>
    
    <body style="background:url(Backgrounds/bg.jpg);background-size: 100%;background-repeat: no-repeat;">
        <script type="text/javascript">
function searchType(){
var searchType = document.getElementById("searchType");
var selectedItem = searchType.options[searchType.selectedIndex].value;

}
</script>
<!--    navigation bar starts   -->
<div class="topnav" style="border-bottom: thin solid #ccc; box-shadow: 0 5px 5px -5px #ccc">
<div class="column" style="width: 10%; background-color: #EFEAE2"></div>
<img src="logo1_2.png" alt="BookWorm" width="200" height="50" style="float: left">
<div class="column" style="width: 10%; background-color: #EFEAE2"></div>
<div class="search-container" style="width: 400px">
    <form name ="searchForm" method="post" action="Search">
        <select id="searchType" name="searchType"  onchange="searchType()" style="height: 35px; width:84px; border:none; background_color: white">
    <option selected value="default"> Search by </option>
    <option value="All">All</option>
    <option value="Title">Title</option>
    <option value="Author">Author</option>
    <option value="Genre">Genre</option>
    </select>
      <input type="text" placeholder="Search.." name="title" class="form-control" style="width: 259px"><button type="submit"><i class="fa fa-search"></i></button>
      
    </form>
  </div>
<div class="column" style="width: 10%; background-color: #EFEAE2; float: right"></div>
<% String username=(String)session.getAttribute("username"); 
            if(username.equals("naimajonaki001@gmail.com")){%>
 <div class="dropdown">
    <button class="dropbtn">Admin 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="AllBooks">All Books</a>
      <a href="allUser">All User</a>
      
      <a href="addBook.jsp">Add Books</a>
    </div>
  </div>
 <%}%>
  <div class="dropdown">
    <button class="dropbtn">My Account 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
        <a href="#">Account Settings</a>
      <a href="#">My Bookshelf</a>
      <a href="Logout">LogOut</a>
    </div>
    </div>
    <a href="UserProfile.jsp">Profile</a>
    <a href="Home.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Browse 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">All Books</a>
      <a href="#">Genre</a>
      <a href="#">Most Liked</a>
    </div>
  </div>
</div>
<hr color="#DEDEDE" width="4"><br><br><br><br><br>
<!--    navigation bar ends   -->
        <br>   
       
        
     <form name ="searchForm" method="post" action="Search"  >
<input type="text" name="title" class="form-control" placeholder="Search books" 
       style="width:180px; height:30px; ">


<script type="text/javascript">
function searchType(){
var searchType = document.getElementById("searchType");
var selectedItem = searchType.options[searchType.selectedIndex].value;

}
</script>

<select id="searchType" name="searchType"  onchange="searchType()" style="width:150px; height:30px;
        background-color: lightskyblue" >
    <option selected value="default"> Search by </option>
    <option value="All">All</option>
    <option value="Title">Title</option>
    <option value="Author">Author</option>
    <option value="Genre">Genre</option>
</select> 

<br><br>




<button type="submit"  style="background-color:#007bff;border-color: #007bff;font-weight: 400;display:inline-block;
        ;vertical-align: middle;font-size: 1rem;border-radius: .25rem;border: 1px solid transparent;
        transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow 
        .15s ease-in-out;text-align: center;color:white;width:80px; height:30px;" 
        name="save" class="btn btn-primary">Search</button>
        



</form>
   


<div style="padding-left:16px">
  
</div>
        <h2 class= "glow" style="color:#000066; font-family: cursive; font-size: 300%">BookWorm</h2>
        <marquee behavior="slide" direction="left" scrollamount="40">

        <h2 align="center" style="color:blueviolet">Welcome to BookWorm Home Page.</h2></marquee>
    <% if (session.getAttribute("userName") == null) {%>
<jsp:forward page="/Login.jsp"/>
<% } %>
        <%
            response.setHeader("Cache-Control","no cache,no store,must-revalidate");
            if(session.getAttribute("userName")==null){
                response.sendRedirect("Login.jsp");
            }
            %>
        
        <div class="w3-content w3-section" style="max-width:500px">
            
  <img class="mySlides" style="float: left" src="academ.PNG" height="400"width="400">
  <img class="mySlides" style="float: left" src="fiction.PNG" sheight="400"width="400">
  <img class="mySlides" style="float: left" src="thriller.jpg" style="height">
  <img class="mySlides" style="float: left" src="romance.jpg" height="400"width="400">
            
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
<%--<a href="UserProfile.jsp">Profile</a> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> --%>
        
        
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
        <div align="center" class="bg" ></div>
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
