package org.example.restman.dao;

import org.example.restman.model.*;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HoaDonDAO265 extends DAO265 {
    public HoaDonDAO265(){
        super();
    }

    public List<HoaDon265> getHoaDon(int id, Date ngaybatdau, Date ngayketthuc){
        List<HoaDon265> listHoaDon = new ArrayList<>();
        String sql = "call LanGoiMon(?, ?, ?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, sdf.format(ngaybatdau));
            cs.setString(3, sdf.format(ngayketthuc));
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                float tongTien = 0;
                // gọi lớp Hóa đơn
                HoaDon265 hoaDon = new HoaDon265();
                hoaDon.setId(rs.getInt("IdHoaDon"));
                hoaDon.setNgaytao(rs.getDate("Ngaytao"));

                // gọi lớp Đơn hàng
                DonHang265 donHang = new DonHang265();
                donHang.setId(rs.getInt("IdDonHang"));
                donHang.setNgaydat(rs.getDate("Ngaydat"));
                donHang.setGhichu(rs.getString("Ghichu"));

                // gọi lớp Nhân viên bán hàng
                NVBanHang265 nvBanHang = new NVBanHang265();
                nvBanHang.setTen(rs.getString("TenNVBanHang"));

                // gọi lớp Khách hàng
                KhachHang265 khachHang = new KhachHang265();
                khachHang.setTen(rs.getString("TenKhachHang"));
                donHang.setKhachhang(khachHang);

                // lấy các bàn đặt có trong đơn hàng
                CallableStatement csBanDat = conn.prepareCall("call BanDat(?)");
                csBanDat.setInt(1, donHang.getId());
                ResultSet rsBanDat = csBanDat.executeQuery();
                List<BanDat265> listBanDat = new ArrayList<>();
                while (rsBanDat.next()) {
                    // gọi lớp Bàn đặt
                    BanDat265 banDat = new BanDat265();
                    banDat.setId(rsBanDat.getInt("IdBanDat"));

                    // gọi lớp Bàn
                    Ban265 ban = new Ban265();
                    ban.setId(rsBanDat.getInt("IdBan"));
                    ban.setSoghe(rsBanDat.getInt("SoGhe"));

                    banDat.setBan(ban);
                    listBanDat.add(banDat);
                }
                donHang.setBandat(listBanDat);

                // lấy các món đặt có trong đơn hàng
                CallableStatement csMonDat = conn.prepareCall("call MonDat(?)");
                csMonDat.setInt(1, donHang.getId());
                ResultSet rsMonDat = csMonDat.executeQuery();
                List<MonDat265> listMonDat = new ArrayList<>();
                while (rsMonDat.next()){
                    // gọi lớp Món đặt
                    MonDat265 monDat = new MonDat265();
                    monDat.setId(rsMonDat.getInt("IdMonDat"));
                    monDat.setSoluong(rsMonDat.getInt("SoLuong"));

                    // gọi lớp Món ăn
                    MonAn265 monAn = new MonAn265();
                    monAn.setId(rsMonDat.getInt("IdMonAn"));
                    monAn.setTen(rsMonDat.getString("TenMonAn"));
                    monAn.setGia(rsMonDat.getFloat("GiaMonAn"));

                    tongTien += monAn.getGia() * monDat.getSoluong();
                    monDat.setMonan(monAn);
                    listMonDat.add(monDat);
                }
                donHang.setMondat(listMonDat);

                // lấy các combo đặt có trong đơn hàng
                CallableStatement csCombo = conn.prepareCall("call ComboDat(?)");
                csCombo.setInt(1, donHang.getId());
                ResultSet rsCombo = csCombo.executeQuery();
                List<ComboDat265> listComboDat = new ArrayList<>();
                while (rsCombo.next()) {
                    // gọi lớp Combo đặt
                    ComboDat265 comboDat = new ComboDat265();
                    comboDat.setId(rsCombo.getInt("IdComboDat"));
                    comboDat.setSoluong(rsCombo.getInt("Soluong"));

                    // gọi lớp Combo
                    Combo265 combo = new Combo265();
                    combo.setId(rsCombo.getInt("IdCombo"));
                    combo.setTen(rsCombo.getString("TenCombo"));

                    // lấy Chi tiết combo
                    float giaCombo = 0;
                    CallableStatement csCTCombo = conn.prepareCall("call ChiTietCombo(?)");
                    csCTCombo.setInt(1, combo.getId());
                    ResultSet rsCTCombo = csCTCombo.executeQuery();
                    List<ChiTietCombo265> listCTCombo = new ArrayList<>();
                    while (rsCTCombo.next()) {
                        // gọi lớp Chi tiết combo
                        ChiTietCombo265 chiTietCombo = new ChiTietCombo265();
                        chiTietCombo.setId(rsCTCombo.getInt("idCTCombo"));
                        chiTietCombo.setSoluong(rsCTCombo.getInt("Soluong"));
                        chiTietCombo.setGia(rsCTCombo.getFloat("Gia"));

                        // gọi lớp Món ăn
                        MonAn265 monAn = new MonAn265();
                        monAn.setId(rsCTCombo.getInt("IdMonAn"));
                        monAn.setTen(rsCTCombo.getString("TenMonAn"));

                        giaCombo += chiTietCombo.getSoluong() * chiTietCombo.getGia();
                        chiTietCombo.setMonan(monAn);
                        listCTCombo.add(chiTietCombo);
                    }
                    combo.setGia(giaCombo);
                    combo.setChiTietCombo(listCTCombo);

                    tongTien += comboDat.getSoluong() * combo.getGia();
                    comboDat.setCombo(combo);
                    listComboDat.add(comboDat);
                }
                donHang.setCombodat(listComboDat);

                hoaDon.setNvbanhang(nvBanHang);
                hoaDon.setDonhang(donHang);
                hoaDon.setTongtien(tongTien);
                listHoaDon.add(hoaDon);
            }
            listHoaDon.sort((x,y)->{
                return (int) (y.getTongtien() - x.getTongtien());
            });
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return listHoaDon;
    }
}