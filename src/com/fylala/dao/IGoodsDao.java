package com.fylala.dao;

import com.fylala.model.Catalog;
import com.fylala.model.Goods;

import java.util.List;
import java.util.Map;

public interface IGoodsDao {

    boolean insert(Goods goods);

    boolean delete(int catalogId);

    boolean update(Goods goods);

    Goods findById(int id);

    List<Goods> findAll();

    List<Goods> findAllIsUse(String value, Integer min, Integer max);

    List<Goods> findAll(String value, Integer min, Integer max);
}
