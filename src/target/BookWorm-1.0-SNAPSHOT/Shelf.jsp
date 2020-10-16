
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*" %> 
<%@page import="java.util.Date" %>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>

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
            table {
                border-collapse: collapse;
                width: 100%;
              }

              th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 2px solid #ddd;
              }
        </style>
    </head>
    <body bgcolor="#F6F4EE" style="width: auto">

        <script type="text/javascript">
            function searchType() {
                var searchType = document.getElementById("searchType");
                var selectedItem = searchType.options[searchType.selectedIndex].value;

            }
        </script>
        <script type="text/javascript">
            function shelfType() {
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
        <!--    navigation bar ends   
        
        
            <div class="row" style="width: auto">
                
                <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
                <div class="column" style="width: 50%; height: 5000px; border: thin solid #ccc">
                    <div style="padding-bottom: 16px">
        
            
                </div>-->


        <div class="row" style="width: auto">
            <div class="column" style="width: 9.5%; background-color: #F6F4EE"></div>
            <div class="column" style="width: 15%; min-height: 400px; border: thin solid #ccc; padding-left: 30px ; padding-right: 30px; padding-bottom: 60px; padding-top: 30px">
                <!--    this is left column   -->
                <!--    erase "height:100px" to set the height according to its elements   -->

                <%if (session.getAttribute("username") == null) {
                        response.sendRedirect("Login.jsp");
                    }%>
                <br><br>&emsp;<b><font size="4" color="#564A3D">Bookshelves</font></b><hr><br><br>
                    <%String r;%>
                <form id="my_form" action="bookShelf" method="post">
                &emsp;&emsp;
               <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">
                   <font color="#564A3D">All</font></a>
              </form><br>
               <!--  <form action="bookShelf" method="post">
                &nbsp;&nbsp;&emsp;&emsp; 
                <input type="submit" value="All">
                </form>-->
                &nbsp;&emsp;&emsp;<a href="Shelf?r=Read"><font size="3"  color="#564A3D">Read</font></a><br><br>
                &nbsp;&emsp;&emsp;<a href="Shelf?r=Currently-Reading"><font size="3"  color="#564A3D">Reading</font></a><br><br>
                &nbsp;&emsp;&emsp;<a href="Shelf?r=Want-To-Read"><font size="3"  color="#564A3D">Want to Read</font></a><br>

            </div>
            <div class="column" style="width: 1%; background-color: #F6F4EE"></div>
            <div class="column" style="width: 65%; height: 1500px; border: thin solid #ccc">
                <!--    this is middle column   -->
                <!--    erase "height:100px" to set the height according to its elements   -->


                <br>    <br>&nbsp;&nbsp;&emsp;&emsp;
                <%   String shelf = (String) session.getAttribute("shelf");%>
                <b><font size="4" family="Helvetica" color="#564A3D">  My Books:<%=shelf%></b><hr>
                <table cellspacing="50">
                    <tr class="bordered">
                        <td><font size = "3"><b>Cover</b></td>
                        <td><font size = "3"><b>Title</b></td>
                        <td><font size = "3"><b>Author</b></td>
                        <td><font size = "3"><b>Shelves</b></td>

                    </tr>

                    <%   ResultSet rs2 = (ResultSet) session.getAttribute("rs2");
                        while (rs2.next()) {
                            System.out.println("this is id for shelffff=" + rs2.getString("book_id"));
                    %>

                    <tr style="border-bottom: 1px solid #564A3D;">
                        <td>
                            <a href="bookPage_1?bId=<%=rs2.getInt("book_id")%>"><img class="sideByside" src="<%=rs2.getString("book_id")%>.jpg" height="140" width="130"></a><br>
                                <%String bId = rs2.getString("book_id");
                  System.out.println("bId=" + bId);%>


                            <form action="bookShelf" method="get">
                                <select id="shelfflow" name="shelfType"  onchange="shelfType()" style=" color: white; height: 35px; background-color: #19C160">
                                    <option selected value="<%=shelf%>"> <%=shelf%> </option>
                                    <option value="Read">Read</option>
                                    <option value="Want-To-Read">Want-To-Read</option>
                                    <option value="Currently-Reading">Currently-Reading</option>
                                </select>

                                <input type="hidden" name="bId" value="<%=rs2.getInt("book_id")%>">
                                <input type="hidden" name="bName" value="<%=rs2.getString("book_name")%>">
                                <input type="hidden" name="Auth" value="<%=rs2.getString("author_name")%>">
                                <input type="hidden" name="shelfType" value="shelfType">
                                <br> <input type="submit" value="update">

                            </form>

                        </td>


                        <td><font size = "3"><%=rs2.getString("book_name")%> </td>
                        <td><font size = "3"><%=rs2.getString("author_name")%>   </td>


                        <td><font size = "3"><%=rs2.getString("status")%>  
                        </td>


                    </tr>

                    <%}%>
                </table>


            </div>

            <!--    this is right column   -->
            <!--    erase "height:100px" to set the height according to its elements   -->

            <div class="column" style="width: 9.5%; background-color: #F6F4EE"></div>
        </div>
</body>

</html>
