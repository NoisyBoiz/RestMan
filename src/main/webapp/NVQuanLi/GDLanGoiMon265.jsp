<%@ page import="org.example.restman.model.HoaDon265" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.example.restman.dao.HoaDonDAO265" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat"%>
<html>
<head>
    <title> REST MAN </title>
    <link rel="stylesheet" href="../Style/root.css">
</head>
<%
    Date ngayBatDau = (Date) session.getAttribute("ngayBatDau");
    Date ngayKetThuc = (Date) session.getAttribute("ngayKetThuc");
    List<HoaDon265> listHoaDon = null;
    float tongTien = 0;
    if(request.getParameter("idMonAn") != null){
        int idMonAn = Integer.parseInt(request.getParameter("idMonAn"));
        listHoaDon = new HoaDonDAO265().getHoaDon(idMonAn, ngayBatDau, ngayKetThuc);
        session.setAttribute("listHoaDon", listHoaDon);
        tongTien = 0;
        for(HoaDon265 hoaDon : listHoaDon) {
            tongTien += hoaDon.getTongtien();
        }
    }
%>
<body>
    <h1><%="Lần gọi " + request.getParameter("tenMonAn") + " từ ngày " + new SimpleDateFormat("yyyy-MM-dd").format(ngayBatDau) + " đến ngày " + new SimpleDateFormat("yyyy-MM-dd").format(ngayKetThuc)%></h1>
    <% if(listHoaDon!=null) {%>
        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã hóa đơn</th>
                <th>Ngày tạo</th>
                <th>Tổng tiền (VND)</th>
            </tr>
            </thead>
            <tbody>
            <% for(int i=0;i<listHoaDon.size();i++){ %>
                <tr onclick="window.location.href='GDChiTietHoaDon265.jsp?idHoaDon='+<%=listHoaDon.get(i).getId()%>">
                    <td style="text-align: center"> <%=i+1%></td>
                    <td style="text-align: center"> <%=listHoaDon.get(i).getId()%> </td>
                    <td style="text-align: center"> <%=listHoaDon.get(i).getNgaytao()%> </td>
                    <td style="text-align: center"> <%=new DecimalFormat("#,###.0").format(listHoaDon.get(i).getTongtien())%> </td>
                </tr>
            <% } %>
            <tr class="row-total">
                <td> </td>
                <td> </td>
                <td style="text-align: center"> Tổng </td>
                <td style="text-align: center"> <%=new DecimalFormat("#,###.0").format(tongTien)%> </td>
            </tr>
            </tbody>
        </table>
    <%}%>
</body>
</html>
