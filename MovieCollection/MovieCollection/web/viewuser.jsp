<%-- 
    Document   : viewprofile
    Created on : Dec 6, 2015, 11:21:35 AM
    Author     : joey
--%>

<%@page import="Model.DBCommand"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Controller.ProfileController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
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
    <div>
        
        
        
        
        
        <%
                            
                
                if(session.getAttribute("enteredQuery") != null && session.getAttribute("enteredQuery").toString().length() > 0){
                    
                String uid = (String)session.getAttribute("enteredQuery");
                session.setAttribute("enteredQuery",null);
                String[] details = Controller.ProfileController.getDetails(uid);
                out.println("<title>" + uid +"'s Profile</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>"+ uid+ "'s Profile Page</h1>");
                out.println("<p>Username: " + uid +"</p>");
                //out.println("<p> Length: "+details.length+"</p>");
                out.println("<p>"+ uid +"'s Full name: " + details[1] + "</p>");
                out.println("<p>"+ uid +"'s Birthday " + details[2] + "</p>");
                out.println("<p>"+ uid +"'s Email: " + details[4] + "</p>");
                out.println("<form method=post action=friend>");
                out.println("<p><input type=submit value='Friend This Person' id='friend_butt'/></p></form>");
                
 
                out.println("<hr/>");
                out.println("<h3>"+ uid +"'s Movie Collection</h3>");
                out.println("<ul>");
                String[][] movieCollection = Controller.ProfileController.getLibrary(uid);
                //if(movieCollection != null && movieCollection.length >0){
                    for(int i =0;i < movieCollection.length;i++){                    
                        out.println("<li>Movie Title: "+movieCollection[i][0]+"</li>");
                        out.println("<p>Year: "+movieCollection[i][1]+"</p>");
                    }
               // }
                
                out.println("</ul>");
                

                out.println("<h3>" +uid +"'s Friends </h3>");
                out.println("<ul>");
                DBCommand commander = new DBCommand();
                String[] friends = commander.retrieveFriends(uid);
                
                if(friends != null && friends.length >0){
                    for(int i =0;i < friends.length;i++){                    
                        out.println("<li>"+friends[i]+"</li>");
                    }
                }
                
                out.println("</ul>");
                }
        
        %>
        <!-- build page -->
    
    </body>
</html>
