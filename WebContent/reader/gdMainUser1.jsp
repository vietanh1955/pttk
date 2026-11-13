<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Màn hình chính người dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Bạn đọc</div>
    </div>

    <div class="container" style="max-width: 520px; text-align: center; margin-top: 40px;">
        <h2>TRANG CHỦ BẠN ĐỌC</h2>
        <p style="color: var(--text-muted); margin-bottom: 28px;">
            Chào mừng bạn đến với cổng tra cứu thông tin tài liệu thư viện trực tuyến.
        </p>
        <form action="gdSearchDoc1.jsp" method="get" style="justify-content: center; margin-bottom: 0;">
            <input type="submit" name="btnSearchDoc" value="🔍 Tìm thông tin tài liệu" style="padding: 12px 28px; font-size: 1rem;" />
        </form>
    </div>
</body>
</html>