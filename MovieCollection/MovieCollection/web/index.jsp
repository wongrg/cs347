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
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
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
                        <a href=<%=urlButton%>>
                    <button class="headerButtons">
                        <%=buttonState%></button></a>
                    </td>
        <%
            boolean loggedIn=false;
            if(session.getAttribute("loggedIn") != null && session.getAttribute("loggedIn").equals(true))
            {  
                loggedIn=true;
                out.println("<td>");
                out.println("<button id='view_profile' class=\"headerButtons\""
                        + " onclick=location.href='viewprofile.jsp';>View Profile"
                        + "</button></td>"); 
                out.println("<td><form method=post action=logout>");
                out.println("<input type=submit class=\"headerButtons\""
                        + " value=Logout id='logout_butt'/></form></td>");
            }
        %>
        <td>
            <h1 id='welcomeMessage'> Welcome to MovieBox!</h1>
        </td>
        <%
            if(loggedIn) {
                out.println("<div class='searchBar'><form method='post' action='searchuser'>");
                out.println("<td><input  id='userSearchField' type='text' name='user_text' placeholder='Search For a User' required=''></td>");
                out.println("<td><input id='userSearchSubmit' class='submitButtons' type='submit' value='Search'></td></form></div>");
                      
            }
            
        %>
                </tr>
                
            </tbody>
        </table>
    </div>
        <hr/>
        <div class="searcharea">
        <form method="post" action="search" class="search-wrapper cf">
            <input class='movieSearch' type="text" name = "search_term" placeholder="Search Movie Box" required="">
            <button id='movieSearch' class='submitButtons' type="submit">Search</button>
        </form>
        </div>
       </body>
</html>