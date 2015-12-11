<%-- 
    Document   : moviedetails
    Created on : Nov 25, 2015, 11:47:44 AM
    Author     : Robbie Joey Adam
--%>

<%@page import="Model.DBCommand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Movie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
        <script type="text/javascript" src="scripts/processText.js"></script>
        <title>Movie Details</title>
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
                    <button class="headerButtons" onclick="location.href = '<%=urlButton%>';">
                        <%=buttonState%></button>
                    </td>
        <%
            if(session.getAttribute("loggedIn") != null && session.getAttribute("loggedIn").equals(true))
            {  
                out.println("<td>");
                out.println("<button id='vP' class='headerButtons' onclick=location.href='viewprofile.jsp';>"
                +"View Profile</button></td>"); 
                out.println("<td><form method=post action=logout>");
                out.println("<input class='headerButtons' type=submit value=Logout id='logout_butt'/></form></td>");
            }            
        %>
                </tr>
            </tbody>
        </table>
    </div>
    <hr/>
    <div>
        
            <p class="movieDetail">Movie Title: 
                <% String title=Movie.getTitle();   
                    session.setAttribute("title", title);
                    String year = Movie.getYear();
                %>  
                <%=title%>(<%=year%>)
            </p>
            
            
            <%
                if(session.getAttribute("loggedIn") != null && session.getAttribute("loggedIn").equals(true))
                {
                    out.println("<form method='post' action='addmovie'>");
                    out.println("<input class='headerButtons' type='submit' value='Add Movie' >");
                    out.println("</form>");
                }
                else
                    out.println("");
                %>            
        
        
    </div>
       
            
    <h4>Movie Reviews</h4>
    
    <p>   
    <%
           DBCommand commander = new DBCommand();
           String[][] movieReviews = commander.retrieveReviews(Movie.getTitle());//(String)request.getAttribute("currentMovieTitle"));
            if(movieReviews != null ){
                for(int i=0;i< movieReviews.length;i++){
                   out.println("<p>"+movieReviews[i][0]+"</p>");
                   out.println("<p>"+movieReviews[i][1]+"</p>");
                }
            }
       
       %>
             <%
           if(session.getAttribute("loggedIn") !=null && (boolean)session.getAttribute("loggedIn")==true){
               out.println("<button class='headerButtons' name='addreview' onclick=location.href='addreview.jsp' >Add Review</button>");
               session.setAttribute("currentMovieTitle", Movie.getTitle());
           } 
     %>
    </p>

        
    </body>
</html>
