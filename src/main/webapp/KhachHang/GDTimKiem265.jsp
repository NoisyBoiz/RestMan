<%@ page import="org.example.restman.model.MonAn265" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.restman.dao.MonAnDAO265" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
    <title> REST MAN </title>
    <link rel="stylesheet" href="../Style/root.css">
</head>

<%
    List<MonAn265> listMonAn = null;
    if (request.getParameter("name") != null && !request.getParameter("name").trim().isEmpty()) {
        String name = request.getParameter("name");
        listMonAn = new MonAnDAO265().getMonAnTheoTen(name);
        session.setAttribute("listMonAn", listMonAn);
    }
%>

<body>
    <h1> Tìm kiếm <%=(request.getParameter("name")!=null && !request.getParameter("name").trim().isEmpty())?request.getParameter("name"):""%></h1>

    <div class="form-group">
        <label> Tên món ăn </label>
        <input type="text" id="name" placeholder="VD: cơm" value="<%=(request.getParameter("name")!=null && !request.getParameter("name").trim().isEmpty())?request.getParameter("name"):""%>"/>
    </div>
    <button onclick="handleSearch()"> Tìm </button>

    <% if(listMonAn != null){
        if(listMonAn.size() > 0){
    %>
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã món ăn</th>
                    <th>Tên món ăn</th>
                    <th>Giá (VND)</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i=0; i<listMonAn.size();i++){ %>
                    <tr onclick="window.location.href='GDChiTietMonAn265.jsp?idMonAn='+<%=listMonAn.get(i).getId()%>">
                        <td style="text-align: center"> <%=i+1%></td>
                        <td style="text-align: center"> <%=listMonAn.get(i).getId()%> </td>
                        <td> <%=listMonAn.get(i).getTen()%> </td>
                        <td style="text-align: center"> <%=new DecimalFormat("#,###.0").format(listMonAn.get(i).getGia())%> </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

    <%} else{%>
        <h1> Không tìm thấy dữ liệu </h1>
    <%}}%>

    <script>
        const handleSearch = () =>{
            let name =  document.querySelector("#name").value;
            window.location.href = "GDTimKiem265.jsp?name=" + name;
        }
    </script>
</body>
</html>

