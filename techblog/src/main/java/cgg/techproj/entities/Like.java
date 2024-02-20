package cgg.techproj.entities;

public class Like {

  private int pid;
  private int uid;
  private int id;

  public Like() {}

  public Like(int pid, int uid, int id) {
    this.pid = pid;
    this.uid = uid;
    this.id = id;
  }

  public int getPid() {
    return pid;
  }

  public void setPid(int pid) {
    this.pid = pid;
  }

  public int getUid() {
    return uid;
  }

  public void setUid(int uid) {
    this.uid = uid;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
}
