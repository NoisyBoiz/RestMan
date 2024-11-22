package org.example.restman.dao;

import org.example.restman.model.TKMonAn265;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TKMonAnDAO265 extends DAO265 {
    public TKMonAnDAO265(){
        super();
    }

    public List<TKMonAn265> getTKMADoanhThu(Date ngaybatdau, Date ngayketthuc){
        List<TKMonAn265> listTkmonan = new ArrayList();
        String sql = "call TKMonAnTheoDoanhThu(?, ?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, sdf.format(ngaybatdau));
            cs.setString(2, sdf.format(ngayketthuc));
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                TKMonAn265 tkMonAn265 = new TKMonAn265();
                tkMonAn265.setId(rs.getInt("IdMonAn"));
                tkMonAn265.setTen(rs.getString("TenMonAn"));
                tkMonAn265.setTongdoanhthu(rs.getFloat("TongDoanhThu"));
                listTkmonan.add(tkMonAn265);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return listTkmonan;
    }
}