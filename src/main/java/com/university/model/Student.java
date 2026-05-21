package com.university.model;

public class Student {

    private int id;
    private String name;
    private String phone;
    private String email;
    private String password;
    private String aadhaar;
    private String department;

    private String photo;
    private String tenthMarksheet;
    private double tenthPercent;
    private String twelfthMarksheet;
    private double twelfthPercent;
    private String domicile;

    // Getter & Setter

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getAadhaar() { return aadhaar; }
    public void setAadhaar(String aadhaar) { this.aadhaar = aadhaar; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }

    public String getTenthMarksheet() { return tenthMarksheet; }
    public void setTenthMarksheet(String tenthMarksheet) { this.tenthMarksheet = tenthMarksheet; }

    public double getTenthPercent() { return tenthPercent; }
    public void setTenthPercent(double tenthPercent) { this.tenthPercent = tenthPercent; }

    public String getTwelfthMarksheet() { return twelfthMarksheet; }
    public void setTwelfthMarksheet(String twelfthMarksheet) { this.twelfthMarksheet = twelfthMarksheet; }

    public double getTwelfthPercent() { return twelfthPercent; }
    public void setTwelfthPercent(double twelfthPercent) { this.twelfthPercent = twelfthPercent; }

    public String getDomicile() { return domicile; }
    public void setDomicile(String domicile) { this.domicile = domicile; }
}