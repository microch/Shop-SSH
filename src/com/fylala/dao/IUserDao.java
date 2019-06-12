package com.fylala.dao;

import com.fylala.model.User;

import java.util.List;

public interface IUserDao {

    User resign(User user);

    User login(User user);

    boolean delete(Integer userid);

    List<User> findAllUser();

    User findUserById(int id);

    boolean updateUser(User user);

    List<User> listUserByPage(int page);

    int userCount();

}
