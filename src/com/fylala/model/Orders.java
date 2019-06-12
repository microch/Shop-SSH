package com.fylala.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Orders {
    private Integer id;
    private String ident;
    private int status;
    private String address;
    private Date createDate;
    private User user;
    private Set<Detail> detailSet = new HashSet<>();

    @Id
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 255)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Basic
    public Date getCreateDate() {
        return createDate;
    }

    public void setDetailSet(Set<Detail> detailSet) {
        this.detailSet = detailSet;
    }

    public Set<Detail> getDetailSet() {
        return detailSet;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Basic
    public User getUser() {
        return user;
    }


    public void setIdent(String ident) {
        this.ident = ident;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIdent() {
        return ident;
    }
}
