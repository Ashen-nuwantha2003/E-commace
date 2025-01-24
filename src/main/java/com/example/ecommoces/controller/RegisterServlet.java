package com.example.ecommoces.controller;

import com.example.ecommoces.DAO.AccountDao;
import com.example.ecommoces.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private AccountDao accountDAO = new AccountDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (firstName == null || lastName == null || email == null ||
                phone == null || password == null || confirmPassword == null ||
                firstName.trim().isEmpty() || lastName.trim().isEmpty() ||
                email.trim().isEmpty() || phone.trim().isEmpty() ||
                password.trim().isEmpty() || confirmPassword.trim().isEmpty()) {

            req.setAttribute("error", "All fields are required");
            req.getRequestDispatcher("Signup.jsp").forward(req, resp);
            return;
        }
        if (accountDAO.isUsernameExists(firstName)) {
            req.setAttribute("error", "Username already exists");
            req.getRequestDispatcher("Signup.jsp").forward(req, resp);
            return;
        }
        Account account = new Account(firstName, lastName, email, phone, password, confirmPassword);

        // Attempt registration
        try {
            if (accountDAO.registerAccount(account)) {
                req.getSession().setAttribute("message", "Registration successful! Please login.");
                resp.sendRedirect("index.jsp");
            } else {
                req.setAttribute("error", "Registration failed. Please try again.");
                req.getRequestDispatcher("Signup.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    }


