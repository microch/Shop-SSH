package com.fylala.dao.impl;

import com.fylala.dao.BaseDao;
import com.fylala.dao.IOrderDao;
import com.fylala.model.Detail;
import com.fylala.model.Orders;
import com.fylala.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;
import java.util.Set;

public class OrderDaoImpl extends BaseDao implements IOrderDao {


    @Override
    public List<Orders> findAll() {

        Session session = getSession();
        Query query = session.createQuery("from Orders");
        List list = query.list();
        session.close();
        return list;
    }

    @Override
    public List<Orders> findByUser(User user) {
        Session session = getSession();
        Query query = session.createQuery("from Orders where uid = ?");
        query.setParameter(0, user.getId());
        return query.list();
    }

    @Override
    public boolean delete(Integer id) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            Orders orders = (Orders) session.load(Orders.class, id);
            session.delete(orders);
            session.getTransaction().commit();
            res = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        session.close();
        return res;
    }

    @Override
    public boolean send(Integer ordersId) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            Orders orders = (Orders) session.load(Orders.class, ordersId);
            orders.setStatus(1);
            session.update(orders);
            session.getTransaction().commit();
            res = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        session.close();
        return res;
    }

    @Override
    public boolean insert(Orders orders) {

        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();

            Set<Detail> detailSet = orders.getDetailSet();
//            for (Detail detail : detailSet) {
//                session.save(detail);
//            }
            session.save(orders);
            session.getTransaction().commit();
            res = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        session.close();
        return res;
    }

    @Override
    public boolean update(Orders orders) {
        return false;
    }

    @Override
    public List<Orders> findAllOrderByUser(User user) {
        return null;
    }
}
