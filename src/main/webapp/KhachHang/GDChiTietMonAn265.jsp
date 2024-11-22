<%@ page import="org.example.restman.model.MonAn265" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
    <title> REST MAN </title>
    <link rel="stylesheet" href="../Style/root.css">
</head>

<%
    MonAn265 monan = null;
    if(request.getParameter("idMonAn") != null) {
        int monAnId = Integer.parseInt(request.getParameter("idMonAn"));
        List<MonAn265> listMonAn = (List<MonAn265>) session.getAttribute("listMonAn");
        for (MonAn265 mon : listMonAn) {
            if (mon.getId() == monAnId) {
                monan = mon;
                break;
            }
        }
    }
%>

<body>
    <%if(monan!=null){%>
        <h1> Chi tiết món ăn </h1>
        <div>
            <h3> <span> Mã món ăn: </span> <%=monan.getId()%> </h3>
            <h3> <span> Tên món ăn: </span> <%=monan.getTen()%> </h3>
            <h3> <span> Mô tả: </span> <%=monan.getMota()%> </h3>
            <h3> <span> Giá: </span> <%=new DecimalFormat("#,###.0").format(monan.getGia())%> (VND)</h3>
        </div>
    <%}%>
</body>
</html>