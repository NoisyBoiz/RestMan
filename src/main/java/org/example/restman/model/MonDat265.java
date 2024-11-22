package org.example.restman.model;

public class MonDat265 {
    private int id;
    private int soluong;
    private int tblMonAn265id;
    private int tblDonHang265id;
    private MonAn265 monan;

    public MonDat265(){};

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getTblMonAn265id() {
        return tblMonAn265id;
    }

    public void setTblMonAn265id(int tblMonAn265id) {
        this.tblMonAn265id = tblMonAn265id;
    }

    public int getTblDonHang265id() {
        return tblDonHang265id;
    }

    public void setTblDonHang265id(int tblDonHang265id) {
        this.tblDonHang265id = tblDonHang265id;
    }

    public MonAn265 getMonan() {
        return monan;
    }

    public void setMonan(MonAn265 monan) {
        this.monan = monan;
    }
}