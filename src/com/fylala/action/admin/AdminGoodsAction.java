package com.fylala.action.admin;

import com.fylala.model.Catalog;
import com.fylala.model.Goods;
import com.fylala.service.ICatalogService;
import com.fylala.service.IGoodsService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminGoodsAction extends ActionSupport {
    private Map<String, Object> resMap;
    private IGoodsService goodsService;
    private ICatalogService catalogService;
    private Goods goods;
    private Integer goodsId;
    public String list() throws Exception {
        resMap = new HashMap<>();
        List<Goods> goods = goodsService.findAll();
        if (goods != null) {
            resMap.put("success", true);
            resMap.put("data", goods);
            resMap.put("msg", "查询成功");

        } else {
            resMap.put("success", false);
            resMap.put("msg", "无数据");
        }
        return "success";
    }
    public String insert() throws Exception {
        resMap = new HashMap<>();
        if (goodsService.insert(goods)) {
            resMap.put("success", true);
            resMap.put("msg", "添加成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "添加失败");
        }
        return "success";
    }
    public String find() throws Exception {
        return "success";
    }
    public String update() throws Exception {
        resMap = new HashMap<>();
        if (goodsService.update(goods)) {
            resMap.put("success", true);
            resMap.put("msg", "更新成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "更新失败");
        }
        return "success";
    }
    public String del() throws Exception {
        resMap = new HashMap<>();
        if (goodsService.delete(goodsId)) {
            resMap.put("success", true);
            resMap.put("msg", "删除成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "删除失败");
        }
        return "success";
    }
    public Map<String, Object> getResMap() {
        return resMap;
    }

    public void setResMap(Map<String, Object> resMap) {
        this.resMap = resMap;
    }

    public IGoodsService getGoodsService() {
        return goodsService;
    }

    public void setGoodsService(IGoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setCatalogService(ICatalogService catalogService) {
        this.catalogService = catalogService;
    }

    public ICatalogService getCatalogService() {
        return catalogService;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
}
