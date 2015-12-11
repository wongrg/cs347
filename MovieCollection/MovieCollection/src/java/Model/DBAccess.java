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
     * @return The Connection object associated with the db connection
     */
    protected Connection getConnection() {
        Connection connection;
        String driverName, password, url, userId;
        try {
            // register driver
            driverName = "com.mysql.jdbc.Driver"; 
            Class.forName(driverName);
            
            //get a connection
            url = "jdbc:mysql://us-cdbr-azure-southcentral-e.cloudapp.net/MovieBox"; 
            userId = "ba802cad911a2d"; 
            password = "8e67d14a";
            connection = DriverManager.getConnection(url, userId, password);
        } catch (SQLException | ClassNotFoundException sqe) {
            return null;
        }
        return connection;
    }

} // end class