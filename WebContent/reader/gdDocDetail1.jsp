<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*,model.*"%>
<%
    String idParam = request.getParameter("idDoc");
    Document1 doc = null;
    if (idParam != null && !idParam.isEmpty()) {
        int idDoc = Integer.parseInt(idParam);
        DocumentDAO1 docDAO = new DocumentDAO1();
        doc = docDAO.getDocDetail(idDoc);
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết tài liệu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Bạn đọc</div>
    </div>

    <div class="container" style="max-width: 720px;">
        <h2>CHI TIẾT TÀI LIỆU</h2>
        
        <% if (doc != null) { %>
        <div class="detail-grid">
            <div class="detail-label">Mã Tài liệu:</div>
            <div class="detail-value"><b><%= doc.getId() %></b></div>

            <div class="detail-label">Tên Tài liệu:</div>
            <div class="detail-value"><b><%= doc.getTitle() %></b></div>

            <div class="detail-label">Loại Tài liệu:</div>
            <div class="detail-value"><%= doc.getDocumentType() %></div>

            <div class="detail-label">Thể loại:</div>
            <div class="detail-value"><%= doc.getCategory() %></div>

            <div class="detail-label">Tác giả:</div>
            <div class="detail-value"><%= doc.getAuthor() %></div>

            <div class="detail-label">Nhà xuất bản:</div>
            <div class="detail-value"><%= doc.getPublisher() %></div>

            <div class="detail-label">Năm xuất bản:</div>
            <div class="detail-value"><%= doc.getPublishYear() %></div>

            <div class="detail-label">Số lượng còn:</div>
            <div class="detail-value">
                <span class="badge <%= doc.getStockQuantity() > 0 ? "badge-success" : "badge-danger" %>">
                    <%= doc.getStockQuantity() %> cuốn
                </span>
            </div>

            <div class="detail-label">Giá bìa:</div>
            <div class="detail-value" style="color: var(--primary); font-weight: 700;">
                <%= String.format("%,.0f", doc.getPrice()) %> VNĐ
            </div>

            <div class="detail-label">Mô tả:</div>
            <div class="detail-value" style="color: var(--text-muted);">
                <%= (doc.getDescription() != null && !doc.getDescription().isEmpty()) ? doc.getDescription() : "Chưa có mô tả chi tiết cho tài liệu này." %>
            </div>
        </div>
        <% } else { %>
            <p style="color: var(--danger-text); margin-bottom: 20px;">Không tìm thấy thông tin tài liệu!</p>
        <% } %>

        <a href="gdSearchDoc1.jsp" name="btnBack" class="btn btn-secondary">⬅ Quay lại danh sách</a>
    </div>
</body>
</html>