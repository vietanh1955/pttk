<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chọn thống kê và thời gian</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Quản lý</div>
    </div>

    <div class="container" style="max-width: 650px;">
        <h2>CHỌN THỐNG KÊ VÀ THỜI GIAN</h2>
        
        <form action="gdStatReader1.jsp" method="get" style="display: block;">
            <div class="detail-grid" style="margin-bottom: 24px; align-items: center;">
                <div class="detail-label">Loại thống kê:</div>
                <div>
                    <select name="cbbReportType" style="width: 100%;">
                        <option value="statReader" selected>Thống kê độc giả theo số lần mượn</option>
                    </select>
                </div>

                <div class="detail-label">Từ ngày:</div>
                <div>
                    <input type="text" name="txtStartDate" value="01/01/2026" style="width: 100%;" />
                </div>

                <div class="detail-label">Đến ngày:</div>
                <div>
                    <input type="text" name="txtEndDate" value="15/01/2026" style="width: 100%;" />
                </div>
            </div>

            <div style="display: flex; gap: 12px;">
                <input type="submit" name="btnSubmit" value="📊 Xem thống kê" />
                <a href="gdMainManager1.jsp" name="btnBack" class="btn btn-secondary">⬅ Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>