package com.fylala.action.admin;

import com.fylala.model.User;
import com.fylala.service.ICatalogService;
import com.fylala.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminUserAction extends ActionSupport {
    private Map<String, Object> resMap;
    private User user;
    private Integer userId;
    private Integer page = 1;
    private IUserService userService;
    public String login() throws Exception {
        User login = userService.login(user);
        return login != null ? SUCCESS : ERROR;
    }
    public String list() throws Exception {
        if (page == null) {
            page =1;
        }
        List<User> users = userService.listUserByPage(page);
        int userCount = userService.userCount();
        ActionContext.getContext().put("users", users);
        ActionContext.getContext().put("currentPage", page);
        ActionContext.getContext().put("totalPage", (int) Math.ceil(userCount / (float) 10));
        return "success";
    }
    public String insert() throws Exception {
        resMap = new HashMap<>();
        User resign = userService.resign(user);
        if (resign != null) {
            resMap.put("success", true);
            resMap.put("msg", "用户添加成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "用户添加失败");
        }
        return SUCCESS;
    }
    public String find() throws Exception {
        resMap = new HashMap<>();
        if (userId != null) {
            User userById = userService.findUserById(userId);
            if (userById != null) {
                resMap.put("success", true);
                resMap.put("msg", "查询成功");
                resMap.put("data", userById);
            } else {
                resMap.put("success", false);
                resMap.put("msg", "查无此人");
            }

        } else {
            resMap.put("success", false);
            resMap.put("msg", "参数错误");
        }
        return "success";
    }

    public String updateUser() throws Exception {
        resMap = new HashMap<>();
        if (userService.updateUser(user)) {
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
        if (userService.delete(userId)) {
            resMap.put("success", true);
            resMap.put("msg", "删除成功");
        } else {
            resMap.put("success", false);
            resMap.put("msg", "删除失败");
        }
        return "success";
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IUserService getUserService() {
        return userService;
    }

    public void setResMap(Map<String, Object> resMap) {
        this.resMap = resMap;
    }

    public Map<String, Object> getResMap() {
        return resMap;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPage() {
        return page;
    }

}
