package Model;

import java.sql.*;

/**
 * This class executes specified SQL commands.
 * 
 * @author Adam Todd
 * @version 12/5/15
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
      boolean successful = false;
      try {
          if ( uid.length() < 31 || name.length() > 31 || password.length() > 16
                  || email.length() > 254 )
              return successful;
          Connection connection = getConnection();
          if (connection == null) {
              return successful;
          }
          Statement stmt = connection.createStatement();
          stmt.executeUpdate("INSERT INTO users (uid, password, name, "
                  + "email) VALUES('"+uid+"', '" + password + "', '" + name + 
                  "', '" + email + "');");
          connection.close();
          successful = true;
      } catch (SQLException sqe) {
          sqe.printStackTrace();
          return false;
      }
      
      return successful;
  }
  
  /**
   * verify password and username for a user request.
   * @param uid the username of a user
   * @param password the password of a user
   * @return true if there is a match, false otherwise
   */
  
  public boolean verifyPass(String uid, String password) {
      boolean is_valid = false;
      try {
          if ( uid.length() > 31 || password.length() > 31 )
              is_valid = false;
          Connection connection = getConnection();
          ResultSet set;
          if (connection == null) {
              is_valid = false;
          }
          Statement stmt = connection.createStatement();
          stmt.execute("SELECT uid FROM users WHERE uid='" + uid + "' AND "
                  + "password='" + password + "';");
          set = stmt.getResultSet();
          set.first();
          if(set.getString("uid").equals(uid)) is_valid = true;
          connection.close();
      } catch (SQLException sqe) {
          sqe.printStackTrace();
          is_valid = false;
      }
      
      return is_valid;
  }
  
}
