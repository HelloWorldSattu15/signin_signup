package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class AuthController {

    private final UserService service;

    public AuthController(UserService service) {
        this.service = service;
    }

    // ================= SIGNUP =================

    @PostMapping("/signup")
    public Map<String, Object> signup(@RequestBody User user) {

        Map<String, Object> response = new HashMap<>();

        try {

            // Debug check
            System.out.println("Name: " + user.getName());
            System.out.println("Email: " + user.getEmail());

            service.signup(user);

            response.put("success", true);
            response.put("message", "Signup successful");

        } catch (Exception e) {

            response.put("success", false);
            response.put("message", "Signup failed");

        }

        return response;
    }

    // ================= SIGNIN =================

    @PostMapping("/signin")
    public Map<String, Object> signin(@RequestBody User user) {

        Map<String, Object> response = new HashMap<>();

        User u = service.signin(user.getEmail(), user.getPassword());

        if (u != null) {

            response.put("success", true);
            response.put("message", "Login successful");

        } else {

            response.put("success", false);
            response.put("message", "Invalid email or password");

        }

        return response;
    }
}