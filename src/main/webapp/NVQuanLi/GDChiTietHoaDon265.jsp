<%@ page import="org.example.restman.model.HoaDon265" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat"%>

<html>
<head>
    <title> REST MAN </title>
    <link rel="stylesheet" href="../Style/root.css">
</head>
<%
    HoaDon265 hoaDon = null;
    if(request.getParameter("idHoaDon")!=null){
        int idHoaDon = Integer.parseInt(request.getParameter("idHoaDon"));
        List<HoaDon265> listHoaDon = (List<HoaDon265>) session.getAttribute("listHoaDon");
        for(HoaDon265 h:listHoaDon){
            if(h.getId() == idHoaDon){
                hoaDon = h;
                break;
            }
        }
    }
%>
<body>
    <h1> Chi tiết hóa đơn </h1>
    <div>
        <h3> <span> Mã hóa đơn: </span> <%=hoaDon.getId()%></h3>
        <h3> <span> Ngày tạo: </span> <%=hoaDon.getNgaytao()%></h3>
        <h3> <span> Nhân viên bán hàng: </span> <%=hoaDon.getNvbanhang().getTen()%></h3>
        <h3> <span> Khách hàng: </span> <%=hoaDon.getDonhang().getKhachhang().getTen()%></h3>
        <h3> <span> Ghi chú: </span> <%=hoaDon.getDonhang().getGhichu()%></h3>
    </div>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã bàn</th>
            <th>Số ghế</th>
        </tr>
        </thead>
        <tbody>
        <% for(int i=0;i<hoaDon.getDonhang().getBandat().size();i++){ %>
        <tr>
            <td style="text-align: center"> <%=i+1%> </td>
            <td style="text-align: center"> <%=hoaDon.getDonhang().getBandat().get(i).getBan().getId()%> </td>
            <td style="text-align: center"> <%=hoaDon.getDonhang().getBandat().get(i).getBan().getSoghe()%> </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên món ăn</th>
            <th>Số lượng</th>
            <th>Giá (VND)</th>
        </tr>
        </thead>
        <tbody>
            <% for(int i=0;i<hoaDon.getDonhang().getMondat().size();i++){ %>
            <tr>
                <td style="text-align: center"> <%=i+1%> </td>
                <td> <%=hoaDon.getDonhang().getMondat().get(i).getMonan().getTen()%> </td>
                <td style="text-align: center"> <%=hoaDon.getDonhang().getMondat().get(i).getSoluong()%> </td>
                <td style="text-align: center"> <%=new DecimalFormat("#,###.0").format(hoaDon.getDonhang().getMondat().get(i).getMonan().getGia())%> </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên combo</th>
            <th>Số lượng</th>
            <th>Giá (VND)</th>
        </tr>
        </thead>
        <tbody>
        <% for(int i=0; i<hoaDon.getDonhang().getCombodat().size();i++){ %>
            <tr class="row-combo">
                <td style="text-align: center"> <%=i+1%> </td>
                <td> <%=hoaDon.getDonhang().getCombodat().get(i).getCombo().getTen()%> </td>
                <td style="text-align: center"> <%=hoaDon.getDonhang().getCombodat().get(i).getSoluong()%> </td>
                <td style="text-align: center"> <%=hoaDon.getDonhang().getCombodat().get(i).getCombo().getGia()%> </td>
            </tr>
            <% for(int j=0;j<hoaDon.getDonhang().getCombodat().get(i).getCombo().getChiTietCombo().size();j++){ %>
            <tr class="row-ctCombo">
                <td> </td>
                <td> <%=hoaDon.getDonhang().getCombodat().get(i).getCombo().getChiTietCombo().get(j).getMonan().getTen()%> </td>
                <td style="text-align: center"> <%=hoaDon.getDonhang().getCombodat().get(i).getCombo().getChiTietCombo().get(j).getSoluong()%> </td>
                <td style="text-align: center"> <%=new DecimalFormat("#,###.0").format(hoaDon.getDonhang().getCombodat().get(i).getCombo().getChiTietCombo().get(j).getGia())%> </td>
            </tr>
            <% } %>
        <% } %>
        </tbody>
    </table>

    <h2> <span> Tổng tiền: </span> <%=new DecimalFormat("#,###.0").format(hoaDon.getTongtien())%> (VND)</h2>
</body>
</html>
