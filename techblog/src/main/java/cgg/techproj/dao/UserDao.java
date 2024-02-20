package cgg.techproj.dao;

import cgg.techproj.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class UserDao {

  private Connection conn;

  public UserDao(Connection conn) {
    this.conn = conn;
  }

  public boolean saveUser(User user) {
    boolean f = false;
    String query =
      "insert into user1 (name,password,email,gender,about) values (?,?,?,?,?)";
    try {
      PreparedStatement ps = conn.prepareStatement(query);
      ps.setString(1, user.getName());
      ps.setString(2, user.getPassword());
      ps.setString(3, user.getEmail());
      ps.setString(4, user.getGender());
      ps.setString(5, user.getAbout());
      ps.executeUpdate();
      f = true;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return f;
  }

  public User getUserByEmailandPwd(String email, String password)
    throws SQLException {
    User user = null;
    String query = "select * from user1 where email=? and password=?";
    PreparedStatement statement = conn.prepareStatement(query);
    statement.setString(1, email);
    statement.setString(2, password);
    ResultSet rs = statement.executeQuery();
    if (rs.next()) {
      user = new User();
      user.setName(rs.getString("name"));
      user.setEmail(rs.getString("email"));
      user.setGender(rs.getString("gender"));
      user.setAbout(rs.getString("about"));
      user.setId(rs.getInt("id"));
      user.setProfile(rs.getString("profile"));
      user.setrDate(new Date());
    }

    return user;
  }

  public boolean updateUser(User user) {
    boolean f = false;
    try {
      String query =
        "update user1 set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
      PreparedStatement p = conn.prepareStatement(query);
      p.setString(1, user.getName());
      p.setString(2, user.getEmail());
      p.setString(3, user.getPassword());
      p.setString(4, user.getGender());
      p.setString(5, user.getAbout());
      p.setString(6, user.getProfile());
      p.setInt(7, user.getId());
      p.executeUpdate();
      f = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return f;
  }

  public User getUserById(int id) {
    User user = null;
    try {
      String query = "select * from user1 where id=?";
      PreparedStatement statement = conn.prepareStatement(query);
      statement.setInt(1, id);

      ResultSet rs = statement.executeQuery();
      if (rs.next()) {
        user = new User();
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setGender(rs.getString("gender"));
        user.setAbout(rs.getString("about"));
        user.setId(rs.getInt("id"));
        user.setProfile(rs.getString("profile"));
        user.setrDate(new Date());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return user;
  }
}
