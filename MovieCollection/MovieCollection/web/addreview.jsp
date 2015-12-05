<%-- 
    Document   : addreview
    Created on : Nov 28, 2015, 9:17:41 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/movieDetailsStyle.css">
        <title>Add A Movie Review</title>
    </head>
    <body>
         <div>
            <table>
                <tr>
                    <th>
                           <a href="index.jsp">
                       <img src="images/tempMovieCollection.jpg" id="mcPic"></a>
                    </th>
                    
                    <th>
                        <button id="loginButt" onclick="location.href='login.jsp'">Login</button>
                    </th>
                </tr>
            </table>
                      
        </div>
        <hr>
        
        <h3>Enter your review and click submit when finished</h3>
        <form method="post" action="/addreview" id="reviewform">
            <textarea maxlength="240" id="reviewarea" form="reviewform">
                
            </textarea><br/>
            <input type="submit" id="submitReview" value="Submit">
        </form>
    </body>
</html>
