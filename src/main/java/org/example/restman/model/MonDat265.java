package org.example.restman.model;

public class MonDat265 {
    private int id;
    private int soluong;
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

    public MonAn265 getMonan() {
        return monan;
    }

    public void setMonan(MonAn265 monan) {
        this.monan = monan;
    }
}