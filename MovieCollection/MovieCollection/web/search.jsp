<%-- 
    Document   : search
    Created on : Nov 26, 2015, 9:41:56 AM
    Author     : joey
--%>

<%@page import="bean.SearchResults"%>
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
                if(session.getAttribute("results") != null)
                {
                   
                        out.println("<h3>Results</h3>");
                        String[][] results = SearchResults.getSearchResults();
                        if(results != null)
                        {  
                            for(int i = 0;i < results.length -1 ;i++){                            
                                out.println("<p>"+results[i][0].toString()+"</p>");
                                out.println("<p>"+ results[i][1].toString()+"</p>");
                                out.println("<button id=detailsButt type=submit>More Details</button>");
                                
                            }
                        }
                       
                        else
                            out.println("<p>No results for that movie</p>");
                        
                }                
                session.setAttribute("results", null);
                
                %>
            </text>
        </div>
        
    </body>
</html>
