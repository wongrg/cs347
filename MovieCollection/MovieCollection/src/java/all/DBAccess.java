package all;

import java.sql.*;

/**
 * This is the parent class for database transactions.
 * 
 * @author R.Grove
 * @version 2014-10-02
 */
public abstract class DBAccess {

    /**
     * Get a connection to the database.
     * 
     * @return The Connection object
     */
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            // create a database connection
            connection = DriverManager.getConnection("jdbc:sqlite:sample.db");
            //connection = DriverManager.getConnection("jdbc:sqlite:/Users/student/sample.db");
            initializeDB(connection);
        } 
        catch (SQLException sqe) {
            System.err.println(sqe.getMessage());
        }
        catch (ClassNotFoundException cnfe) {
        
        }
        return connection;
    }

    /*
     * Initialize the database if the required table is not already present.
     */
    private void initializeDB(Connection connection) { 
        Statement statement;
        ResultSet rs;
        
        try {
            statement = connection.createStatement();
            statement.setQueryTimeout(30);  // set timeout to 30 sec.

            statement.executeUpdate("create table if not exists class" 
                    + "(classNr varchar(10) default NULL, name varchar(30) default NULL)");

            rs = statement.executeQuery("select classNr from class");
            if (!rs.next()) {
                statement.executeUpdate("insert into class values"
                        + "('ECON101','Intro to Economics'), "
                        + "('COSC226','Web Development'), " 
                        + "('MATH198','Discrete Mathematics')");
            }

            // display the table contents
            rs = statement.executeQuery("select * from class");
            while (rs.next()) {
                System.out.print("classNr: " + rs.getString("classNr")
                        + "  name: " + rs.getString("name"));
            }

            statement.close();
        } catch (SQLException sqe) {
            System.err.println(sqe.getMessage());
        }
    }

} // end class