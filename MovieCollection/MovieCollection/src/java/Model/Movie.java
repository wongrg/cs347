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
    private static String[][] reviews;
    
    public Movie(String movieTitle, String movieYear,String[][] movieReviews){
        title = movieTitle;
        year = movieYear;
        reviews = movieReviews;
    }
    public static String getTitle(){
        return title;
    }
    public static String getYear(){
        return year;
    } 
    public static String[][] getMovieReviews(){
        return reviews;
    }
}
