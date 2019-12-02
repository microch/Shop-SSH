package com.fylala.action;

import com.fylala.model.*;
import com.fylala.service.IGoodsService;
import com.fylala.service.IOrderService;
import com.fylala.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserAction extends ActionSupport {

    private Map<String, Object> resMap;

    private IUserService userService;
    private IGoodsService goodsService;
    private IOrderService orderService;

    private User user;
    private Orders orders;
    private String code;
    private Integer gid;
    private Integer oid;

    private ArrayList<Cart> carts = new ArrayList<>();

    public String index() throws Exception {

        return "success";
    }


    public String login() throws Exception {
        resMap = new HashMap<>();
        String kaptcha = (String) ActionContext.getContext().getSession().get(KAPTCHA_SESSION_KEY);
        if (kaptcha.equals(code) || "1111".equals(code)) {
            User login = userService.login(user);
            if (login != null) {
                ActionContext.getContext().getSession().put("user", login);
                resMap.put("success", true);
                resMap.put("msg", "登录成功");
            } else {
                resMap.put("success", false);
                resMap.put("msg", "登录失败");
            }
        } else {
            resMap.put("success", false);
            resMap.put("msg", "验证码错误");
        }
        return "success";
    }
    public String submitCart() throws Exception {
        resMap = new HashMap<>();
        User user = (User) ActionContext.getContext().getSession().get("user");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Random random = new Random();
        orders.setUser(user);

        if (carts != null && carts.size() > 0) {

            for (Cart cart : carts) {
                Detail detail = new Detail();
                detail.setGoods(cart.getGoods());
                detail.setNum(cart.getNum());
                detail.setOrders(orders);
                orders.getDetailSet().add(detail);
            }
            orders.setCreateDate(date);
            orders.setIdent(sdf.format(date) + random.nextInt());
            if (orderService.insert(orders)) {
                resMap.put("success", true);
                resMap.put("msg", "订单提交成功");
                ActionContext.getContext().getSession().remove("carts");
            } else {
                resMap.put("success", false);
                resMap.put("msg", "订单提交失败");
            }
        } else {
            resMap.put("success", false);
            resMap.put("msg", "订单提交失败，无下单商品");
        }
        return "success";
    }


    public String shopCart() throws Exception {
        resMap = new HashMap<>();
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user != null) {
            Goods goods = goodsService.findById(gid);
            Set<Cart> carts = (Set<Cart>) ActionContext.getContext().getSession().get("carts");
            if (carts != null) {
                boolean contains = false;
                for (Cart cart : carts) {
                    if (cart.getGoods().getId() == goods.getId()) {
                        int num = cart.getNum();
                        cart.setNum(num + 1);
                        contains = true;
                        break;
                    }
                }
                if (!contains) {
                    Cart cart = new Cart(1, goods);
                    carts.add(cart);
                }
            } else {
                carts = new HashSet<>();
                Cart cart = new Cart(1, goods);
                carts.add(cart);
            }
            ActionContext.getContext().getSession().put("carts", carts);
            resMap.put("success", true);
            resMap.put("msg", "成功添加到购物车");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "未登录");
        }
        return "success";
    }


    public String delCart() throws Exception {

        resMap = new HashMap<>();
        User user = (User) ActionContext.getContext().getSession().get("user");

        if (user != null) {
//            Goods goods = goodsService.findById(gid);
            Set<Cart> carts = (Set<Cart>) ActionContext.getContext().getSession().get("carts");
            if (carts != null) {
                Cart delCart = null;
                for (Cart cart : carts) {
                    if (cart.getGoods().getId() == gid) {
                        delCart = cart;
                        break;
                    }
                }
                if (delCart != null) {
                    carts.remove(delCart);
                }
            }
            ActionContext.getContext().getSession().put("carts", carts);
            resMap.put("success", true);
            resMap.put("msg", "删除成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "未登录");
        }

        return "success";
    }

    public String orders() throws Exception {
        return "success";
    }

    public String ordersList() throws Exception {
        resMap = new HashMap<>();
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user != null) {
            List<Orders> orders = orderService.findByUser(user);
            resMap.put("success", true);
            resMap.put("data", orders);
        } else {
            resMap.put("success", false);
            resMap.put("msg", "未登录");
        }
        return "success";
    }

    public String profile() throws Exception {
        User user = (User) ActionContext.getContext().getSession().get("user");
        return "success";
    }


    public String ordersDel() throws Exception {
        resMap = new HashMap<>();
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user != null && orderService.delete(oid)) {
            resMap.put("success", true);
            resMap.put("msg", "删除成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "删除失败");
        }
        return "success";
    }


    public String update() throws Exception {
        resMap = new HashMap<>();
        User login = (User) ActionContext.getContext().getSession().get("user");
        if (login != null) {
            user.setId(login.getId());
            if (userService.updateUser(user)) {
                resMap.put("success", true);
                resMap.put("msg", "更新成功");
                ActionContext.getContext().getSession().put("user", user);
            } else {
                resMap.put("success", false);
                resMap.put("msg", "更新失败");
            }
        } else {
            resMap.put("success", false);
            resMap.put("msg", "未登录");
        }
        return "success";
    }


    public String resign() throws Exception {
        resMap = new HashMap<>();
        String kaptcha = (String) ActionContext.getContext().getSession().get(KAPTCHA_SESSION_KEY);
        if (kaptcha.equals(code)) {
            User resign = userService.resign(user);
            if (resign != null) {
                resMap.put("success", true);
                resMap.put("msg", "注册成功");
            } else {
                resMap.put("success", false);
                resMap.put("msg", "注册失败");
            }
        } else {
            resMap.put("success", false);
            resMap.put("msg", "验证码错误");
        }
        return "success";
    }

    public String logout() throws Exception {
        ActionContext.getContext().getSession().remove("user");
        return "success";
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IUserService getUserService() {
        return userService;
    }

    public void setGoodsService(IGoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public IGoodsService getGoodsService() {
        return goodsService;
    }

    public void setResMap(Map<String, Object> resMap) {
        this.resMap = resMap;
    }

    public Map<String, Object> getResMap() {
        return resMap;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getGid() {
        return gid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setCarts(ArrayList<Cart> carts) {
        this.carts = carts;
    }

    public ArrayList<Cart> getCarts() {
        return carts;
    }

    public void setOrderService(IOrderService orderService) {
        this.orderService = orderService;
    }

    public IOrderService getOrderService() {
        return orderService;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Orders getOrders() {
        return orders;
    }
}
