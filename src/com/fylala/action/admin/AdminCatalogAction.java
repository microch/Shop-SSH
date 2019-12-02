package com.fylala.action.admin;

import com.fylala.model.Catalog;
import com.fylala.model.User;
import com.fylala.service.ICatalogService;
import com.fylala.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminCatalogAction extends ActionSupport {

    private Map<String, Object> resMap;
    private ICatalogService catalogService;
    private Catalog catalog;
    private Integer catalogId;
    public String list() throws Exception {
        resMap = new HashMap<>();
        List<Catalog> catalogs = catalogService.findAll();
        if (catalogs != null) {
            resMap.put("success", true);
            resMap.put("data", catalogs);
            resMap.put("msg", "查询成功");

        } else {
            resMap.put("success", false);
            resMap.put("msg", "无数据");
        }
        return "success";
    }
    public String insert() throws Exception {
        resMap = new HashMap<>();
        if (catalogService.insert(catalog)) {
            resMap.put("success", true);
            resMap.put("msg", "添加成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "添加失败");
        }
        return "success";
    }
    public String find() throws Exception {
        resMap = new HashMap<>();
        Catalog byId = catalogService.findById(catalogId);
        if (byId!=null) {
            resMap.put("success", true);
            resMap.put("data", byId);
        } else {
            resMap.put("success", false);
            resMap.put("msg", "错误");
        }
        return "success";
    }
    public String update() throws Exception {
        resMap = new HashMap<>();
        if (catalogService.update(catalog)) {
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
        if (catalogService.delete(catalogId)) {
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

    public ICatalogService getCatalogService() {
        return catalogService;
    }

    public void setCatalogService(ICatalogService catalogService) {
        this.catalogService = catalogService;
    }

    public Catalog getCatalog() {
        return catalog;
    }

    public void setCatalog(Catalog catalog) {
        this.catalog = catalog;
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }
}
