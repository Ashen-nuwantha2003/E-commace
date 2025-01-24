package com.example.ecommoces.model;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Account {
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
    private String confirmPassword;

}
