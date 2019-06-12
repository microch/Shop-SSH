package com.fylala.service;

import com.fylala.model.User;

import java.util.List;

public interface IUserService {
    User resign(User user);

    User login(User user);

    boolean delete(Integer userid);

    List<User> findAllUser();

    List<User> listUserByPage(int page);

    int userCount();

    User findUserById(int id);

    boolean updateUser(User user);


}
