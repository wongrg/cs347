<%-- 
    Document   : addreview
    Created on : Nov 28, 2015, 9:17:41 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String buttonStatus;%>
<%
    //If the user is not logged in they cannot add a review- redirect to login.jsp
    if (session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals(false)) {
        response.sendRedirect("/login.jsp");
    }
    else
       buttonStatus = "Home";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/movieDetailsStyle.css">
        <title>Add A Movie Review</title>
    </head>
    <body>
         <div class="header">
           
            <a href="index.jsp">
                <img src="images/tempMovieCollection.jpg" id="mcPic"></a>                  
                <button id="loginButt" onclick="location.href='index.jsp'"><%=buttonStatus%></button>
        </div>
        <hr>
        
        <h3>Enter your review and click submit when finished</h3>
        <form method="post" action="addreview" id="reviewform">
            <textarea maxlength="255" name="reviewtext" id="reviewarea" form="reviewform">
                
            </textarea><br/>
            <input type="submit" id="submitReview" value="Submit">
        </form>
    </body>
</html>
