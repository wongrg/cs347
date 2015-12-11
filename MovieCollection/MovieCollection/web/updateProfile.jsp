<%-- 
    Document   : updateProfile
    Created on : Dec 7, 2015, 10:14:04 AM
    Author     : wongrg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
        <title>Update Profile</title>
    </head>
    <body>
        <h1><%= session.getAttribute("username")%></h1>
        <form method="post" action="updateprofile">
            <%
                if(session.getAttribute("success_update")!= null){
                    if((boolean)session.getAttribute("success_update") == false){
                      out.println("<script type=\"text/javascript\">alert('Update Unsucessful! Invalid Credentials')</script>");
                      session.setAttribute("success_update", null);

                    }
                }
            %>
            <%String[] details = Controller.UpdateProfileController.getDetails((String)session.getAttribute("username"));%>
            <p><label>Full Name:</label><input type="text" name="fullname" value='<%=details[1]%>'></p>
            <p><label>Birthday:</label><input type="date" name="bday" value="1930-01-02"><br><br></p>
            <p><label>Email:</label><input type="text" name="email" value='<%=details[4]%>'></p>
            <p><label>Confirm Changes:</label><input class="field" type="password" name="pass" id="passwd" placeholder="Password" required=""> 
                    <span id="passerr" class="errmsg"> </span>
            </p>
            <input type="submit" value="Update">
            
            
        </form>
    </body>
</html>
