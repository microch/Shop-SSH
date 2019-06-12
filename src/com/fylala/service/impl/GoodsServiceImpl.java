package com.fylala.service.impl;

import com.fylala.dao.IGoodsDao;
import com.fylala.model.Goods;
import com.fylala.service.IGoodsService;

import java.util.List;

public class GoodsServiceImpl implements IGoodsService {

    private IGoodsDao goodsDao;

    @Override
    public boolean insert(Goods goods) {
        return goodsDao.insert(goods);
    }

    @Override
    public boolean delete(int id) {
        return goodsDao.delete(id);
    }

    @Override
    public boolean update(Goods goods) {
        return goodsDao.update(goods);
    }

    @Override
    public Goods findById(int id) {
        return goodsDao.findById(id);
    }

    @Override
    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    @Override
    public List<Goods> findAll(String value,Integer min,Integer max) {
        return goodsDao.findAll(value,min,max);
    }

    @Override
    public List<Goods> findAllIsUse(String value, Integer min, Integer max) {
        return goodsDao.findAllIsUse(value, min, max);
    }

    public void setGoodsDao(IGoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    public IGoodsDao getGoodsDao() {
        return goodsDao;
    }
}
