/*
package com.example.ecommoces.controller;

import com.example.ecommoces.DTO.ItemDTO;
import com.example.ecommoces.DTO.ViewCartDTO;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewCart", value = "/view-cart")
public class ViewCart extends HttpServlet {
    @Resource(name = "jdbc/Pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ViewCartDTO> cartItems = new ArrayList<>();

        HttpSession session = request.getSession(false); // false prevents creating a new session if it doesn't exist
        String username = (String) session.getAttribute("username");
        System.out.println(username+"username");
        int itemCode = 0;
        String user_id = null;
        int qty = 0;
        double unitPrice = 0.0;

        int user_id_cart = getUserName(user_id);

        try {
            Connection connection = dataSource.getConnection();
            String sql = "SELECT * FROM cart WHERE user_id = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(user_id_cart));

            statement.execute();
            ResultSet resultSet = statement.getResultSet();
            while (resultSet.next()) {
                itemCode = resultSet.getInt("item_code"); // Set itemCode here
                user_id = resultSet.getString("user_id");
                qty = resultSet.getInt("quantity");
                unitPrice = resultSet.getDouble("unit_price");

                System.out.println("code ek set una "+ itemCode+user_id+qty+unitPrice);

                List<ItemDTO> item = getItemFromDatabase(itemCode);
                for (ItemDTO itemDTO : item) {
                    ViewCartDTO cartItem = new ViewCartDTO();
                    cartItem.setItemCode(itemDTO.getItemCode());
                    cartItem.setItemName(itemDTO.getItemName());
                    cartItem.setCategory(itemDTO.getCategory());
                    cartItem.setDescription(itemDTO.getDescription());
                    cartItem.setUnitPrice(itemDTO.getUnitPrice());
                    cartItem.setQtyOnHand(qty);
                    cartItem.setBrand(itemDTO.getBrand());
                    cartItem.setImagePath(itemDTO.getImagePath());
                    cartItem.setUserId(user_id);

                    cartItems.add(cartItem);
                }


            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        request.setAttribute("cartList", cartItems);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    private List<ItemDTO> getItemFromDatabase(int itemCode) {
        System.out.println("get item call");
        List<ItemDTO> itemList = new ArrayList<>();
        String sql = "SELECT * FROM item WHERE item_code = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, itemCode);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    ItemDTO cartItem = new ItemDTO();
                    cartItem.setItemCode(resultSet.getInt("item_code"));
                    cartItem.setItemName(resultSet.getString("item_name"));
                    cartItem.setCategory(resultSet.getString("category"));
                    cartItem.setDescription(resultSet.getString("description"));
                    cartItem.setUnitPrice(resultSet.getDouble("unit_price"));
                    cartItem.setQtyOnHand(resultSet.getInt("qty_on_hand"));
                    cartItem.setBrand(resultSet.getString("brand"));
                    cartItem.setImagePath(resultSet.getString("image_path"));
                    itemList.add(cartItem);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching item from database", e);
        }

        return itemList;
    }
    private String getUserName(String user) {
        System.out.println("get Userna"+user);
        String user_name = null;
        try {
            Connection connection = dataSource.getConnection();
            String sql = "SELECT user_name FROM account WHERE user_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, user);
            statement.execute();
            ResultSet resultSet = statement.getResultSet();
            while (resultSet.next()) {
                user_id = resultSet.getString("username");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user_id;

    }

}
*/
