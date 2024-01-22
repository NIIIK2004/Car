package com.example.dao;

import com.example.model.User;
import com.example.model.Role;
import java.util.Optional;

public interface UserDao {
    User save(User user, Role role);

    void delete(Long id);

    User findByUsername(String username);

    Optional<User> findById(Long id);
}
