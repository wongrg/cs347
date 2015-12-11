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
 * @author Rob, Joey, Adam
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateprofile"})
public class UpdateProfileController extends HttpServlet {

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
            String uid = (String)session.getAttribute("username");
            
            String full_name = request.getParameter("fullname");
            
            String bday = request.getParameter("bday");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            DBCommand commander = new DBCommand();
            String[] details = commander.detailUser(uid);
            RequestDispatcher dispatcher;
            if(commander.verifyPass(uid, password)){
                
               session.setAttribute("check", commander.updateUser(uid, password, full_name, email, 0, null));      

                
                dispatcher = getServletContext().getRequestDispatcher("/viewprofile.jsp");
                session.setAttribute("success_update", true);
                dispatcher.forward(request, response);
            }
            else{
                dispatcher = getServletContext().getRequestDispatcher("/updateProfile.jsp");
                session.setAttribute("success_update", false);
                dispatcher.forward(request, response);
            }
    }
    
    public static String[] getDetails(String uid){
        DBCommand commander = new DBCommand();
        return commander.detailUser(uid);
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
