<%-- 
    Document   : changePass
    Created on : Sep 17, 2019, 12:56:14 PM
    Author     : NUSRAT
--%>
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

            select#soflow{
                -webkit-appearance: button;

                -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
                -webkit-padding-end: 20px;
                -webkit-padding-start: 2px;
                -webkit-user-select: none;
                border: none;
                color: #555;
                font-size: inherit;
                margin: 0px;
                overflow: hidden;
                text-align : center;
                text-overflow: ellipsis;
                white-space: nowrap;
                float : left;

            }

            select#shelfflow:hover {
                border: thin solid #3E1B0F; 
                box-shadow: 0 5px 5px -5px #3E1B0F;
                border: thin solid black
            }
            .button1 {
               background-color: #FAF0E6  ;
               border: none;
               color: #115567;
               padding: 10px 22px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 12px;
               margin: 4px 2px;
               cursor: pointer;
            }

            .topnav .search-container {
                float: left;
                margin-top : 7px;
                -webkit-border-radius: 2px;
                -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
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
                height : 35px;
                font-size: 17px;
                border: none;
            }

            .topnav .search-container button {
                padding: 6px 10px;
                background: white;
                font-size: 17px;
                border: none;
                cursor: pointer;
                width : 36px;
                height : 35px;
            }

            .topnav .search-container button:hover {
                border: thin solid #3E1B0F; 
                box-shadow: 0 5px 5px -5px #3E1B0F;
            }

            select#soflow:hover {
                border: thin solid #3E1B0F; 
                box-shadow: 0 5px 5px -5px #3E1B0F;
            }

            .foc {

            }

            .foc:focus {
                border: thin solid #3E1B0F; 
                box-shadow: 0 5px 5px -5px #3E1B0F;
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
                tr.bordered {
                    border-bottom: 1px solid #000;
                }
            }

</style>
<title>Account Settings</title>
</head>
   <body bgcolor="#F6F4EE" style="width: auto">
    
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
    <div class="search-container">
        <form name ="searchForm" method="post" action="Search">
            <select id="soflow" name="searchType"  onchange="searchType()" style="height: 35px; background_color: white">
                <option selected value="All">All</option>
                <option value="Title">Title</option>
                <option value="Author">Author</option>
                <option value="Genre">Genre</option>
            </select>
            <input type="text" placeholder="Search" name="title" class="form-control" style="width: 259px"><button type="submit"><i class="fa fa-search"></i></button>
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
                <a href="changePass.jsp">Account Settings</a>
                <form name="submitForm" method="POST" action="bookShelf">
                    <a href="javascript:document.submitForm.submit()">My Bookshelf</a>
                </form>
                <a href="ShowHistory">History</a>
                <a href="Logout">LogOut</a>
            </div>
        </div>
        <a href="UserProfile.jsp">Profile</a>
        <a href="NewHome">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Browse 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="AllBooks">All Books</a>
                <a href="Genre">Genre</a>
                <a href="MostRecent">Most Recent</a>
                <a href="MostLiked">Most Liked</a>
            </div>
        </div>
    </div>
    <hr color="#DEDEDE" width="4"><br><br><br><br><br><br><br><br>
<!--    navigation bar ends   -->

<br><br><br><br><br><br>

          <div  class="row" style="width: auto ">
        <div class="column" style="width: 30%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 40%; min-height: 250px; border: thin solid #ccc; padding-bottom: 80px; padding-top: 50px; padding-left: 30px; padding-right: 30px ">
          
        <font style="font-size: 18px">Account Settings</font><br>
      <hr>
         <p align="center"><br><br>
             <br>
        <a href="changePassword.jsp">Change Password</a><br><br>
        
        <%
        String email=(String)session.getAttribute("username");
        %>
        <br><br>
        Email Address:&nbsp;&nbsp;<input type='text' value="<%=email%>">  &nbsp;      
        <a href="editMail.jsp"><img src="image/tick.png" style="width: 20px; height: 20px"/></a>
         </p>

       </div>
       
    </div>
    </body>
</html>
