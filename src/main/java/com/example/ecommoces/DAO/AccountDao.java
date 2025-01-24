package com.example.ecommoces.DAO;


import com.example.ecommoces.model.Account;
import com.example.ecommoces.utill.DataBaseUtil;
import jakarta.annotation.Resource;


import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao {
    /*@Resource(name = "java:comp/env/jdbc/Pool")
    private  DataSource DataBaseUtil;
*/

    public boolean registerAccount(Account account) throws SQLException {
        String sql = "INSERT INTO accounts (first_name,last_name,email,phone,password,confirm_password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DataBaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, account.getFirstName());
            pstmt.setString(2, account.getLastName());
            pstmt.setString(3, account.getEmail());
            pstmt.setString(4, account.getPhone());
            pstmt.setString(5, account.getPassword());
            pstmt.setString(6, account.getConfirmPassword()); // In production, use password hashing

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isUsernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM accounts WHERE first_name = ?";

        try (Connection conn = DataBaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account login(String email, String password) throws SQLException {

        String sql = "SELECT * FROM accounts WHERE email = ? AND password = ?";

        try (Connection conn = DataBaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password); // In production, use password hashing

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Account account = new Account();
                account.setFirstName(rs.getString("firstname"));
                account.setLastName(rs.getString("lastname"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                // Don't set the password for security
                return account;
            }
        }

        return null;
    }
    public String checkAdmin(String name,String pw) throws SQLException {
        String sql = "SELECT * FROM accounts WHERE first_name = ? AND password = ?";

        try (Connection conn = DataBaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, pw); // In production, use password hashing

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getString("username").equals("admin") && rs.getString("password").equals("admin123")){
                    return "admin";
                }
            }
        }
        return null;

    }

    public void updateLastLogin(int userId) throws SQLException {
        String sql = "UPDATE accounts SET last_login = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DataBaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
        }
    }
}
