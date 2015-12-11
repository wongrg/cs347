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
    
    /**
     * Makes a movie object
     * @param movieTitle title of movie object
     * @param movieYear year of movie object
     * @param movieReviews reviews of movie object
     */
    public Movie(String movieTitle, String movieYear,String[][] movieReviews){
        title = movieTitle;
        year = movieYear;
        reviews = movieReviews;
    }
    
    /**
     * gets title of movie object
     * @return title of movie object or null
     */
    public static String getTitle(){
        return title;
    }
    
    /**
     * gets year of movie object
     * @return year of the movie object or null
     */
    public static String getYear(){
        return year;
    } 
    
    /**
     * gets movie reviews of movie object
     * @return the movie reviews of movie object
     */
    public static String[][] getMovieReviews(){
        return reviews;
    }
}
