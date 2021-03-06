<%-- 
    Document   : search
    Created on : Nov 26, 2015, 9:41:56 AM
    Author     : joey
--%>

<%@page import="Model.SearchResults"%>
<%@page import="Model.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%! String buttonState;%>
        <% if(session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals(false)){
            buttonState = "Login";
        }
            else
               buttonState="Home";
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
        <script type="text/javascript" src="scripts/processText.js"></script>
        <title>Search Page</title>
    </head>
    <body>
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
                    <button id="button_login" class="headerButtons">
                        <%=buttonState%></button></a>
                    </td>
        <%
            if(session.getAttribute("loggedIn") != null && session.getAttribute("loggedIn").equals(true))
            {  
                out.println("<td>");
                out.println("<button id='view_profile' class=\"headerButtons\" onclick=location.href='viewprofile.jsp';>"
                +"View Profile</button></td>"); 
                out.println("<td><form method=post action=logout>");
                out.println("<input type=submit class=\"headerButtons\" value=Logout id='logout_butt'/></form></td>");
            }            
        %>
                </tr>
            </tbody>
        </table>
    </div>
        
        <hr>
        <h2>Search for a Movie Title</h2>
        <div class="searchformdiv">
            <form method="post" action="search" id="searchform">
                <input class='movieSearch' type="text" name="search_term" id="searchbox" placeholder="Search Movie Title" required=''>
                <input type="submit" class="headerButtons" id="searchButton" value="Search" />
            </form>
        </div>
        <div class="results">
            <br/>
            <br/>
            <hr/>
            <%
                if(session.getAttribute("enteredQuery") != null && session.getAttribute("enteredQuery").equals(true))
                {
                    String[][] results = SearchResults.getSearchResults();
                    if(results != null && results.length > 0)
                    {   

                        out.println("<h3>Results</h3>");
                        for(int i = 0;i < results.length;i++){ 
                            String title = results[i][0];
                            String year = results[i][1];

                            out.println("<form class='results' method='post' action='moviedetails'>");

                            out.println("<p class='results'><input type='hidden' name='title' value='"+title+"'>"+
                                    "Title: "+title+"</p>");

                            out.println("<p class='results'><input type='hidden' name='year' value='"+year+"'>"+ 
                                    "Year: "+year+"</p>");
                            out.println("<p class='results'><input type='submit' class=\"headerButtons\" value='More Details'></p>");
                            out.println("</form>");
                            out.println("<br/>");
                            out.println("<br/>");
                            
                      }
                    }
                    else
                        out.println("<p>No results for that movie</p>");
                }            
                session.setAttribute("enteredQuery", null);
                
                %>
            </text>
           
        </div>
       
    </body>
</html>
