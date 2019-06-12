package com.fylala.dao;

import com.fylala.model.Orders;
import com.fylala.model.User;

import java.util.List;

public interface IOrderDao {

    List<Orders> findAll();

    List<Orders> findByUser(User user);

    boolean delete(Integer id);

    boolean insert(Orders orders);

    boolean update(Orders orders);

    List<Orders> findAllOrderByUser(User user);


    boolean send(Integer ordersId);
}
