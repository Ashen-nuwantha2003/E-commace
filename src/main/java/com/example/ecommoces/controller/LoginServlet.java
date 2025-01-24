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

        // Validate input
        if (email == null || password == null ||
                email.trim().isEmpty() || password.trim().isEmpty()) {

            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }





        try {
            Account account = accountDAO.login(email, password);

            if (account != null) {
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("email", account.getEmail());
                session.setAttribute("password", account.getPassword());

                // Handle remember me
                if ("on".equals(rememberMe)) {
                    session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 days
                } else {
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                }

                if ("admin".equals(account.getEmail())) {
                    response.sendRedirect("AdminPanel.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }

                /*response.sendRedirect("index.jsp")*/;
            } else {
                request.setAttribute("error", "Invalid Email or password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Login failed. Please try again.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }


}
