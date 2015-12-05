package Model;

import java.sql.*;

/**
 * This class executes SQL commands.
 * 
 * @author R.Grove
 * @version 2014-10-02
 */
public class DBCommand extends DBAccess {

  /**
   * Execute an SQL command.
   * 
   * @param command The command to be executed
   * @return true if the command is executed, false if any exception is thrown
   */
  public boolean executeCommand(String command) {
    try {
      Connection connection = getConnection();
      if (connection == null) {
        return false;
      }
      Statement stmt = connection.createStatement();
      stmt.executeUpdate(command);
      connection.close();
    } catch (SQLException sqe) {
      sqe.printStackTrace();
      return false;
    }
    return true;
  }
  
  /**
   * add a user to the users table.
   * @param uid user identification string LEN MUST BE <= 31
   * @param name name string LEN MUST BE <= 31
   * @param password password string LEN MUST BE <= 16
   * @param email email string LEN MUST BE <= 254 AND FOLLOW EMAIL FORMAT
   * @return true if successful, false otherwise
   */
  
  public boolean addUser(String uid, String name, String password, String email) {
      try {
          Connection connection = getConnection();
          if (connection == null) {
              return false;
          }
          Statement stmt = connection.createStatement();
          stmt.executeUpdate("INSERT INTO TABLE users VALUES('"+uid+"', '" +
                  password + "', '" + name + "', '" + email + "', NULL, NULL, "
                  + "NULL);");
          connection.close();
      } catch (SQLException sqe) {
          sqe.printStackTrace();
          return false;
      }
      
      return true;
  }
  
} // end class
