/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DBCommand;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "AddReviewController", urlPatterns = {"/addreview"})
public class AddReviewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String review = request.getParameter("reviewtext");
        String uid = (String)session.getAttribute("username");
        String movieTitle= (String)session.getAttribute("currentMovieTitle");
        if(review.contains("<")){
            review = review.replace("<", "&lt;"); 
        }
        if(review.contains(">")){              
           review = review.replace(">", "&gt;");
        }
        if(review.contains("(")){
            review = review.replace("\\(", "&#40");
        }
        if(review.contains(")")){
            review = review.replace("\\)", "&#41");
        }
        if(review.contains("&")){           
            review = review.replace("&)", "&#38");
        }
        if(review.contains("|")){           
            review = review.replace("|", "&#124");
        }
        
        DBCommand commander = new DBCommand();
        commander.addReview(uid,movieTitle,review);
        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/moviedetails.jsp");
        //dispatcher.(request, response);
        response.sendRedirect("moviedetails.jsp");
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
