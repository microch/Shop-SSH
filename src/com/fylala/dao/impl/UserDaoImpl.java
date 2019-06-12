package com.fylala.dao.impl;

import com.fylala.dao.BaseDao;
import com.fylala.dao.IUserDao;
import com.fylala.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UserDaoImpl extends BaseDao implements IUserDao {
    @Override
    public User resign(User user) {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(user);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
            return null;
        }
        session.close();
        return user;
    }

    @Override
    public User login(User user) {

        Session session = getSession();

        Query query = session.createQuery("from User where username = ? and password = ?");
        query.setParameter(0, user.getUsername());
        query.setParameter(1, user.getPassword());
        query.setMaxResults(1);
        List<User> userList = query.list();
        if (userList != null && userList.size() > 0) {
            return userList.get(0);
        }
        return null;
    }

    @Override
    public boolean delete(Integer userid) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            User user = (User) session.load(User.class, userid);
            session.delete(user);
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
    public List<User> findAllUser() {

        List<User> users = null;
        Session session = getSession();
        Query query = session.createQuery("from User");

        users = query.list();
        session.close();
        return users;
    }

    @Override
    public User findUserById(int id) {

        User user = null;
        Session session = getSession();
        Query query = session.createQuery("from User where id = ?");
        query.setParameter(0, id);
        query.setMaxResults(1);
        List<User> userList = query.list();
        if (userList != null && userList.size() > 0) {
            user = userList.get(0);
        }
        session.close();
        return user;
    }

    @Override
    public boolean updateUser(User user) {

        boolean res = false;
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(user);
            transaction.commit();
            res = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
        session.close();
        return res;
    }

    @Override
    public List<User> listUserByPage(int page) {
        List<User> users = null;
        Session session = getSession();
        Query query = session.createQuery("from User");
        query.setFirstResult((page - 1) * 10);
        query.setMaxResults(10);
        users = query.list();
        session.close();
        return users;
    }

    @Override
    public int userCount() {
        Session session = getSession();
        String hql = "select count(*)  from User ";
        Query query = session.createQuery(hql);
        int count = ((Long) query.iterate().next()).intValue();
        session.close();
        return count;
    }


//    @Override
//    public Usertable resign(Usertable usertable) {
//        Session session = getSession();
//        Transaction transaction = session.beginTransaction();
//        session.save(usertable);
//        transaction.commit();
//        session.close();
//        return usertable;
//    }
}
