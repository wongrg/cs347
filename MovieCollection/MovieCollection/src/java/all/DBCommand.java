package all;

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
  
} // end class
