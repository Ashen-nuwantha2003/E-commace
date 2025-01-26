package com.example.ecommoces.controller;

import com.example.ecommoces.DTO.ItemDTO;
import jakarta.annotation.Resource;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "ItemDisplayServlet", value = "/item-display")
public class ItemDisplayServlet extends HttpServlet {
    @Resource(name = "jdbc/Pool")
    private DataSource dataSource;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        String message = request.getParameter("message");
        System.out.println(message);
        List<ItemDTO> items = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM item WHERE category = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,message);


            ResultSet rs = statement.executeQuery();


            while (rs.next()) {
                ItemDTO item = new ItemDTO();
                item.setItemCode(rs.getInt("item_code"));
                item.setItemName(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                item.setDescription(rs.getString("description"));
                item.setUnitPrice(rs.getDouble("unit_price"));
                item.setQtyOnHand(rs.getInt("qty_on_hand"));
                item.setBrand(rs.getString("brand"));
                item.setImagePath(rs.getString("image_path"));
                items.add(item);
            }


            request.setAttribute("items", items);
            request.setAttribute("category", category);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Fruits.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database error: " + e.getMessage());
        }
    }
}