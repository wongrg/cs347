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
                            
                if(session.getAttribute("success_update")!= null){
                    if((boolean)session.getAttribute("success_update") == true){
                      
                      out.println("<script type=\"text/javascript\">alert('Update Successful!')</script>");
                      out.println("" + session.getAttribute("check"));
                      session.setAttribute("success_update", null);
                    }
                }
            
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
                out.println("<button id='updateProfile' onclick=location.href='updateProfile.jsp';>"
                +"Update your profile</button>"); 
                out.println("<form method='post' action='deleteuser'>");
                out.println("<input type='submit' value='Delete Account'>");
                out.println("</form>");
                out.println("<hr/>");
                out.println("<h3>Your Movie Collection</h3>");
                out.println("<ul>");
                String[][] movieCollection = Controller.ProfileController.getLibrary(uid);
                if(movieCollection != null && movieCollection.length >0){
                    for(int i =0;i < movieCollection.length-1;i++){                    
                        out.println("<li>Movie Title: "+movieCollection[i][0]+"</li>");
                        out.println("<p>Year: "+movieCollection[i][1]+"</p>");
                    }
                }
                
                out.println("</ul>");

        %>
        <!-- build page -->
    
    </body>
</html>
