<%-- 
    Document   : forgotpassword
    Created on : Dec 11, 2015, 8:50:18 AM
    Author     : wongrg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css">
        <title>Forgot your password? </title>
    </head>
    <body>
        <h1 id='bannerForgot'>Please input your information:</h1>
        <form action="forgotpassword">
            <p id='userField'>Username to confirm<input type="text" name="uid"></p>
            <p id='emailField'>Email associated with Username <input type="text" name="email"></p>
            <p>New Password <input type="password" name="pwd1"></p>
            <input class='headerButtons'type="submit" name="enter" value="Submit">

        </form>
    </body>
</html>
