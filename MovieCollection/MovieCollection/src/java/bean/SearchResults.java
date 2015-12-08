/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;



/**
 * This bean stores the 2 dimensional array of the search results from the search controller
 * so it can be access by search.jsp
 * @author joey
 */
public class SearchResults {
    private static String[][] movieResults;    //Two dimensional array to hold the results of the query
       
    public SearchResults(String[][] results){
        movieResults=results;               
    }
    public static String[][] getSearchResults(){
        return movieResults;
    }
}
