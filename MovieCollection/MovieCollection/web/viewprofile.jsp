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
                out.println("<button class='headerButtons' onclick=location.href='viewprofile.jsp';>"
                +"View Profile</button></td>"); 
                out.println("<td><button class='headerButtons' onclick=location.href='updateProfile.jsp';>"
                +"Update your profile</button></td>"); 
                out.println("<td><form method=post action=logout>");
            }            
        %>

        
        
        
        
        
        <%
                            
                if(session.getAttribute("success_update")!= null){
                    if((boolean)session.getAttribute("success_update") == true){
                      
                      out.println("<script type=\"text/javascript\">alert('Update Successful!')</script>");
                      session.setAttribute("success_update", null);
                    }
                }
            
                String uid = (String)session.getAttribute("username");
                DBCommand commander = new DBCommand();
                String[] details = commander.detailUser(uid);
                if(details != null){

                    out.println("<td><form method='post' action='deleteuser'>");
                    out.println("<input class='headerButtons' type='submit' id='deleteacct'value='Delete Account'>");
                    out.println("<input class='headerButtons' type=submit value=Logout id='logout_butt'/></form></td>");
                    out.println("</form></td>");
                    out.println("</tr>");
                    out.println("</tbody>");
                    out.println("</table>");
                    out.println("</div>");
                    out.println("<hr/>");
                    out.println("<div>");
                    out.println("<title>" + uid +"'s Profile</title>");            
                    out.println("</head>");
                    out.println("<body>");


                    out.println("<h1>"+ uid+ "'s Profile Page</h1>");
                    out.println("<p>Username: " + uid +"</p>");
                    //out.println("<p> Length: "+details.length+"</p>");
                    out.println("<p>Full name: " + details[1] + "</p>");
                    //out.println("<p>Birthday " + details[2] + "</p>");
                    //out.println("<p>Email: " + details[4] + "</p>");

                    out.println("<hr/>");
                    out.println("<h3>Your Movie Collection</h3>");
                    out.println("<ul>");
                    String[][] movieCollection = Controller.ProfileController.getLibrary(uid);
                    //if(movieCollection != null && movieCollection.length >0){
                        for(int i =0;i < movieCollection.length;i++){                    
                            out.println("<li>Movie Title: "+movieCollection[i][0]+"</li>");
                            out.println("<p>Year: "+movieCollection[i][1]+"</p>");
                            out.println("<form method='post' action='deletemoviefromlib'>");
                            out.println("<input type='hidden' name='title' value='"+movieCollection[i][0]+"'>");
                            out.println("<p><input class='movieRemove' type='submit' name='delete' value='Remove this movie'></p>");
                            out.println("</form>");

                        }
                   // }

                    out.println("</ul>");
                    out.println("<h3>Your Friends </h3>");
                    out.println("<ul>");
                    String[] friends = commander.retrieveFriends(uid);
                    if(friends != null && friends.length >0){
                        for(int i =0;i < friends.length;i++){                    
                            out.println("<li>"+friends[i]+"</li>");
                            out.println("<form method='post' action='deletefriend'>");
                            out.println("<input type='hidden' name='friend_name' value='"+friends[i]+"'>");
                            out.println("<p><input class='headerButtons' type='submit' name='delete' value='Unfollow this person'></p>");
                            out.println("</form>");
                        }
                   }
                
                out.println("</ul>");
                }
        %>
        <!-- build page -->
    
    </body>
</html>
