package com.fylala.dao;

import com.fylala.model.Catalog;

import java.util.List;
import java.util.Map;

public interface ICatalogDao {

    boolean insert(Catalog catalog);

    boolean delete(int catalogId);

    boolean update(Catalog catalog);

    Catalog findById(int id);

    List<Catalog> findAll();


    List<Catalog> findIsUse();

}
