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
        <%! String urlButton;%>
        <% 
            if(buttonState.equals("Home"))
            {
                urlButton = "index.jsp";
            }
            else
                urlButton = "login.jsp";
        %>
        <table class="headertable">
            <tbody>
                <tr>
                    <td>
                    <button id="button_login" onclick="location.href = '<%=urlButton%>';">
                        <%=buttonState%></button>
                    </td>
        <%
            if(session.getAttribute("loggedIn") != null && session.getAttribute("loggedIn").equals(true))
            {  
                out.println("<td>");
                out.println("<button id='view_profile' onclick=location.href='viewprofile.jsp';>"
                +"View Profile</button></td>"); 
                out.println("<td><form method=post action=logout>");
                out.println("<input type=submit value=Logout id='logout_butt'/></form></td>");
            }            
        %>
                </tr>
            </tbody>
        </table>
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
