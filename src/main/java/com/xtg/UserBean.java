package com.xtg;

public class UserBean {
    private String fullName;
    private String userName;
    private String email;
    private String password;
    private String gender;
    private String status;
    private String message;

    // Getters and Setters
    public String getFullName()   { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getUserName()   { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getEmail()      { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword()   { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getGender()     { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getStatus()     { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getMessage()    { return message; }
    public void setMessage(String message) { this.message = message; }
}