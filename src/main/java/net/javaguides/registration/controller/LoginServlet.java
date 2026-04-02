package net.javaguides.registration.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

//@WebServlet("/login") 


public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/students";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "asdf";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ FIXED: was "username", must match Login.jsp input name="userName"
        String username = request.getParameter("userName");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                String sql = "SELECT * FROM student WHERE `user name`=? AND `password`=?";
                try (PreparedStatement pst = con.prepareStatement(sql)) {
                    pst.setString(1, username);
                    pst.setString(2, password);

                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        // ✅ FIXED: column names use spaces as in your actual DB table
                        session.setAttribute("roll_no",    rs.getInt("roll no"));
                        session.setAttribute("first_name", rs.getString("first name"));
                        session.setAttribute("last_name",  rs.getString("last name"));
                        session.setAttribute("user_name",  rs.getString("user name"));
                        session.setAttribute("address",    rs.getString("address"));
                        session.setAttribute("contact",    rs.getLong("contact"));

                        request.getRequestDispatcher("/WEB-INF/views/profile.jsp")
                               .forward(request, response);

                    } else {
                        request.setAttribute("errorMessage", "Invalid username or password");
                        request.getRequestDispatcher("/WEB-INF/views/Login.jsp")
                               .forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
