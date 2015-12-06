/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;
import java.io.Console;
/**
 *
 * @author joey
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

   
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String uid = request.getParameter("userid");
            String password = request.getParameter("pass");
            String password2 = request.getParameter("pass2");
            String email = request.getParameter("emailAdd");
            String fname = request.getParameter("fName");
            String lname = request.getParameter("lName");
            String full_name = null;
            //This object is part of the Model that will validate user information
            //for logging in. 
            User user_model = new User();
            DBCommand commander = new DBCommand();
            if(user_model.verifyInfo(uid, password, password2, fname, lname, email)){
                full_name = fname + " " + lname;
                System.out.println("HI");
                
                if(commander.addUser(uid,full_name , password, email)){
                    request.getRequestDispatcher("/success_registration.html").forward(request, response);
                     
                }
                else{
                    request.getRequestDispatcher("/failure_registration.html").forward(request, response);
                    }
                }
                
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
