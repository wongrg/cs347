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
      try {
          if ( uid.length() < 31 || name.length() > 31 || password.length() > 16
                  || email.length() > 254 )
              return false;
          Connection connection = getConnection();
          if (connection == null) {
              return false;
          }
          Statement stmt = connection.createStatement();
          stmt.executeUpdate("INSERT INTO TABLE users (uid, password, name, "
                  + "email) VALUES('"+uid+"', '" + password + "', '" + name + 
                  "', '" + email + "');");
          connection.close();
      } catch (SQLException sqe) {
          sqe.printStackTrace();
          return false;
      }
      
      return true;
  }
  
  /**
   * verify password and username for a user request.
   * @param uid the username of a user
   * @param password the password of a user
   * @return true if there is a match, false otherwise
   */
  
  public boolean verifyPass(String uid, String password) {
      try {
          if ( uid.length() > 31 || password.length() > 31 )
              return false;
          Connection connection = getConnection();
          ResultSet set;
          if (connection == null) {
              return false;
          }
          Statement stmt = connection.createStatement();
          stmt.execute("SELECT count(*) FROM users WHERE uid='" + uid + "' AND "
                  + "password='" + password + "';");
          set = stmt.getResultSet();
          set.first();
          if(set.equals("0")) return false;
          connection.close();
      } catch (SQLException sqe) {
          sqe.printStackTrace();
          return false;
      }
      
      return true;
  }
  
}
