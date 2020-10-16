<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>

<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
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
select#shelfflow{
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
    border: thin solid black
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
 <title>BookWorm: Search Result</title>
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



   <!-- <div class="row" style="width: auto">
        
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 50%; height: 5000px; border: thin solid #ccc">
            <div style="padding-bottom: 16px">

    
        </div>-->
   
                           
           
       

    <div class="row" style="width: auto">
        <div class="column" style="width: 19.5%; background-color: #F6F4EE"></div>
       
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
        
        <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 59%; min-height: 200px; border: thin solid #ccc; padding-top: 70px; padding-bottom: 60px; padding-left: 30px; padding-right: 30px">
            <!--    this is middle column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
               
      <%if(session.getAttribute("username")==null)
      {
          response.sendRedirect("Login.jsp");
}%>

<br>&nbsp;&nbsp;&emsp;&emsp;
<font size="5"  color="#564A3D">  Search Results</font><hr>
<table cellspacing="30" style="padding-left: 80px; padding-top: 20px">
     
        <%String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username2 = "IPM";
    String password = "IPM_LAB";
            String genre = "";
            
             Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username2, password);
           
            System.out.println("read is accessed!!!!!!!!!!!!");
          ResultSet rs1=(ResultSet)session.getAttribute("rs1");
         
      System.out.println("read is accessed22222!!!!!!!!!!!!");
            int prevId = 0;
            //int count = 0;
            while (rs1.next()) {
                 //currentId = Integer.parseInt(rs1.getString("book_id"));
                 String shelf = "";
                 int id = rs1.getInt("book_id");
                 if(id != prevId){
                 String email = (String)session.getAttribute("username");
                    System.out.println("id= " + id);
                    List genreid = new ArrayList();
                    PreparedStatement st5 = con.prepareStatement("select status from bookshelf where book_id = " + id +"and email = '"+ email+"'");
                    ResultSet rs5 = st5.executeQuery();
                    if (rs5.next()) {
                    shelf=rs5.getString("status");
                    }
                    PreparedStatement st2 = con.prepareStatement("select genre_id from book_genre where book_id = " + id);
                    ResultSet rs2 = st2.executeQuery();
                    while (rs2.next()) {
                        genreid.add(rs2.getString("genre_id"));
                    }
                    rs2 = st2.executeQuery("select genre_name from genre where genre_id = " + genreid.get(0));
                    rs2.next();
                    genre = rs2.getString("genre_name");
                    for (int i = 1; i < genreid.size(); i++) {
                       rs2 = st2.executeQuery("select genre_name from genre where genre_id = " + genreid.get(i));
                        rs2.next();
                        genre = genre + ", " + rs2.getString("genre_name");
                       
                    }
                    //if (currentId != count) {
                
                
    //ArrayList books=(ArrayList)session.getAttribute("books");
    //System.out.println("This is id= "+rs1.getString("book_name"));
    
    
    %>

    <tr>
            <td><a href="bookPage_1?bId=<%=rs1.getInt("book_id")%>"><img class="sideByside" src="image/<%=rs1.getString("book_id")%>.jpg" height="150" width="110"></a>
                
             
      </td>
      
      <td><br><br><br>
     
     <font size = "4" color="#564A3D"><%=rs1.getString("book_name")%></font>
          <br><font size = "3">by <%=rs1.getString("author_name")%>
            <br><%= genre%><br><br>
            <br><%--<%=shelf%>--%>
            </font>
            <%String bId=rs1.getString("book_id");
                System.out.println("bId="+bId);%>
           
     <br>
      <form action="bookShelf" method="get">
    <select id="shelfflow" name="shelfType"  onchange="shelfType()" style=" height: 35px; border: thin solid #ccc;">
        <option selected value="<%=shelf%>"> <%=shelf%> </option>
        <option value="Read">Read</option>
    <option value="Want-To-Read">Want-To-Read</option>
    <option value="Currently-Reading">Currently-Reading</option>
    </select>
           
           <input type="hidden" name="bId" value="<%=rs1.getInt("book_id")%>">
           <input type="hidden" name="bName" value="<%=rs1.getString("book_name")%>">
           <input type="hidden" name="Auth" value="<%=rs1.getString("author_name")%>">
           <input type="hidden" name="shelfType" value="shelfType">
            <input type="submit" class="button1" value="Update" style="background: none; color: #3E1B0F; font-size: 14px; font-style: oblique">
          
            </form>
           <br> 
            <hr><br><br><br>   
          </td>
           
        </tr>
       
       
        
      <%  
        // }else{
         //   count = currentId;}
      prevId = id;
}}%>

    </table>
               
        </div>
       
        
            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements -->
     
        <div class="column" style="width: 20.5%; background-color: #F6F4EE"></div>
    </div> 


</body>
</html>
