<%-- 
    Document   : index
    Created on : Nov 25, 2015, 8:43:52 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/homepagestyle.css">
        <script src="scripts/processText.js"></script>
        <title>Movie Box Home</title>
    </head>
    <body>
        <%! String buttonState;%>
        <% if(session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals(false)){
            buttonState = "Login";
        }
            else
               buttonState="Home";
        %>
    <div class="header">                         
       <a href="index.jsp">
            <img src="images/tempMovieCollection.jpg" id="mcPic">
        </a>
        <button id="button_login" onclick="location.href = 'login.jsp';"><%=buttonState%></button>
        
    </div>
        <hr/>
        <div class="searcharea">
        
        <h1>Welcome To Movie Box</h1>
        <form method="post" action="search" >
            <p><input type="text" value="search for a movie" id="searchBox" onfocus="changeText(this)" >
                <input type="submit" value="Search">
            </p>
        </form>
        </div>
    </body>
</html>
