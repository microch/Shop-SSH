package com.fylala.dao.impl;

import com.fylala.dao.BaseDao;
import com.fylala.dao.ICatalogDao;
import com.fylala.model.Catalog;
import com.fylala.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CatalogDaoImpl extends BaseDao implements ICatalogDao {
    @Override
    public boolean insert(Catalog catalog) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            session.save(catalog);
            session.getTransaction().commit();
            res = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.close();
        return res;
    }

    @Override
    public boolean delete(int catalogId) {

        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            Catalog catalog = (Catalog) session.load(Catalog.class, catalogId);
            session.delete(catalog);
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
    public boolean update(Catalog catalog) {
        boolean res = false;
        Session session = getSession();
        session.beginTransaction();
        try {
            session.update(catalog);
            session.getTransaction().commit();
            res = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.close();
        return res;
    }

    @Override
    public Catalog findById(int id) {

        Catalog catalog = null;
        Session session = getSession();
        Query query = session.createQuery("from Catalog where id = ?");
        query.setParameter(0, id);
        query.setMaxResults(1);
        List<Catalog> list = query.list();
        if (list != null && list.size() > 0) {
            catalog = list.get(0);
        }
        session.close();
        return catalog;
    }

    @Override
    public List<Catalog> findAll() {
        Session session = getSession();
        Query query = session.createQuery("from Catalog");
        List<Catalog> list = query.list();
        session.close();
        return list;
    }
    @Override
    public List<Catalog> findIsUse() {
        Session session = getSession();
//        Query query = session.createQuery("from Catalog  where status = ?");
//        query.setParameter(0, 0);
//        List<Catalog> list = query.list();

        Criteria criteria = session.createCriteria(Catalog.class);
        criteria.add(Restrictions.eq("status", 0));
        List list = criteria.list();
        session.close();
        return list;
    }
}
