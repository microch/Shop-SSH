package com.fylala.action;

import com.fylala.model.Catalog;
import com.fylala.model.Goods;
import com.fylala.service.ICatalogService;
import com.fylala.service.IGoodsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class GoodsAction extends ActionSupport {

    private ICatalogService catalogService;
    private IGoodsService goodsService;

    private int catalogId = 0;

    private Integer minPrice ;
    private Integer maxPrice ;
    private String searchValue;


    public String list() throws Exception {
        List<Catalog> catalogList = catalogService.findIsUse();
        Set<Goods> goodsList = null;
        Catalog catalog = null;
        for (Catalog ca : catalogList) {
            if (ca.getId() == catalogId) {
                goodsList = ca.getGoodsSet();
                catalog = ca;
                break;
            }
        }
        if (goodsList == null) {
            List<Goods> all = goodsService.findAllIsUse(searchValue, minPrice, maxPrice);
            goodsList = new HashSet<>();
            for (Goods goods : all) {
                goodsList.add(goods);
            }
            catalog = new Catalog();
            catalog.setId(0);
        }
        Iterator<Goods> iterator = goodsList.iterator();
        while (iterator.hasNext()) {
            Goods next = iterator.next();
            if (next.getStatus() != 0) {
                iterator.remove();
            }
        }
        ActionContext.getContext().put("goods", goodsList);
        ActionContext.getContext().put("catalogs", catalogList);
        ActionContext.getContext().put("catalog", catalog);
        if (searchValue != null && !"".equals(searchValue)) {
            ActionContext.getContext().put("searchValue", searchValue);
        }
        if (minPrice != null && minPrice >= 0) {
            ActionContext.getContext().put("minPrice", minPrice);
        }
        if (maxPrice != null && maxPrice > 0) {
            ActionContext.getContext().put("maxPrice", maxPrice);
        }
        return "success";
    }

    public void setCatalogService(ICatalogService catalogService) {
        this.catalogService = catalogService;
    }

    public ICatalogService getCatalogService() {
        return catalogService;
    }

    public void setCatalogId(int catalogId) {
        this.catalogId = catalogId;
    }

    public IGoodsService getGoodsService() {
        return goodsService;
    }

    public void setGoodsService(IGoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public int getCatalogId() {
        return catalogId;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

}
