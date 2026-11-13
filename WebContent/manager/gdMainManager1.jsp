<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang quản lý</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Quản lý</div>
    </div>

    <div class="container" style="max-width: 520px; text-align: center; margin-top: 40px;">
        <h2>TRANG CHỦ QUẢN LÝ</h2>
        <p style="color: var(--text-muted); margin-bottom: 28px;">
            Hệ thống tổng hợp báo cáo thống kê tình hình mượn trả tài liệu của độc giả.
        </p>
        <div style="display: flex; justify-content: center;">
            <button type="button" name="btnViewReport" onclick="location.href='gdSelectTime1.jsp'" style="padding: 12px 28px; font-size: 1rem;">
                📊 Xem thống kê
            </button>
        </div>
    </div>
</body>
</html>