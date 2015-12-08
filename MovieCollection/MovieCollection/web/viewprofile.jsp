<%-- 
    Document   : viewprofile
    Created on : Dec 6, 2015, 11:21:35 AM
    Author     : joey
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="Controller.ProfileController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%
                
                String uid = (String)session.getAttribute("username");
                String[] details = Controller.ProfileController.getDetails(uid);
                out.println("<title>" + uid +"'s Profile</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>"+ uid+ "'s Profile Page</h1>");
                out.println("<p>Username: " + uid +"</p>");
                //out.println("<p> Length: "+details.length+"</p>");
                out.println("<p>Full name: " + details[1] + "</p>");
                out.println("<p>Birthday " + details[2] + "</p>");
                out.println("<p>Email: " + details[4] + "</p>");
                out.println("<p>Email: " + details[4] + "</p>");
                out.println("<button id='updateProfile' onclick=location.href='updateProfile.jsp';>"
                +"Update your profile</button></td>"); 
                        
                out.println("<h3>Your Movie Collection</h3>");
                out.println("<ul>");
                
                
                
                out.println("</ul>");

        %>
        <!-- build page -->
    
    </body>
</html>
