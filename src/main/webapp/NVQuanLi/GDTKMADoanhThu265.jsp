<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.example.restman.model.TKMonAn265" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.restman.dao.TKMonAnDAO265" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat"%>
<html>
<head>
    <title> REST MAN </title>
    <link rel="stylesheet" href="../Style/root.css">
</head>
<%
    List<TKMonAn265> listTkMonAn = null;
    float tongTien = 0;
    if(request.getParameter("ngayBatDau")!=null && !request.getParameter("ngayBatDau").trim().isEmpty() && request.getParameter("ngayKetThuc")!=null && !request.getParameter("ngayKetThuc").trim().isEmpty()) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date ngayBatDau = sdf.parse(request.getParameter("ngayBatDau"));
        Date ngayKetThuc = sdf.parse(request.getParameter("ngayKetThuc"));
        session.setAttribute("ngayBatDau", ngayBatDau);
        session.setAttribute("ngayKetThuc", ngayKetThuc);
        listTkMonAn = new TKMonAnDAO265().getTKMADoanhThu(ngayBatDau, ngayKetThuc);
        tongTien = 0;
        for(TKMonAn265 tkMonAn : listTkMonAn) {
            tongTien += tkMonAn.getTongdoanhthu();
        }
    }
%>

<body>
    <h1>
        Thống kê món ăn theo doanh thu
        <%=(request.getParameter("ngayBatDau")!=null&&!request.getParameter("ngayBatDau").trim().isEmpty()&&request.getParameter("ngayKetThuc")!=null&&!request.getParameter("ngayKetThuc").trim().isEmpty())?"từ ngày " + request.getParameter("ngayBatDau") + " đến ngày " + request.getParameter("ngayKetThuc"):""%>
    </h1>
    <div class="form-group">
        <label>Ngày bắt đầu</label>
        <input type="date" id="ngayBatDau" placeholder="VD: 01/11/2024" value="<%=request.getParameter("ngayBatDau")!=null&&!request.getParameter("ngayBatDau").trim().isEmpty()?request.getParameter("ngayBatDau"):""%>" />
    </div>
    <div class="form-group">
        <label> Ngày kết thúc </label>
        <input type="date" id="ngayKetThuc" placeholder="VD: 30/11/2024" value="<%=request.getParameter("ngayKetThuc")!=null&&!request.getParameter("ngayKetThuc").trim().isEmpty()?request.getParameter("ngayKetThuc"):""%>" />
    </div>
    <button onclick="handleStatistic()"> Thống kê </button>

    <% if(listTkMonAn != null){
        if(listTkMonAn.size() > 0){
    %>
     <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã món ăn</th>
            <th>Tên món ăn</th>
            <th>Tổng doanh thu (VND)</th>
        </tr>
        </thead>
        <tbody>
        <% for(int i=0; i<listTkMonAn.size();i++){
            Object DecimalFormat;%>
            <tr onclick="window.location.href='GDLanGoiMon265.jsp?idMonAn=<%=listTkMonAn.get(i).getId()%>&tenMonAn=<%=listTkMonAn.get(i).getTen()%>'">
                <td style="text-align: center"> <%=i+1%></td>
                <td style="text-align: center"> <%=listTkMonAn.get(i).getId()%> </td>
                <td> <%=listTkMonAn.get(i).getTen()%> </td>
                <td style="text-align: center"> <%= new DecimalFormat("#,###.0").format(listTkMonAn.get(i).getTongdoanhthu())%> </td>
            </tr>
        <% } %>
            <tr class="row-total">
                <td> </td>
                <td> </td>
                <td style="text-align: center"> Tổng </td>
                <td style="text-align: center"> <%= new DecimalFormat("#,###.0").format(tongTien)%> </td>
            </tr>
        </tbody>
     </table>
    <%} else{%>
        <h1> Không có dữ liệu </h1>
    <%}}%>

    <script>
        const handleStatistic = () => {
            const ngayBatDau = document.querySelector("#ngayBatDau").value;
            const ngayKetThuc = document.querySelector("#ngayKetThuc").value;
            window.location.href = "GDTKMADoanhThu265.jsp?ngayBatDau=" + ngayBatDau + "&ngayKetThuc=" + ngayKetThuc;
        }
    </script>
</body>
</html>
