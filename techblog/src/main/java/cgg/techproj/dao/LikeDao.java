package cgg.techproj.dao;

import cgg.techproj.entities.Like;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

  private Connection conn;

  public LikeDao(Connection conn) {
    this.conn = conn;
  }

  public boolean insertLike(int pid, int uid) {
    boolean f = false;
    try {
      PreparedStatement st = conn.prepareStatement(
        "insert into post_like(pid,uid) values(?,?)"
      );
      st.setInt(1, pid);
      st.setInt(2, uid);
      st.executeUpdate();
      f = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return f;
  }

  public int countLikeOnPost(int pid) {
    int count = 0;
    String q = "select count(*) from post_like where pid=?";
    try {
      PreparedStatement st = conn.prepareStatement(q);
      st.setInt(1, pid);
      ResultSet rs = st.executeQuery();
      if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return count;
  }

  public boolean isLikedByUser(int pid, int uid) {
    boolean f = false;
    try {
      PreparedStatement st = conn.prepareStatement(
        "select * from post_like where pid=? and uid=?"
      );
      st.setInt(1, pid);
      st.setInt(2, uid);
      st.executeQuery();
      f = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return f;
  }

  public boolean deleteLike(int pid, int uid) {
    boolean f = false;
    try {
      PreparedStatement st = conn.prepareStatement(
        "delete from post_like where pid=? and uid=?"
      );
      st.setInt(2, uid);
      st.setInt(1, pid);
      st.executeUpdate();
      f = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return f;
  }
}
