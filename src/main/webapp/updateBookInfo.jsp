<%-- 
    Document   : changeEmail
    Created on : Sep 17, 2019, 3:43:15 PM
    Author     : NUSRAT
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<title>BookWorm: Edit Book</title>
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
       <% boolean admin = false;
            String username=(String)session.getAttribute("username"); 
            if(username.equals("naimajonaki001@gmail.com")){
                admin = true;
       %>
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
<hr color="#DEDEDE" width="4"><br><br><br><br><br>
<!--    navigation bar ends   -->

 <%
        ArrayList <String> gname= new ArrayList();
 String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username1="IPM";
            String password="IPM_LAB";
           
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username1, password);
             con=DriverManager.getConnection(url,username1, password);
           String sql6="select genre_name from genre";
            
           PreparedStatement st6=con.prepareStatement(sql6);
           ResultSet rs6=st6.executeQuery();
           while(rs6.next()){
               gname.add(rs6.getString("genre_name"));
           }
           
            }catch(Exception e){
                
            }
        
        %>
  <% 
       int bid=Integer.parseInt(request.getParameter("upId"));
     ArrayList<Integer> id=new ArrayList();
      ArrayList<String> g_name=new ArrayList();
     
     
      String sql="select * from book where book_id=?";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            
           Connection con=DriverManager.getConnection(url, username1, password);
          PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,bid);
          ResultSet rs=st.executeQuery();
          String sql1=" select genre_id from book_genre where book_id=?";
          PreparedStatement st1=con.prepareStatement(sql1);           
        st1.setInt(1,bid);
        ResultSet rs1=st1.executeQuery();
        while (rs1.next()){
            id.add(rs1.getInt("genre_id"));
        }
         for (int i = 0; i < id.size(); i++) {
         String sql2=" select genre_name from genre where genre_id=?";
          PreparedStatement st2=con.prepareStatement(sql2);  
          int d=id.get(i);
        st2.setInt(1,d);
        ResultSet rs2=st2.executeQuery();
        while(rs2.next()){
            g_name.add(rs2.getString("genre_name"));
        }
     }
         
       int size=0;
    size=g_name.size();
        
        
        String[] g_arr=new String [size];
         for (int i = 0; i < g_name.size(); i++) {
             
             g_arr[i]=g_name.get(i);
         }
     
    %>
     
    
   
    
    

<br><br><br>
     <div  class="row" style="width: auto ">
        <div class="column" style="width: 25%; background-color: #F6F4EE"></div>
        <div class="column" style="width: 50%;  min-height: 400px; border: thin solid #ccc; padding-bottom: 80px; padding-top: 70px; padding-left: 30px; padding-right: 30px">
            <div class="row" style="width: auto"><font style="font-size: 18px">&emsp;&emsp;Edit A Book</font><hr></div>
            <div class="row" style="width: auto; padding-top: 40px; padding-left: 30px; padding-right: 30px" >
                
                <form action="UpdateBooksInfo" method="post">
            <% while (rs.next()){%>
                    <table cellspacing="30" style="padding-left: 20px">
                        <tr>
                            <td colspan="3">
                                <input type="hidden" name="book_id"  value="<%=rs.getInt("book_id")%>" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Book Name:
                            </td>
                            <td colspan="2">
                                <input type="text" style="width:300px; height:35px;" name="book_name" value="<%=rs.getString("book_name")%> " required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Release Date:
                            </td>
                            <td colspan="2">
                                <input type="date" style="width:300px; height:35px;" name="release_date" value="<%=rs.getDate("RELEASE_DATE")%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Author Name:
                            </td>
                            <td colspan="2">
                                <input type="text" style="width:300px; height:35px;" name="author_name" value="<%=rs.getString("author_name")%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Select Genre:
                            </td>
                            <td>
                                <% for (int i = 0; i <gname.size(); i++) {
                                    
                                    String g=gname.get(i);
                                  if(i == gname.size()/2){ 
                                    %> </td><td><br><%
                                }%>
                            <input type="checkbox" name="genre" value="<%=gname.get(i)%>" <% if (g_name.contains(g))out.print("checked"); %>  /><%=gname.get(i) %><br>
                                <% }%><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Description:
                            </td>
                            <td colspan="2">
                                <!--<textarea name="description" row="5" column="45" style="width:200px; height:150px;" required></textarea>-->
                                <textarea rows="6" cols="35" name="description" form="bookform" required><%=rs.getString("description")%></textarea>
                            </td>
                        </tr>
                    </table><% } %><br><br>
                    
            <p align="center"><input type="submit" value="update" style="background: none; border: thin solid #ccc; color: #3E1B0F; font-size: 14px; padding-top: 3px; padding-bottom: 3px">  </p>
            <br><br>
</form>
            </div>
</div>
       <div class="column" style="width: 25%; background-color: #F6F4EE"></div>
    </div>

    </body>
</html>
