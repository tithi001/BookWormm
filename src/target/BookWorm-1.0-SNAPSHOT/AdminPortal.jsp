
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
<html>
<head>
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
</style>
</head>
<body bgcolor="#F6F4EE" style="width: auto">
    <%
            response.setHeader("Cache-Control","no cache,no store,must-revalidate");
            if(session.getAttribute("username")==null){
                //response.sendRedirect("Login.jsp");
            }
            %>
    
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
    <a href="NewHome.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Browse 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="AllBooks">All Books</a>
      <a href="#">Genre</a>
      <a href="MostRecent">Most Recent</a>
      <a href="#">Most Liked</a>
    </div>
  </div>
</div>
<hr color="#DEDEDE" width="4"><br><br><br><br><br><br><br><br>
<!--    navigation bar ends   -->


    <div class="row" style="width: auto">
        <div class="column" style="width: 9.5%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 20%; height: 100px; border: thin solid #ccc">
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        </div>
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 39%; height: 100px; border: thin solid #ccc">
            <!--    this is middle column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        </div>
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 20%; height: 100px; border: thin solid #ccc">
            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        </div>
        <div class="column" style="width: 9.5%; background-color: #F6F4EE"></div>
    </div>


</body>
</html>
