
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*" %> 
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.sideByside{
    width:170px;
  height:220px;
  padding-right: 10px;
}
.sideByside:hover{
    width:200px;
  height:260px;
  padding-right: 10px;
  filter: drop-shadow(0 0 0.75rem gray);
}
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

select#shelfflow:hover {
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
}
</style>

 <title>Search Result</title>
</head>

<body bgcolor="#F6F4EE" style="width: auto">
    <br>
    
    
        
    
<script type="text/javascript">
function searchType(){
var searchType = document.getElementById("searchType");
var selectedItem = searchType.options[searchType.selectedIndex].value;

}
</script>

<script type="text/javascript">
function shelfType(){
var shelfType = document.getElementById("shelfType");
var shelfItem = shelfType.options[shelfType.selectedIndex].value;


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
    <hr color="#DEDEDE" width="4"><br><br><br><br><br><br>
<!--    navigation bar ends   -->



   <!-- <div class="row" style="width: auto">
        
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 50%; height: 5000px; border: thin solid #ccc">
            <div style="padding-bottom: 16px">

    
        </div>-->
   
                           
           
       

    <div class="row" style="width: auto">
        <div class="column" style="width: 24.5%; background-color: #F6F4EE"></div>
       
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 49%; min-height: 100px; border: thin solid #ccc; padding-bottom: 80px ; padding-left: 30px; padding-right: 30px">
            <!--    this is middle column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->

        <% session.getAttribute("username");
        if(session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
        }%>
        <br><br><br><br>  &emsp;&emsp;
        <font style="font-size: 19px" color="#564A3D">Profile</font>
        <font size="3" color="#115567"><a href="EditProfile.jsp">(Edit Profile)</a></font><hr style="padding-left: 20px; padding-right: 20px"><br><br>
        <%  try{
                String url="jdbc:oracle:thin:@localhost:1521:orcl";
                String username="IPM";
                String password="IPM_LAB";
              Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con=DriverManager.getConnection(url, username, password);
              Statement stmt=con.createStatement();
              String uname=(String)session.getAttribute("username");
              String sj="select * from profile where email='"+uname+"'";
              ResultSet rs=stmt.executeQuery(sj);
              if(rs.next()){
                  %>
                  <div class="row" style="width: auto">
                      <div class="column" style="width: 29%; padding-left: 30px; padding-top: 30px">
                          <img src="<%=rs.getInt("user_id")%>.jpg" height="150" width="140"><br>
                          <!--<form action="EditProfile" method="GET" enctype="multipart/form-data">
                            <input type="file" name="pic">
                            <input type="submit" value="Save Image" style="border: thin solid #ccc; color: #3E1B0F; font-size: 14px">
                          </form>-->
                      </div>
                      <div class="column" style="width: 71%; padding-right: 10px; padding-left: 20px">
                          <div class="row" style="width: auto; padding-bottom: 30px">
                              <font size = "4" color="#564A3D" ><%=rs.getString(2)%>  </font>
                              <hr> 
                          </div>
                              <div class="row" style="width: auto; padding-bottom: 10px;">
                                  <div class="column" style="width: 50%">
                                      <font size="3" color="#564A3D" > User ID </font>
                                  </div>
                                  <div class="column" style="width: 50%"><%=rs.getString(1)%></div>
                              </div>
                              <div class="row" style="width: auto; padding-bottom: 10px">
                                  <div class="column" style="width: 50%">
                                      <font size="3" color="#564A3D" > Age </font>
                                  </div>
                                  <div class="column" style="width: 50%"><%=rs.getString(6)%></div>
                              </div>
                              <div class="row" style="width: auto; padding-bottom: 10px">
                                  <div class="column" style="width: 50%">
                                      <font size="3" color="#564A3D" > Address </font>
                                  </div>
                                  <div class="column" style="width: 50%"><%=rs.getString(3)%></div>
                              </div>
                              <div class="row" style="width: auto; padding-bottom: 10px">
                                  <div class="column" style="width: 50%">
                                      <font size="3" color="#564A3D" > Phone Number </font>
                                  </div>
                                  <div class="column" style="width: 50%"><%=rs.getString(4)%></div>
                              </div>
                              <div class="row" style="width: auto; padding-bottom: 10px">
                                  <div class="column" style="width: 50%">
                                      <font size="3" color="#564A3D" > Email </font>
                                  </div>
                                  <div class="column" style="width: 50%"><%=rs.getString(5)%></div>
                              </div>
                      </div>                      
                  </div>      

                  <%
                  }
                    
                    
                }catch(Exception e){}
                %>
                
                
              <br><br><br><br><br>&nbsp;&nbsp;&emsp;
              <font style="font-size: 19px" color="#564A3D">My Bookshelves</font><hr ><br><br>
                    <%String r = null;%>
               
                <form id="my_form" action="bookShelf" method="post">
                 &nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
               <a href="javascript:{}"  onclick="document.getElementById('my_form').submit(); return false;">
                   <font size="3" color="#115567">All</font></a>
               
                
        
                &nbsp;&nbsp;&emsp;<a href="Shelf?r=Read">
                    <font size="3" color="#115567">Read</font></a>
                &nbsp&nbsp;&nbsp;&emsp;<a href="Shelf?r=Currently-Reading">
                    <font size="3"  color="#115567">Currently Reading</font></a>
                &nbsp&nbsp;&nbsp;&emsp;<a href="Shelf?r=Want-To-Read">
                    <font size="3"  color="#115567">Want to Read</font></a><br> </form>
                </div>
       
        
            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements -->
     
        <div class="column" style="width: 15.5%; background-color: #F6F4EE"></div>
    </div> 


</body>
</html>
