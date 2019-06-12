package com.fylala.service.impl;

import com.fylala.dao.IUserDao;
import com.fylala.model.User;
import com.fylala.service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {

    private IUserDao userDao;
    @Override
    public User resign(User user) {
        return userDao.resign(user);
    }

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public boolean delete(Integer userid) {
        return userDao.delete(userid);
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public List<User> listUserByPage(int page) {
        return userDao.listUserByPage(page);
    }

    @Override
    public int userCount() {
        return userDao.userCount();
    }

    @Override
    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }
    public IUserDao getUserDao() {
        return userDao;
    }
}
