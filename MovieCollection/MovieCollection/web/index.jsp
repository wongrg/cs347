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
            <img src="images/MovieBox.jpg" id="mcPic">
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
                        <a href=<%=urlButton%>>
                    <button id="button_login" class="headerButtons">
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
                </tr>
                <%
                  if(loggedIn)
                  {
                      out.println("<tr><form class='search-wrapper cf' method='post' action='searchuser'>");
                      out.println("<input  type='text' name='searchUserText' placeholder='Search For a User' required=''>");
                      out.println("<input type='submit' value='Search'></form></tr>");
                      
                  }
            
                %>
            </tbody>
        </table>
    </div>
        <hr/>
        <div class="searcharea">
        
        <h1>Welcome To Movie Box</h1>
       
        <form method="post" action="search" class="search-wrapper cf">
            <input type="text" name = "search_term" placeholder="Search Movie Box" required="">
            <button type="submit">Search</button>
        </form>
        </div>
       </body>
</html>