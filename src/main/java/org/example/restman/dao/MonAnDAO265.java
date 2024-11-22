package org.example.restman.dao;

import org.example.restman.model.MonAn265;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MonAnDAO265 extends DAO265 {
    public MonAnDAO265(){
        super();
    }

    public List<MonAn265> getMonAnTheoTen(String name){
        List<MonAn265> listMonAn = new ArrayList<>();
        String sql = "Select * from tblmonan265 where ten like ?";
        try{
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, "%" + name + "%");
            ResultSet rs = cs.executeQuery();
            while(rs.next()) {
                MonAn265 m = new MonAn265();
                m.setId(rs.getInt("id"));
                m.setTen(rs.getString("ten"));
                m.setGia(rs.getFloat("gia"));
                m.setMota(rs.getString("mota"));
                listMonAn.add(m);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listMonAn;
    }
}