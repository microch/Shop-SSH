package com.fylala.model;

public class Cart {

    private int num;
    private Goods goods;

    public Cart() {
    }

    public Cart(int num, Goods goods) {
        this.num = num;
        this.goods = goods;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
