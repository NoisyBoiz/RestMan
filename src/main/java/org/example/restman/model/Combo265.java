package org.example.restman.model;

import java.util.List;

public class Combo265 {
    private int id;
    private String ten;
    private String mota;
    private float gia;
    private List<ChiTietCombo265> ctCombo;

    public Combo265() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public List<ChiTietCombo265> getChiTietCombo() {
        return ctCombo;
    }

    public void setChiTietCombo(List<ChiTietCombo265> list) {
        this.ctCombo = list;
    }
}