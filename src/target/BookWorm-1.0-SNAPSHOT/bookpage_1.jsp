<%-- 
    Document   : read
    Created on : Oct 10, 2019, 10:07:33 AM
    Author     : USER
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%--@page import="com.oracle.webservices.internal.api.databinding.DatabindingModeFeature.ID"--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
}
    .star{
          color: goldenrod;
          font-size: 1.0rem;
          padding: 0 1rem; /* space out the stars */
        }
    .star::before{
          content: '\2606';    /* star outline */
          cursor: pointer;
        }
    .star.rated::before{
          /* the style for a selected star */
          content: '\2605';  /* filled star */
        }
        
    .stars{
            counter-reset: rateme 0;   
            font-size: 1.0rem;
            font-weight: 900;
        }
    .star.rated{
            counter-increment: rateme 1;
        }
    .stars::after{
            content: counter(rateme) '/5';
        }
 </style>

<title>book</title>
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
       <!-- <select id="searchType" name="searchType"  onchange="searchType()" style="height: 35px; width:84px; border:none; background_color: white">
    <option selected value="default"> Search by </option>
    <option value="All">All</option>
    <option value="Title">Title</option>
    <option value="Author">Author</option>
    <option value="Genre">Genre</option>
    </select> -->
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
      <a href="AllBooks">All Books</a>
      <a href="Genre">Genre</a>
      <a href="MostLiked">Most Liked</a>
    </div>
  </div>
</div>
<br><br><br><br><br><br><br>
               
    
 
                      
                <br><br><br><br><br><br>
    


<div class="row" style="width: auto">
        <div class="column" style="width: 18.5%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 20%;  border: thin solid #ccc">
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
       <% 
        ArrayList arr = (ArrayList) session.getAttribute("ar");
        ResultSet rset= (ResultSet)session.getAttribute("rset");
       session.removeAttribute("rset");
       %>

 
<center> <img class="sideByside" src="<%=rset.getString("book_id")%>.jpg" height="190" width="130" >
    </center> 
    <br>
    <br>
     <div class="stars" data-rating="3">
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
    </div>
    <p>You Can Rate Here & Review Below.</p>
    
    
    <script>
        
        //initial setup
        document.addEventListener('DOMContentLoaded', function(){
            let stars = document.querySelectorAll('.star');
            stars.forEach(function(star){
                star.addEventListener('click', setRating); 
            });
            
            let rating = parseInt(document.querySelector('.stars').getAttribute('data-rating'));
            let target = stars[rating - 1];
            target.dispatchEvent(new MouseEvent('click'));
        });
        function setRating(ev){
            let span = ev.currentTarget;
            let stars = document.querySelectorAll('.star');
            let match = false;
            let num = 0;
            stars.forEach(function(star, index){
                if(match){
                    star.classList.remove('rated');
                }else{
                    star.classList.add('rated');
                }
                //are we currently looking at the span that was clicked
                if(star === span){
                    match = true;
                    num = index + 1;
                }
            });
            document.querySelector('.stars').setAttribute('data-rating', num);
        }
              
    </script>
    
    
    <br>
    <br>
    
    <form action="Rate" id="usrform" method="get">
       
   <input type="submit" value="comment">
   </form>

     <br>

<textarea rows="4" cols="35" name="comment" form="usrform">
Enter text here...</textarea>
<input type="hidden" name="comment" value="comment">
<%--<input type="submit" value="comment"> --%>


        </div>
        <div class="column" style="width: 0.5%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 46%; border: thin solid #ccc">
            <!--    this is middle column   -->
           
            <!--    erase "height:100px" to set the height according to its elements   -->
                   <%
//ArrayList arr = (ArrayList) session.getAttribute("ar");
//ResultSet rset= (ResultSet)session.getAttribute("rset");
        //session.setAttribute("rset",rset);

// myString="";
if(arr.isEmpty()==false)
{
for(int i = 0; i < arr.size(); i++)
{
System.out.println(arr.get(i));

};
//System.out.println(myString);
}
else
{
System.out.println("Array is empty");
}



%>

           
       
        
     

                <%--
   
out.println("<table>");
//out.println("<tr>");

--%>
<br>
<br>
 <table align="center" cellspacing="30"  >
    <tr>
        <%--   <td><img class="sideByside" src="<%=rset.getString("book_id")%>.jpg" height="190" width="130" >
    <br>
     <div class="stars" data-rating="3">
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
    </div>
    <p>You Can Rate Here & Review Below.</p>
    
    
    <script>
        
        //initial setup
        document.addEventListener('DOMContentLoaded', function(){
            let stars = document.querySelectorAll('.star');
            stars.forEach(function(star){
                star.addEventListener('click', setRating); 
            });
            
            let rating = parseInt(document.querySelector('.stars').getAttribute('data-rating'));
            let target = stars[rating - 1];
            target.dispatchEvent(new MouseEvent('click'));
        });
        function setRating(ev){
            let span = ev.currentTarget;
            let stars = document.querySelectorAll('.star');
            let match = false;
            let num = 0;
            stars.forEach(function(star, index){
                if(match){
                    star.classList.remove('rated');
                }else{
                    star.classList.add('rated');
                }
                //are we currently looking at the span that was clicked
                if(star === span){
                    match = true;
                    num = index + 1;
                }
            });
            document.querySelector('.stars').setAttribute('data-rating', num);
        }
              
    </script>
    
    
    <br>
    <br>
    
    <form action="Rate" id="usrform" method="get">
  ID: <input type="text" name="usrid">
<br>

<textarea rows="4" cols="40" name="comment" form="usrform">
Enter text here...</textarea>
<input type="hidden" name="comment" value="comment">
<input type="submit" value="comment">

   </form>
</td>
        --%>
<%--
<% 
Integer uid= (Integer) request.getAttribute("usrid");
String rev= (String) request.getAttribute("comment");

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "IPM";
    String password = "IPM_LAB";
           // String genre = "";
             Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
        Statement   statement=con.createStatement();
String sql ="update rate set review="+rev+ "where user_id="+uid+ "and book_id="+ rset.getInt("book_id");
 ResultSet resultSet = statement.executeQuery(sql);


%>
--%>
    

<%
        

for (Iterator iter = arr.iterator(); iter.hasNext();) {
    out.println("<tr><td>" + (iter.next()) + "</td></tr>");
        
}%>
 </tr>

</table>
 
   


        
        
        </div>
      <%--  <div class="column" style="width: 1%; background-color: #F6F4EE"></div> --%>
      <%--  <div class="column" style="width: 20%; height: 100px; border: thin solid #ccc"> --%>
            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
       
        <div class="column" style="width: 15%; background-color: #F6F4EE"></div>
    

 </div>
    </body>
</html>
