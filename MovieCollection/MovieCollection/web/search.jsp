<%-- 
    Document   : search
    Created on : Nov 26, 2015, 9:41:56 AM
    Author     : joey
--%>

<%@page import="bean.SearchResults"%>
<%@page import="bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheets/searchstylesheet.css">
        <script type="text/javascript" src="scripts/processText.js"></script>
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
        <div class="searchformdiv">
            <form method="post" action="search" id="searchform">
                <input type="text" name="search_term" id="searchbox" placeholder="Search Movie Title" required=''>
                <input type="submit" id="searchButton" value="Search" />
            </form>
        </div>
        <div class="results">
            <br/>
            <br/>
            <hr/>
            <%
                if(session.getAttribute("enteredQuery") != null && session.getAttribute("enteredQuery").equals(true))
                {
                    String[][] results = SearchResults.getSearchResults();
                    if(results != null && results.length > 0)
                    {   

                        out.println("<h3>Results</h3>");
                        for(int i = 0;i < results.length -1 ;i++){ 
                            String title = results[i][0];
                            String year = results[i][1];

                            out.println("<form method='post' action='moviedetails'");

                            out.println("<p><input type='hidden' name=title value='"+title+"'>"+
                                    title+"</p>");

                            out.println("<p><input type=hidden name=year value='"+year+"'>"+ 
                                    year+"</p>");
                            out.println("<input type='submit' value='More Details'>");
                            out.println("</form>");
                      }
                    }
                    else
                        out.println("<p>No results for that movie</p>");
                }            
                session.setAttribute("enteredQuery", null);
                
                %>
            </text>
           
        </div>
       
    </body>
</html>
