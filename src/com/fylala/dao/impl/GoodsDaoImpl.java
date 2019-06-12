package com.fylala.dao.impl;

import com.fylala.dao.BaseDao;
import com.fylala.dao.IGoodsDao;
import com.fylala.model.Catalog;
import com.fylala.model.Goods;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class GoodsDaoImpl extends BaseDao implements IGoodsDao {
    @Override
    public boolean insert(Goods goods) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();

//            Catalog catalog = (Catalog) session.load(Catalog.class, goods.getCatalog().getId());
//            goods.setCatalog(catalog);
            session.save(goods);
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
    public boolean delete(int id) {
        boolean res = false;
        Session session = getSession();
        try {
            session.beginTransaction();
            Goods goods = (Goods) session.load(Goods.class, id);
            session.delete(goods);
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
    public boolean update(Goods goods) {
        boolean res = false;
        Session session = getSession();
        session.beginTransaction();
        try {
//            Catalog catalog = (Catalog) session.load(Catalog.class, goods.getCatalog().getId());
//            goods.setCatalog(catalog);
            session.update(goods);
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
    public Goods findById(int id) {
        Goods goods = null;
        Session session = getSession();
        Query query = session.createQuery("from Goods where id = ?");
        query.setParameter(0, id);
        query.setMaxResults(1);
        List<Goods> list = query.list();
        if (list != null && list.size() > 0) {
            goods = list.get(0);
        }
        session.close();
        return goods;
    }

    @Override
    public List<Goods> findAll() {
        Session session = getSession();
        Query query = session.createQuery("from Goods");
        List<Goods> list = query.list();
        session.close();
        return list;
    }

    @Override
    public List<Goods> findAll(String value, Integer min, Integer max) {
        Session session = getSession();

        Criteria criteria = session.createCriteria(Goods.class);
        if (value != null && !"".equals(value)) {
            criteria.add(Restrictions.like("name", "%"+value+"%"));
        }
        if (min != null && min >= 0) {
            criteria.add(Restrictions.gt("price", min));
        }
        if (max != null && max > 0) {
            criteria.add(Restrictions.lt("price", max));
        }
        List list = criteria.list();
        session.close();
        return list;
    }

    @Override
    public List<Goods> findAllIsUse(String value, Integer min, Integer max) {
        Session session = getSession();
        Criteria criteria = session.createCriteria(Goods.class);
        criteria.add(Restrictions.eq("status", 0));
        if (value != null && !"".equals(value)) {
            criteria.add(Restrictions.like("name", "%"+value+"%"));
        }
        if (min != null && min >= 0) {
            criteria.add(Restrictions.gt("price", min));
        }
        if (max != null && max > 0) {
            criteria.add(Restrictions.lt("price", max));
        }
        List list = criteria.list();
        session.close();
        return list;
    }
}
