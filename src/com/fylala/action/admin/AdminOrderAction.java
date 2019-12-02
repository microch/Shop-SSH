package com.fylala.action.admin;

import com.fylala.model.Orders;
import com.fylala.service.IOrderService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminOrderAction extends ActionSupport {

    private Map<String, Object> resMap;
    private IOrderService orderService;
    private Orders orders;
    private Integer ordersId;
    public String list() throws Exception {
        resMap = new HashMap<>();

        List<Orders> orders = orderService.findAll();
        if (orders != null) {
            resMap.put("success", true);
            resMap.put("data", orders);
            resMap.put("msg", "查询成功");

        } else {
            resMap.put("success", false);
            resMap.put("msg", "无数据");
        }
        return "success";
    }
    public String insert() throws Exception {
        resMap = new HashMap<>();
        if (orderService.insert(orders)) {
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
        if (orderService.update(orders)) {
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
        if (orderService.delete(ordersId)) {
            resMap.put("success", true);
            resMap.put("msg", "删除成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "删除失败");
        }
        return "success";
    }
    public String send() throws Exception {
        resMap = new HashMap<>();
        if (orderService.send(ordersId)) {
            resMap.put("success", true);
            resMap.put("msg", "发货成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "发货失败");
        }
        return "success";
    }

    public Map<String, Object> getResMap() {
        return resMap;
    }

    public void setResMap(Map<String, Object> resMap) {
        this.resMap = resMap;
    }

    public IOrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(IOrderService orderService) {
        this.orderService = orderService;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public void setOrdersId(Integer ordersId) {
        this.ordersId = ordersId;
    }

    public Integer getOrdersId() {
        return ordersId;
    }

}
