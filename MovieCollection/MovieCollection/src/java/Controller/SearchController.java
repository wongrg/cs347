/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import bean.SearchResults;
import Model.DBCommand;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joey
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("search_term");
        //Need to validate the term here
        DBCommand commander = new DBCommand();
        String[][] movieResults = commander.movieSearch(searchTerm,0);
        SearchResults results = new SearchResults(movieResults); //Create SearchResults bean for results        
        HttpSession session = request.getSession(true);
        session.setAttribute("enteredQuery", true);       //Not sure if this needs to be an attribute
        response.sendRedirect("search.jsp"); //redirect back to the search page to display results
        
//        PrintWriter out = response.getWriter();
//        out.println("Movie Results");
//        for(int i = 0; i<movieResults.length - 1; i++)
//        {
//            out.println("    Movie Title " + movieResults[i][0]);
//            out.println("    Movie Year " + movieResults[i][1]);        //response.sendRedirect("search.jsp");
//            out.println("\n");;
//        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
