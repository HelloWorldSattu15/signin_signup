package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository repo;

    public User signup(User user){
        return repo.save(user);
    }

    public User signin(String email,String password){
        return repo.findByEmailAndPassword(email,password);
    }
}