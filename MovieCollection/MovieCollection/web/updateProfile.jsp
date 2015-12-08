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
        <title>Update Profile</title>
    </head>
    <body>
        <h1><%= session.getAttribute("username")%></h1>
        <form method="post" action="updateprofile">
            <%String[] details = Controller.UpdateProfileController.getDetails((String)session.getAttribute("username"));%>
            <p><label>User ID:</label><input type="text" name="uid" value='<%=details[0]%>'></p>
            <p><label>Full Name:</label><input type="text" name="fullname" value='<%=details[1]%>'></p>
            <p><label>Birthday:</label><input type ="text" name="bday" value='<%=details[2]%>'></p>
            <p><label>Email:</label><input type="text" name="email" value='<%=details[4]%>'></p>
            
            <input type="submit" value="Update">
            
            
        </form>
    </body>
</html>
