<%-- 
    Document   : viewuser
    Created on : Nov 26, 2015, 9:42:37 AM
    Author     : joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%! String username = ""; 
            String[] movieList={};
        %>
        <h2><%="User:"+username %></h2>
        <h2>Movies:</h2>
        <ul>
            <%
                for(int i = 0; i < movieList.length;i++){                   
                    out.print("<li>");
                    movieList[i].toString(); 
                    out.print("</li><br/>");
                }
             %>
        </ul>
    </body>
</html>
