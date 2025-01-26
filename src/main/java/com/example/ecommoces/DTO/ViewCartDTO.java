package com.example.ecommoces.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ViewCartDTO {
    private int itemCode;
    private String itemName;
    private String category;
    private String description;
    private double unitPrice;
    private int qtyOnHand;
    private String brand;
    private String imagePath;
    private String userId;
}
