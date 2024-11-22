package org.example.restman.model;

import java.util.Date;

public class TKMonAn265 extends MonAn265{
    private float tongdoanhthu;
    private Date ngaybatdau;
    private Date ngayketthuc;

    public TKMonAn265() {
        super();
    }

    public Date getNgayketthuc() {
        return ngayketthuc;
    }

    public void setNgayketthuc(Date ngayketthuc) {
        this.ngayketthuc = ngayketthuc;
    }

    public Date getNgaybatdau() {
        return ngaybatdau;
    }

    public void setNgaybatdau(Date ngaybatdau) {
        this.ngaybatdau = ngaybatdau;
    }

    public float getTongdoanhthu() {
        return tongdoanhthu;
    }

    public void setTongdoanhthu(float tongdoanhthu) {
        this.tongdoanhthu = tongdoanhthu;
    }
}