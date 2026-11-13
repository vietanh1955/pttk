<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết phiếu mượn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Quản lý</div>
    </div>

    <div class="container">
        <h2>CHI TIẾT PHIẾU MƯỢN</h2>
        
        <div style="display: flex; justify-content: space-between; align-items: center; background: #f8fafc; padding: 16px 20px; border-radius: 8px; border: 1px solid var(--border); margin-bottom: 20px;">
            <div style="line-height: 1.8;">
                <div><span style="color: var(--text-muted); font-weight: 600;">Mã phiếu:</span> <b style="color: var(--primary);">PM0101</b> &nbsp;|&nbsp; <span style="color: var(--text-muted); font-weight: 600;">Ngày mượn:</span> <b>10/01/2026</b></div>
                <div><span style="color: var(--text-muted); font-weight: 600;">Hạn trả:</span> <b>24/01/2026</b> &nbsp;|&nbsp; <span style="color: var(--text-muted); font-weight: 600;">Thủ thư lập:</span> <b>Hiền Lê</b></div>
            </div>
            <a href="gdBorrowHistory1.jsp" name="btnBack" class="btn btn-secondary">⬅ Quay lại</a>
        </div>

        <table id="tblDetails">
            <thead>
                <tr>
                    <th style="text-align: center;">TT</th>
                    <th>Tên tài liệu</th>
                    <th style="text-align: center;">SL</th>
                    <th style="text-align: center;">Ngày trả thực tế</th>
                    <th>Tình trạng</th>
                    <th style="text-align: right;">Tiền phạt (VNĐ)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="text-align: center;">1</td>
                    <td style="font-weight: 500;">Giáo trình CNPM</td>
                    <td style="text-align: center;">1</td>
                    <td style="text-align: center;">20/01/2026</td>
                    <td><span class="badge badge-success">Bình thường</span></td>
                    <td style="text-align: right;">0</td>
                </tr>
                <tr>
                    <td style="text-align: center;">2</td>
                    <td style="font-weight: 500;">Mạng máy tính</td>
                    <td style="text-align: center;">1</td>
                    <td style="text-align: center;">24/01/2026</td>
                    <td><span class="badge badge-success">Bình thường</span></td>
                    <td style="text-align: right;">0</td>
                </tr>
                <tr>
                    <td style="text-align: center;">3</td>
                    <td style="font-weight: 500;">An toàn hệ điều hành</td>
                    <td style="text-align: center;">1</td>
                    <td style="text-align: center;">26/01/2026</td>
                    <td><span class="badge badge-danger">Quá hạn 2 ngày</span></td>
                    <td style="text-align: right; color: var(--danger-text); font-weight: 700;">10.000</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>