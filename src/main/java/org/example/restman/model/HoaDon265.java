package org.example.restman.model;

import java.util.Date;

public class HoaDon265 {
    private int id;
    private Date ngaytao;
    private float tongtien;
    private DonHang265 donhang;
    private NVBanHang265 nvbanhang;

    public HoaDon265() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public DonHang265 getDonhang() {
        return donhang;
    }

    public void setDonhang(DonHang265 donhang) {
        this.donhang = donhang;
    }

    public NVBanHang265 getNvbanhang() {
        return nvbanhang;
    }

    public void setNvbanhang(NVBanHang265 nvbanhang) {
        this.nvbanhang = nvbanhang;
    }
}