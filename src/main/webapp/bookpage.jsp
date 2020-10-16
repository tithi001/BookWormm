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


.button1 {
  background-color: #FAF0E6  ;
  border: none;
  color: #115567;
  padding: 10px 15px;
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
  }}
 </style>
<style>
  .star{
          color: goldenrod;
          font-size: 2.0rem;
          padding: 0rem; /* space out the stars */
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
            font-size: 2.0rem;
            font-weight: 900;
        }
        
        .star.rated{
            counter-increment: rateme 1;
        }
</style>
        <title>BookWorm: Book Page</title>
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
               
    
<div class="row" style="width: auto">
        <div class="column" style="width: 17%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 30%;  border: thin solid #ccc; height: 700px">
            <!--    this is left column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
       <% 
        ArrayList arr = (ArrayList) session.getAttribute("ar");
        ArrayList AllComments = (ArrayList) session.getAttribute("AllComments");
        ResultSet rset= (ResultSet)session.getAttribute("rset");%>
 <br>
 <br><br><br>
<center> <img class="sideByside" src="image/<%=rset.getString("book_id")%>.jpg" height="190" width="130" >
    </center> 
    <%System.out.println("--------------------here jsp0 ");%>
    <%
    int prev_rate = 0;
    Object obj = session.getAttribute("prev_rate");
    if(obj !=null){prev_rate = Integer.parseInt((String)obj);}
    System.out.println("--------------------here jsp 1"+prev_rate);
    String prev_review = (String)session.getAttribute("prev_review");
    if(prev_rate==0){ prev_rate = 1;}
    String prev_status = (String)session.getAttribute("prev_status");%>
    
    <%if(prev_review ==null || prev_review.equals("") ){prev_review = "Enter your review";}
    System.out.println("--------------------here jsp "+prev_review+prev_rate);
    %>
    <div class="stars" data-rating="<%=prev_rate%>">
        <p align="center"><span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span>
        <span class="star">&nbsp;</span></p>
     </div>
    <form action="bookShelf" method="get">
    <p align="center">
    <select id="shelfflow" name="shelfType"  onchange="shelfType()" style=" color: white; height: 35px; background-color: #19C160">
        <option selected value="<%=prev_status%>"> <%=prev_status%> </option>
        <option value="Read">Read</option>
    <option value="Want-To-Read">Want-To-Read</option>
    <option value="Currently-Reading">Currently-Reading</option>
    </select>
           
           <input type="hidden" name="bId" value="<%=rset.getInt("book_id")%>">
           <input type="hidden" name="bName" value="<%=rset.getString("book_name")%>">
           <input type="hidden" name="Auth" value="<%=rset.getString("author_name")%>">
           <input type="hidden" name="shelfType" value="shelfType"> &nbsp;&nbsp;&nbsp;
            <input type="submit" class="button1" value="Update" style="background: none ; color: #3E1B0F; font-style: oblique; font-size:13px; height: 25px; padding-top: 3px">
          </p>
            </form>
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
            //window.alert(num);
            document.getElementById("rateSave").setAttribute("value", num)
            document.querySelector('.stars').setAttribute('data-rating', num);
        }
              
    </script>
    
    
    <br>
  
    <center>
    <textarea rows="6" cols="34" name="comment" form="usrform"><%=prev_review%></textarea></center>
   
    <input type="hidden" name="comment" value="comment">
    <form action="Rate" id="usrform" method="get">
        <input type="hidden" id="rateSave" name="rateSave">
        <input type="hidden" id="bid" name="bId" value="<%=session.getAttribute("id")%>">
        &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<input type="submit" class="button1" value="Save Rate and Review" style="border: thin solid #ccc; color: #3E1B0F; font-size: 13px; height: 25px; padding-top: 3px">
    </form>
    <br><br>
     


<%--<input type="submit" value="comment"> --%>


        </div>
        <div class="column" style="width: 0.5%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 36%; border: thin solid #ccc; height: 700px; padding-left: 30px; padding-right: 30px">
            <!--    this is middle column   -->
           
            <!--    erase "height:100px" to set the height according to its elements   -->


           
       
        
     

               
<br>
 <table align="left" cellspacing="20"  >
     <tr>
        
<td>
<%
        

for (Iterator iter = arr.iterator(); iter.hasNext();) {
    out.println( (iter.next()) );
        
}%></td>
 </tr>

</table>
 
   


        
        
        </div>
      <%--  <div class="column" style="width: 1%; background-color: #F6F4EE"></div> --%>
      <%--  <div class="column" style="width: 20%; height: 100px; border: thin solid #ccc"> --%>
            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
       
        <div class="column" style="width: 16.5%; background-color: #F6F4EE"></div>
    

 </div>
            <div class="row" style="width: auto; height: 40px"></div>
            <div class="row" style="width: auto">
               <div class="column" style="width: 17%; background-color: #F6F4EE"></div>
                <div class="column" style="width: 66.5%; border: thin solid #ccc; min-height: 200px; padding-left: 40px; padding-right: 40px; padding-bottom: 80px">
                    <br><br><br>&emsp;&emsp;
                    <b><font size = "4" color="#564A3D">Community Reviews</font></b><hr>
                    <%
                        for (Iterator iter = AllComments.iterator(); iter.hasNext();) {
                            String temporary = (String)iter.next();
                            String email_temp = temporary.substring(0, temporary.indexOf(';'));
                            String rest = temporary.substring(temporary.indexOf(';')+1);
                            int rate_temp = Integer.parseInt(rest.substring(0, rest.indexOf(';')));
                            String review_temp = "";
                            if(rest.length() > 1){review_temp = rest.substring(rest.indexOf(';')+1);}
                            if(rate_temp!=0 || (review_temp!=null && !review_temp.equals(""))){
                        %>
                        <br><br><br>
                        <div class="row" style="width: auto">
                            <div class="column" style="width: 30%">&nbsp;&emsp;&emsp;&emsp;&emsp;
                                <img src="image/reading-icon-png-23.jpg" height="110" width="120" style="padding-left: 10px">
                            </div>
                            <div class="column" style="width: 70%">
                                <br>   &nbsp;&emsp;
                               <font size = "4"  color="#564A3D"><%=email_temp%></font><br>
                               &nbsp;&emsp;
                                <%for(int i =0; i< rate_temp; i++){%>
                                
                                <img src="image/star.jpg" height="20" width="16">
                                    
                                <%}%>
                                
                                <font size = "3" color="#564A3D"><%=rate_temp%></font><br><br>
                                &nbsp;&emsp;&nbsp;
                                <font size = "3" color="#564A3D"><%=review_temp%></font><br><br>
                            </div>
                        </div>                       
                    <%}}%>
                    
                </div>
                <div class="column" style="width: 16.5%; background-color: #F6F4EE"></div>
            </div>
    </body>
</html>
