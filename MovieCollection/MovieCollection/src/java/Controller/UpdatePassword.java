/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DBCommand;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wongrg
 */
@WebServlet(name = "UpdatePassword", urlPatterns = {"/forgotpassword"})
public class UpdatePassword extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String uid = request.getParameter("uid");
        String email = request.getParameter("email");
        String pw1 = request.getParameter("pwd1");
        //String pw2 = request.getParameter("pwd2");
        DBCommand commander = new DBCommand();
        //User user = new User();
        
        
        if(!commander.resetPassword(uid, email,pw1)){
                try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Invalid Credentials</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1> <p>Credentials Were Not Valid </p></h1>");
                out.println("<p> We were unable to process the credentials"
                        + " provided and thus were unable to reset password</p>");
                out.println("<p><a href='/forgotpassword.jsp'> Click here to retry</a></p>");
                out.println("<p> Click <a href='/login.jsp'> here</a> to return to the login page</p>");
              
                out.println("</body>");
                out.println("</html>"); 
                }
        }
        else{
                try (PrintWriter out = response.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Success</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1> <p>Successfully updated password</p></h1>");
                out.println("<p> Click <a href='/login.jsp'> here</a> to return to the login page</p>");
                out.println("</body>");
                out.println("</html>"); 
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
