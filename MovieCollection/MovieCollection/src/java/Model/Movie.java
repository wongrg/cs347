/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author joey
 */
public class Movie {
    private static String title;
    private static String year;
    
    public Movie(String movieTitle, String movieYear){
        title = movieTitle;
        year = movieYear;
    }
    public static String getTitle(){
        return title;
    }
    public static String getYear(){
        return year;
    }      
}
