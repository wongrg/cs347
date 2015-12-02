<%-- 
    Document   : register
    Created on : Nov 25, 2015, 9:51:24 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/signupstyle.css">
        <script type="text/javascript" src="scripts/clearTextValue.js"></script>
        <title>Sign Up Page</title>
    </head>
    <body>
        <a href="index.jsp">
            <img src="images/tempMovieCollection.jpg" id="mcPic">
        </a>
        <br>
        <br>
        <div>
            <form method="post" action="register" id="registerForm"
                 <p>
                    <input type="text" id="userId" value="Username" onfocus="changeText(this)">                
                </p>
                <p>
                    <input type="password" id="passwd" value="Password" onfocus="changeText(this)">               
                </p>
                <p>
                    <input type ="password" id="pass2" value="Re-enter Password" onfocus="changeText(this)">              
                </p>
                <p>
                   <input type="text" id="fName" value="Firstname" onfocus="changeText(this)">
                </p>
                <p>
                    <input type="text" id="lName" value="Lastname" onfocus="changeText(this)">
                </p>
                <p>
                    <input type="text" id="emailAdd" value="Email Address" onfocus="changeText(this)">
                </p>
                <p>
                    <input type="submit" id="register" value="Register">
                </p>
            </form>
        </div>
    </body>
</html>
