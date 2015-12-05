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
/**
 *
 * @author joey
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

   
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
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
                commander.addUser(uid,full_name , password, email);
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
       String username = request.getParameter("userid");
       String pass1 = request.getParameter("passwd");
       String fName = request.getParameter("fName");
       String lName = request.getParameter("lName");
       String emailAdd= request.getParameter("emailAdd");
       
       //Construct object of the model class that will handle adding users to database see lab7
       //here Class varname= new Class();
       
       if(username != null && pass1 != null && fName!=null && lName !=null && emailAdd !=null){
           //varname.addUsername(username);
           //varname.addPassword(pass1);
           //varname.addFirstName(fName);
           //varname.addLastName(lName);
           //varname.addEmail(emailAdd);
           response.sendRedirect("login.jsp");
       }
       else{
          response.sendRedirect("errorpage.html");
       }
      
           
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
