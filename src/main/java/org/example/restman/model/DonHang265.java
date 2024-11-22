package org.example.restman.model;

import java.util.Date;
import java.util.List;

public class DonHang265 {
    private int id;
    private Date ngaydat;
    private String ghichu;
    private KhachHang265 khachhang;
    private List<MonDat265> mondat;
    private List<ComboDat265> combodat;
    private List<BanDat265> bandat;

    public DonHang265() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaydat() {
        return ngaydat;
    }

    public void setNgaydat(Date ngaydat) {
        this.ngaydat = ngaydat;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public KhachHang265 getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(KhachHang265 khachhang) {
        this.khachhang = khachhang;
    }

    public List<MonDat265> getMondat() {
        return mondat;
    }

    public void setMondat(List<MonDat265> mondat) {
        this.mondat = mondat;
    }

    public List<ComboDat265> getCombodat() {
        return combodat;
    }

    public void setCombodat(List<ComboDat265> combodat) {
        this.combodat = combodat;
    }

    public List<BanDat265> getBandat() {
        return bandat;
    }

    public void setBandat(List<BanDat265> bandat) {
        this.bandat = bandat;
    }
}