package cgg.techproj.entities;

import java.util.Date;

public class User {

  private int id;
  private String name;
  private String email;
  private String password;
  private String gender;
  private Date rDate;
  private String about;
  private String profile;

  public String getProfile() {
    return profile;
  }

  public void setProfile(String profile) {
    this.profile = profile;
  }

  public User() {}

  public User(
    String name,
    String email,
    String password,
    String gender,
    String about
  ) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.gender = gender;
    // this.rDate = rDate;
    this.about = about;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public Date getrDate() {
    return rDate;
  }

  public void setrDate(Date rDate) {
    this.rDate = rDate;
  }

  public String getAbout() {
    return about;
  }

  public void setAbout(String about) {
    this.about = about;
  }
}
