package com.example.ecommoces.controller;

import com.example.ecommoces.DAO.AccountDao;
import com.example.ecommoces.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private AccountDao accountDAO = new AccountDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        // Input validation
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            // Attempt login
            Account account = accountDAO.login(email, password);

            if (account != null) {
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("email", account.getEmail());

                // Remember me logic
                if ("on".equals(rememberMe)) {
                    session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 days
                } else {
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                }

                // Admin redirection
                if ("Admin123@gmail.com".equalsIgnoreCase(account.getEmail())) { // Case-insensitive comparison
                    response.sendRedirect("AdminPanel.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log exception for debugging
            request.setAttribute("error", "Login failed due to a system error.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}