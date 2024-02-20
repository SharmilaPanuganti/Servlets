package cgg.techproj.dao;

import cgg.techproj.entities.Category;
import cgg.techproj.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

  Connection con;

  public PostDao(Connection con) {
    this.con = con;
  }

  public ArrayList<Category> getAllCategories() {
    ArrayList<Category> list = new ArrayList<>();
    try {
      String q = "select * from categories";
      Statement st = this.con.createStatement();
      ResultSet set = st.executeQuery(q);
      while (set.next()) {
        int cid = set.getInt("cid");
        String name = set.getString("name");
        String description = set.getString("description");
        Category c = new Category(cid, name, description);
        list.add(c);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return list;
  }

  public boolean savePost(Post p) {
    boolean f = false;
    try {
      String query =
        "insert into post(ptitle,pcode,pcontent,ppic,catId,userId) values(?,?,?,?,?,?)";
      PreparedStatement statement = con.prepareStatement(query);
      statement.setString(1, p.getpTitle());
      statement.setString(2, p.getpCode());
      statement.setString(3, p.getpContent());
      statement.setString(4, p.getpPic());
      statement.setInt(5, p.getCatId());
      statement.setInt(6, p.getUserId());

      statement.executeUpdate();
      f = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return f;
  }

  public List<Post> getAllPosts() {
    List<Post> posts = new ArrayList<>();
    String query = "select * from post order by pid desc";
    try {
      PreparedStatement ps = con.prepareStatement(query);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        int pId = rs.getInt(1);
        String pTitle = rs.getString(2);
        String pContent = rs.getString(3);
        String pCode = rs.getString(4);
        String pPic = rs.getString(5);
        int cId = rs.getInt(6);
        Timestamp pDate = rs.getTimestamp(7);
        int userId = rs.getInt(8);

        Post post = new Post(pTitle, pContent, pCode, pPic, pDate, cId);
        post.setPid(pId);
        post.setUserId(userId);
        posts.add(post);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return posts;
  }

  public List<Post> getPostbyCategory(int cid) {
    List<Post> posts = new ArrayList<>();
    String query = "select * from post where catid=?";
    try {
      PreparedStatement ps = con.prepareStatement(query);
      ps.setInt(1, cid);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        int pId = rs.getInt(1);
        String pTitle = rs.getString(2);
        String pContent = rs.getString(3);
        String pCode = rs.getString(4);
        String pPic = rs.getString(5);
        int cId = rs.getInt(6);
        Timestamp pDate = rs.getTimestamp(7);
        int userId = rs.getInt(8);

        Post post = new Post(pTitle, pContent, pCode, pPic, pDate, cId);
        post.setPid(pId);
        post.setUserId(userId);
        posts.add(post);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return posts;
  }

  public Post getPostById(int postId) {
    Post p = null;
    try {
      PreparedStatement st =
        this.con.prepareStatement("select * from post where pid=?");
      st.setInt(1, postId);
      ResultSet rs = st.executeQuery();
      if (rs.next()) {
        int pId = rs.getInt(1);
        String pTitle = rs.getString(2);
        String pContent = rs.getString(3);
        String pCode = rs.getString(4);
        String pPic = rs.getString(5);
        int cId = rs.getInt(6);
        Timestamp pDate = rs.getTimestamp(7);
        int userId = rs.getInt(8);

        p = new Post(pTitle, pContent, pCode, pPic, pDate, cId);
        p.setPid(pId);
        p.setUserId(userId);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return p;
  }
}
