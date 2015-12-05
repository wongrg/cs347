<%-- 
    Document   : search
    Created on : Nov 26, 2015, 9:41:56 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/searchstylesheet.css">
        <script type="text/javascript" src="scripts/clearTextValue.js"></script>
        <title>Search Page</title>
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
        <h2>Search for a Movie Title</h2>
        <div>
            <form method="post" action="/search" id="searchform">
                <input type="text" id="searchbox" value="Movie Title, Actors, Producers" onfocus="changeText(this)">
                <input type="submit" id="searchButton" value="Search">
            </form>
        </div>
    </body>
</html>
