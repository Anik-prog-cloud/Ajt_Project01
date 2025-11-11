package userpack;

import java.sql.*;
import java.util.*;

public class UserDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                "root", ""
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    // CREATE (C)
    public static int save(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, course, fee, country) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getCourse());
            ps.setDouble(4, u.getFee());
            ps.setString(5, u.getCountry());

            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // READ ALL (R) - Matches viewusers.jsp
    public static List<User> getAllRecords() {
        List<User> list = new ArrayList<User>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setCourse(rs.getString("course"));
                u.setFee(rs.getDouble("fee"));
                u.setCountry(rs.getString("country"));
                list.add(u);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ SINGLE (R) - NEW METHOD for editform.jsp
    public static User getUserById(int id) {
        User u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setCourse(rs.getString("course"));
                u.setFee(rs.getDouble("fee"));
                u.setCountry(rs.getString("country"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    // UPDATE (U) - NEW METHOD for edituser.jsp
    public static int update(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            // Assuming your edituser.jsp only passes name, email, and country
            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET name=?, email=?, country=? WHERE id=?"
            );
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getCountry());
            ps.setInt(4, u.getId());

            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // DELETE (D) - NEW METHOD for deleteuser.jsp
    public static int delete(int id) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}