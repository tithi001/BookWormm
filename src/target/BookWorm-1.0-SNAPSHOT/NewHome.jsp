
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html { 
  background: url(Backgrounds/bg1.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}   
    .example_e {
border: none;
background: #404040;
color: #ffffff !important;
font-weight: 100;
padding: 20px;
text-transform: uppercase;
border-radius: 6px;
display: inline-block;
transition: all 0.3s ease 0s;
height: 50px;
width: 170px;
}
.example_e:hover {
color: #404040 !important;
font-weight: 700 !important;
letter-spacing: 3px;
background: none;
-webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
-moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
transition: all 0.3s ease 0s;
}
.sideByside{
    width:170px;
  height:230px;
  padding-right: 10px;
  
}
.sideByside:hover{
    width:220px;
  height:260px;
  padding-right: 10px;
  filter: drop-shadow(0 0 0.75rem black);
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
    color: none;
    background-color: none;
    opacity: 1;
  filter: alpha(opacity=100);
}

.row:after{
    content: "";
    display: table;
    clear: both;
    opacity: 1;
  filter: alpha(opacity=100);
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
</head>
<body>
    
    <%
            response.setHeader("Cache-Control","no cache,no store,must-revalidate");
            if(session.getAttribute("username")==null){
                response.sendRedirect("Login.jsp");
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
    <hr color="#DEDEDE" width="4"><br><br><br><br><br><br>
<!--    navigation bar ends   -->


    <div class="row" style="width: auto; padding-bottom: 60px">
        <div class="column" style="width: 10%;"></div>
        <div class="column" style="width: 30%; min-height: 550px;padding-left: 10px  ">
            
            <% ResultSet rs = (ResultSet)session.getAttribute("rs");
 ResultSet rs2 = (ResultSet)session.getAttribute("rs2");
 ResultSet rs3 = (ResultSet)session.getAttribute("rs3");
 
 %><br> 
 <b style="font-size:20px" >Genre List</b><hr>
 <table cellspacing="10" style="padding-top: 30px; padding-left: 28px"><tr>
                <%int count1=0;
while(rs.next()){
        %>
        <%if(count1%2==0){%>
            </tr>
            <tr>
        <%}%>
                
                    
        <td>           
           
        <div class="button_cont" align="center"><a class="example_e" href="HomeGenre?genre=<%=rs.getInt("genre_id") %>" target="_blank" rel="nofollow noopener"><%=rs.getString("genre_name") %></a></div>
        </td>
          
 <%  count1++;             
}
    %>               
    </tr>    
       </table>
 

            
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        </div>
        <div class="column" style="width: 10%;"></div>
        <div class="column" style="width: 40%; min-height: 600px;padding-left:10px; padding-right:10px  ">
            
            
            <br> <b style="font-size:20px"> Most Recent Books</b> <hr>
            <table cellspacing="10" style="padding-left: 28px; padding-top: 30px">
            <tr>
    <% int count=0;
        while(rs2.next()){%>
        <%if(count%3==0){%>
            </tr>
            <tr>
        <%}%>

    <td>
        <a href="bookPage_1?bId=<%=rs2.getInt("book_id") %>"><img class="sideByside" style="width: 100%" src="image/<%=rs2.getString("book_id")%>.jpg"></a><br>
    </td>
    <% count++; }
  %>        </tr>
            
            
        </table></div>
        <div class="column" style="width: 10%;"></div>
    </div>
    <div class="row" style="width: auto">
        
        <div class="column" style="width: 30%;"></div>
        <div class="column" style="width: 40%; min-height: 600px; padding-left: 10px; padding-right: 10px"><br>

      <b style="font-size:20px"> Most Rated Books</b> <hr>
            <table cellspacing="10" style="padding-top: 30px">
                <tr>
    <% int count3=0;
        while(rs3.next()){%>
        <%if(count3%3==0){%>
            </tr>
            <tr>
        <%}%>

    <td>
        <a href="bookPage_1?bId=<%=rs3.getInt("book_id") %>"><img class="sideByside" src="image/<%=rs3.getString("book_id")%>.jpg"></a><br>
    </td>
    <% count3++; }
  %>        </tr>
            </table>
            
            </div>
        <div class="column" style="width: 30%;"></div>
    </div>
</body>
</html>
