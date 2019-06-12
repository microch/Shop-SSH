package com.fylala.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDao {
    private SessionFactory sessionFactory;
    public Session getSession() {
        return sessionFactory.openSession();
    }
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
