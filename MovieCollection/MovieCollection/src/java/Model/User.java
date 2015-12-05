/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.regex.Pattern;

/**
 *
 * @author wongrg
 */
public class User extends HttpServlet {

    public boolean verifyInfo(String uid, String p1, String p2, String fname, String lname, String email) {
        boolean is_valid = true;
        //Check if the userid contains any illegal characters, if it does, 
        //set the boolean to false.
        if (!Pattern.matches("^[a-z][a-z0-9]*$", uid)) {
            is_valid = false;
        }
        
        //Check if the password contains any illegal characters, if it does, 
        //set the boolean to false.
        if (!Pattern.matches("^[a-z0-9!@#$*]*$", p1)) {
            is_valid = false;
        }
        
        //Check if the two passwords match, if not, return false
        if (!p1.equals(p2)){
            is_valid = false;
        }
        //make sure the names are not null and not empty
        if (!(fname != null && fname.length() > 0)){
            if (!(lname != null && lname.length() > 0)){
                is_valid = false;
            }
        }
        
        
        return is_valid;
    }
}
