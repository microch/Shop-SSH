package com.fylala.service.impl;

import com.fylala.dao.IOrderDao;
import com.fylala.model.Orders;
import com.fylala.model.User;
import com.fylala.service.IOrderService;

import java.util.List;

public class OrderServiceImpl implements IOrderService {

    private IOrderDao orderDao;

    @Override
    public List<Orders> findAll() {
        return orderDao.findAll();
    }

    @Override
    public List<Orders> findByUser(User user) {
        return orderDao.findByUser(user);
    }

    @Override
    public boolean delete(Integer id) {
        return orderDao.delete(id);
    }

    @Override
    public boolean send(Integer ordersId) {
        return orderDao.send(ordersId);
    }

    @Override
    public boolean insert(Orders orders) {
        return orderDao.insert(orders);
    }

    @Override
    public boolean update(Orders orders) {
        return orderDao.update(orders);
    }

    @Override
    public List<Orders> findAllOrderByUser(User user) {
        return orderDao.findAllOrderByUser(user);
    }

    public void setOrderDao(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public IOrderDao getOrderDao() {
        return orderDao;
    }
}
