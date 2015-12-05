package Model;

import java.sql.*;

/**
 * This class allows access to the database for MovieBox.
 * 
 * @author Adam Todd
 * @version 12/5/15
 */
public abstract class DBAccess {

    /**
     * Get a connection to the database.
     * 
     * @return The Connection object
     */
    protected Connection getConnection() {
        Connection connection = null;
        String driverName, password, url, userId;
        try {
            Class.forName("org.sqlite.JDBC");
            // create a database connection
            driverName = "com.mysql.jdbc.Driver"; 
            url = "jdbc:mysql://us-cdbr-azure-southcentral-e.cloudapp.net/MovieBox"; 
            userId = "ba802cad911a2d"; 
            password = "8e67d14a";
        } 
        catch (ClassNotFoundException cnfe) {
        
        }
        return connection;
    }

} // end class