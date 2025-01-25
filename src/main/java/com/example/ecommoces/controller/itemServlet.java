package com.example.ecommoces.controller;

import com.example.ecommoces.DTO.ItemDTO;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "/ItemServlet", value = "/items")
public class itemServlet extends HttpServlet {
    @Resource(name = "jdbc/Pool")
    private DataSource dataSource;
    private static final String UPLOAD_DIRECTORY = "uploads";
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 5;      // 5MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 10;  // 10MB


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ItemDTO> itemList = new ArrayList<>();
        String item_category = req.getParameter("item_category");

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * from item";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
/*
                preparedStatement.setString(1,item_category);
*/
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        ItemDTO item = new ItemDTO(
                                resultSet.getInt("item_code"),
                                resultSet.getString("item_name"),
                                resultSet.getString("category"),
                                resultSet.getString("description"),
                                resultSet.getDouble("unit_price"),
                                resultSet.getInt("qty_on_hand"),
                                resultSet.getString("brand"),
                                resultSet.getString("image_path")
                        );
                        itemList.add(item);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Unable to load user data.");
        }


        req.setAttribute("itemList", itemList);
        req.getRequestDispatcher("itemListview.jsp").forward(req, resp);
    }

}