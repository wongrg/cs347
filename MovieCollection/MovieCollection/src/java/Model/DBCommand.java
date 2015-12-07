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
   * add a user to the users table.
   * @param uid user identification string LEN MUST BE <= 31
   * @param name name string LEN MUST BE <= 31
   * @param password password string LEN MUST BE <= 16
   * @param email email string LEN MUST BE <= 254 AND FOLLOW EMAIL FORMAT
   * @return true if successful, false otherwise
   */
  
  public boolean addUser(String uid, String name, String password, String email) {
      boolean successful = false;
      if ( uid.length() > 31 || name.length() > 31 || password.length() > 16
                  || email.length() > 254 )
              return successful;
      try (Connection connection = getConnection()) {
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
          return false;
      }
      
      return successful;
  }
  
  
    public String[] detailUser(String uid) {
      String[] details = new String[5];
      try (Connection connection = getConnection()){
          if (connection == null) {
              return null;
          }
          Statement stmt = connection.createStatement();
          
          ResultSet rs = stmt.executeQuery("SELECT uid, name, email, age, birthdate FROM users WHERE uid= '" +uid+"';");
          rs.first();
          
          details[0] = rs.getString(1);
          details[1] = rs.getString(2);
          // TODOdetails[2] = rs.getDate(5).toString();
          details[3] = ((Integer)rs.getInt(4)).toString();
          details[4] = rs.getString(3);
              
          
          connection.close();
          
      } catch (SQLException sqe) {
          return null;
      }
      
      return details;
  }
  /**
   * Execute an SQL command.
   * 
   * @param command The command to be executed
   * @return true if the command is executed, false if any exception is thrown
   */
  public boolean executeCommand(String command) {
    try (Connection connection = getConnection()) {
      if (connection == null) {
        return false;
      }
      Statement stmt = connection.createStatement();
      stmt.executeUpdate(command);
      connection.close();
    } catch (SQLException sqe) {
      return false;
    }
    return true;
  }
  
  /**
   * removes a uid from the users table.
   * @param uid the uid of a user to be removed
   * @return true if the user was removed, false otherwise.
   */
  
  public boolean removeUser(String uid) {
      boolean successful = false;
      if ( uid.length() > 31 )
              return successful;
      try (Connection connection = getConnection()){
          if (connection == null)
              return successful;
          Statement stmt = connection.createStatement();
          stmt.executeUpdate("DELETE FROM users WHERE uid='" + uid + "' LIMIT 1;");
          connection.close();
          successful = true;
      } catch (SQLException sqe) {
          return successful;
      }
      return successful;
  }
  
  /**
   * This method updates the user entry in the users table, use null where you 
   * don't want to change and be sure to include the uid so it can update that 
   * certain record.
   * 
   * @param uid the uid, it must not be null and be correct length
   * @param password the password for user, can be null, leave null if no change
   *    is needed.
   * @param name the name of a user, can be null, leave null if no change is 
   *    needed.
   * @param email the email of a user, can be null, leave null if no change is 
   *    needed.
   * @param age the age of a user, make it less than or equal to zero if no 
   *    change is needed.
   * @param birthdate the birthdate of a user, can be null, leave null if no 
   *    change is needed.
   * @return true if the query was successful, false otherwise.
   */
  
  public boolean updateUser(String uid, String password, String name, 
          String email, int age, Date birthdate) {
    String query = "";
    if (uid == null || uid.length() > 31)
        return false;
    
    try (Connection conn = getConnection()) {
        //valid connection check
        if (conn == null)
            return false;
        
        //begin generation of statement
        Statement stmt = conn.createStatement();
        
        //generate what to update
        if(password!=null && password.length()<=16)
            query+="password='"+password+"' ";
        if(name!=null&&name.length()<=31)
            query+="name='"+name+"' ";
        if(email!=null&&email.length()<=254)
            query+="email='"+email+"' ";
        if(age>0)
            query+="age="+((Integer)age).toString()+" ";
        if(birthdate!=null)
            query+="birthdate='"+birthdate.toString()+"' ";
        
        //execute update query
        stmt.executeUpdate("UPDATE users SET "+query+"WHERE uid="+uid+";");
        
        //close connection
        conn.close();
    } catch (SQLException sqe) {
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
      boolean is_valid = false;
      if ( uid.length() > 31 || password.length() > 16 )
          return false;
      try (Connection connection = getConnection()){
          
          ResultSet set;
          if (connection == null) {
              return false;
          }
          Statement stmt = connection.createStatement();
          stmt.execute("SELECT uid FROM users WHERE uid='" + uid + "' AND "
                  + "password='" + password + "';");
          set = stmt.getResultSet();
          set.first();
          if(set.getString("uid").equals(uid)) is_valid = true;
          connection.close();
      } catch (SQLException sqe) {
          is_valid = false;
      }
      
      return is_valid;
  }
  
}
