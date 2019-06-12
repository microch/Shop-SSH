package com.fylala.service.impl;

import com.fylala.dao.ICatalogDao;
import com.fylala.model.Catalog;
import com.fylala.service.ICatalogService;

import java.util.List;
import java.util.Map;

public class CatalogServiceImpl implements ICatalogService {

    private ICatalogDao catalogDao;

    @Override
    public boolean insert(Catalog catalog) {
        return catalogDao.insert(catalog);
    }

    @Override
    public boolean delete(int catalogId) {
        return catalogDao.delete(catalogId);
    }

    @Override
    public boolean update(Catalog catalog) {
        return catalogDao.update(catalog);
    }

    @Override
    public Catalog findById(int id) {
        return catalogDao.findById(id);
    }

    @Override
    public List<Catalog> findAll() {
        return catalogDao.findAll();
    }



    @Override
    public List<Catalog> findIsUse() {
        return catalogDao.findIsUse();
    }

    public void setCatalogDao(ICatalogDao catalogDao) {
        this.catalogDao = catalogDao;
    }

    public ICatalogDao getCatalogDao() {
        return catalogDao;
    }
}
