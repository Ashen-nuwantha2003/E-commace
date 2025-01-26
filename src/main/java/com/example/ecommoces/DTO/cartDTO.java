package com.example.ecommoces.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class cartDTO {
    private int itemCode;
    private String userId;
    private int quantity;
    private double unitPrice;
}
