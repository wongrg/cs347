<%-- 
    Document   : register
    Created on : Nov 25, 2015, 9:51:24 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Mandate client use HTTPS
    if(! request.isSecure()){
        String secureURL = request.getRequestURL().toString().toLowerCase().replace("http","https");        
        response.sendRedirect(secureURL.replace("8084", "8443"));
    }    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/signupstyle.css">
        <script type="text/javascript" src="scripts/processText.js"></script>
        <title>Sign Up Page</title>
    </head>
    <body>
        <div class="header">
        <a href="index.jsp">
            <img src="images/tempMovieCollection.jpg" id="mcPic" alt="Movie Box">
        </a>
            <button id="button_login" onclick="location.href = 'login.jsp';">Home</button>
        </div>
        <hr/>
        
        <div class="register">
            <form method="post" action="register" id="registerForm" onsubmit="return validateRegisterForm()">
                 <p>
                    <input class="field" type="text" name="userid" id="userid" value="Username" onfocus="changeText(this)">  
                    <span id="useriderr" class="errmsg"> </span>
                </p>
                <p>
                    <input class="field" type="password" name="pass" id="passwd" value="Password" onfocus="changeText(this)"> 
                    <span id="passerr" class="errmsg"> </span>
                </p>
                <p>
                    <input class="field" type ="password" name="pass2" id="pass2" value="Re-enter Password" 
                           onfocus="changeText(this)">    
                        <span id="passerr" class="errmsg"> </span>
                </p>
                <p>
                   <input class="field" type="text" name="fName" id="fName" value="Firstname" onfocus="changeText(this)">
                        <span id="fnameerr" class="errmsg"> </span>
                </p>
                <p>
                    <input class="field" type="text" name="lName" id="lName" value="Lastname" onfocus="changeText(this)">
                            <span id="lnameerr" class="errmsg"> </span>

                </p>
                <p>
                    <input class="field" type="text" name="emailAdd" id="emailAdd" value="Email Address" onfocus="changeText(this)">
                            <span id="emailerr" class="errmsg"> </span>

                </p>
                <p>
                    <input type="submit" id="register" value="Register">
                </p>
            </form>
        </div>
    </body>
</html>
