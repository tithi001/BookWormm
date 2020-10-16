<%-- 
    Document   : EditProfile
    Created on : Sep 22, 2019, 7:04:13 PM
    Author     : DAFFODIL
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*" %> 
<%@page import="java.util.Date" %>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>

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
<title>BookWorm: Edit Profile</title>
</head>
<body bgcolor="#F6F4EE" style="width: auto">
    
<script type="text/javascript">
function searchType(){
var searchType = document.getElementById("searchType");
var selectedItem = searchType.options[searchType.selectedIndex].value;

}
</script>

        <script type="text/javascript">
            function validate_form() {
                if (document.myform.username.value === "") {
                    alert("Please fill in the 'User Name' box.");
                    return false;
                }
                if (document.myform.address.value === "") {
                    alert("Please fill in the 'Address' box.");
                    return false;
                }
                if (document.myform.phonenumber.value === "") {
                    alert("Please fill in the 'Phone Number' box.");
                    return false;
                }
                if (document.myform.age.value === "") {
                    alert("Please fill in the 'Age' box.");
                    return false;
                }
            }
     
            function allLetters(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if ((charCode < 65 || charCode > 122 || (charCode < 97 && charCode > 90)) && charCode !== 32 && charCode !== 39 && charCode !== 95) {
                    alert("Enter Letter");
                    return false;
                }
                return true;
            }
            function isNumberKey(evt) {
                var charCode2 = (evt.which) ? evt.which : event.keyCode;
                if (charCode2 != 46 && charCode2 > 31 &&
                    (charCode2 < 48 || charCode2 > 57)) {
                    alert("Enter Number");
                    return false;
                }
                return true;
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


    <div class="row" style="width: auto">
        <div class="column" style="width: 25%; background-color: #F6F4EE"></div>
      
        <div class="column" style="width: 50%; min-height: 100px; border: thin solid #ccc; padding-bottom: 80px ; padding-left: 30px; padding-right: 30px">
            <!--    this is middle column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->
            
        <br><br><br><br>
        &emsp;&emsp;
        <font size="4" color="#564A3D">Edit Profile</font>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        &emsp;&emsp; &emsp;&emsp; &emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
         <a href="UserProfile.jsp">
             <font size="2" color="#115567">View My Profile</font></a><hr><br><br>
             <% session.getAttribute("username");
                if(session.getAttribute("username")==null){
                response.sendRedirect("Login.jsp");
                }%>
        <form name="myform" action="EditProfile" method="POST" onsubmit="return validate_form();">
            <table align="center" cellspacing="30">
               <%
                
                try{
                    String url="jdbc:oracle:thin:@localhost:1521:orcl";
                    String username2="IPM";
                    String password="IPM_LAB";
                  Class.forName("oracle.jdbc.driver.OracleDriver");
                  Connection con=DriverManager.getConnection(url, username2, password);
                  Statement stmt=con.createStatement();
                  String uname=(String)session.getAttribute("username");
                  String sj="select * from profile where email='"+uname+"'";
                  ResultSet rs=stmt.executeQuery(sj);
                  boolean has_profile =rs.next();
                  //if(rs.next()){
                      %>
                <tbody>
                    <tr>
                        <td> <font size="3" color="#564A3D">Username<br><br>
                       <input type="text" name="username" value="<%if(has_profile){%><%=rs.getString(2)%><%}%>" style="width:420px; height:35px;"/></td>
                    </tr>
                    <tr>
                        <td> <font size="3" color="#564A3D">Address<br><br>
                        <input type="text" name="address" value="<%if(has_profile){%><%=rs.getString(3)%><%}%>" style="width:420px; height:35px;"/></td>
                       
                    </tr>
                    <tr>
                        <td><font size="3" color="#564A3D">Phone Number<br><br>
                        <input type="text" name="phonenumber" value="<%if(has_profile){%><%=rs.getString(4)%><%}%>" style="width:420px; height:35px;" onkeypress="return isNumberKey(event)" /></td>
                    </tr>
                    <tr>
                        <td><font size="3" color="#564A3D">Age<br><br>
                        <input type="text" name="age" value="<%if(has_profile){%><%=rs.getString(6)%><%}%>" style="width:420px; height:35px;" onkeypress="return isNumberKey(event)" /></td>
                    </tr>
                </tbody>
                <%
                  //}
                    
                    
                }catch(Exception e){}
                %>
            </table>
            <br><br><br>
           &emsp; &emsp;&emsp; &emsp;&emsp;&emsp; &emsp;&emsp; &emsp;
           <input type="submit" class="button1" value="Save Profile Settings" name="submit" style="background: none; border: thin solid #ccc; color: #3E1B0F; font-size: 14px; padding-top: 3px; padding-bottom: 3px"/>
            &emsp;&emsp;&emsp;&emsp; &emsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" class="button1" value="Clear" name="clear" style="background: none; border: thin solid #ccc; color: #3E1B0F; font-size: 14px; padding-top: 3px; padding-bottom: 3px" />
        </form>
        
        </div>
        
        <div class="column" style="width: 25%; background-color: #F6F4EE"></div>
    </div>


</body>
</html>
