package com.fylala.service;

import com.fylala.model.Goods;

import java.util.List;

public interface IGoodsService {
    boolean insert(Goods goods);

    boolean delete(int id);

    boolean update(Goods goods);

    Goods findById(int id);

    List<Goods> findAll();

    List<Goods> findAll(String value,Integer min,Integer max);

    List<Goods> findAllIsUse(String value, Integer min, Integer max);
}
