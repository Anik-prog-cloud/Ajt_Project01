package userpack;

public class User {
    private int id;
    private String name, email, course, country;
    private double fee;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public double getFee() { return fee; }
    public void setFee(double fee) { this.fee = fee; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
}
