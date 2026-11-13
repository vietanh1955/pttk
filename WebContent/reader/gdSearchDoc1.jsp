<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    String keyword = request.getParameter("txtKeyword");
    if (keyword == null) {
        keyword = "Giáo trình"; // Giá trị mặc định khi mới vào trang
    }
    ArrayList<Document1> listDoc = new ArrayList<Document1>();
    if (!keyword.trim().isEmpty()) {
        DocumentDAO1 docDAO = new DocumentDAO1();
        listDoc = docDAO.searchDocument(keyword.trim());
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm tài liệu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Bạn đọc</div>
    </div>

    <div class="container">
        <h2>TÌM KIẾM TÀI LIỆU</h2>
        
        <form action="gdSearchDoc1.jsp" method="get">
            <label for="txtKeyword" style="font-weight: 600;">Từ khóa:</label>
            <input type="text" id="txtKeyword" name="txtKeyword" size="50" value="<%= keyword %>" placeholder="Nhập tên tài liệu cần tìm..." style="flex: 1;" />
            <input type="submit" name="btnSearch" value="🔍 Tìm kiếm" />
            <input type="button" name="btnBack" class="btn-secondary" value="⬅ Quay lại" onclick="location.href='gdMainUser1.jsp'" />
        </form>

        <table id="tblDocument">
            <thead>
                <tr>
                    <th style="text-align: center;">TT</th>
                    <th style="text-align: center;">Mã TL</th>
                    <th>Tên tài liệu</th>
                    <th>Loại TL</th>
                    <th>Thể loại</th>
                    <th>Tác giả</th>
                    <th>NXB</th>
                    <th style="text-align: center;">Năm XB</th>
                    <th style="text-align: center;">Còn lại</th>
                    <th style="text-align: center;">Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listDoc != null && !listDoc.isEmpty()) {
                        int stt = 1;
                        for (Document1 doc : listDoc) {
                %>
                <tr>
                    <td style="text-align: center;"><%= stt++ %></td>
                    <td style="text-align: center; font-weight: 600;"><%= doc.getId() %></td>
                    <td style="font-weight: 500;"><%= doc.getTitle() %></td>
                    <td><%= doc.getDocumentType() %></td>
                    <td><%= doc.getCategory() %></td>
                    <td><%= doc.getAuthor() %></td>
                    <td><%= doc.getPublisher() %></td>
                    <td style="text-align: center;"><%= doc.getPublishYear() %></td>
                    <td style="text-align: center;">
                        <span class="badge <%= doc.getStockQuantity() > 0 ? "badge-success" : "badge-danger" %>">
                            <%= doc.getStockQuantity() %>
                        </span>
                    </td>
                    <td style="text-align: center;">
                        <a href="gdDocDetail1.jsp?idDoc=<%= doc.getId() %>" name="linkDetail">[Xem]</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="10" style="text-align: center; color: var(--text-muted); padding: 24px;">
                        Không tìm thấy tài liệu nào phù hợp với từ khóa "<b><%= keyword %></b>".
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>