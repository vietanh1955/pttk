<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử mượn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Quản lý</div>
    </div>

    <div class="container">
        <h2>LỊCH SỬ MƯỢN TÀI LIỆU</h2>
        
        <div style="display: flex; justify-content: space-between; align-items: center; background: #f8fafc; padding: 14px 20px; border-radius: 8px; border: 1px solid var(--border); margin-bottom: 20px;">
            <div>
                <span style="color: var(--text-muted); font-weight: 600;">Độc giả:</span>
                <span style="font-weight: 700; color: var(--primary); margin-left: 8px;">Trần Việt Anh (B23DCAT021) - Khoa ATTT</span>
            </div>
            <a href="gdStatReader1.jsp" name="btnBack" class="btn btn-secondary">⬅ Quay lại</a>
        </div>

        <table id="tblHistory">
            <thead>
                <tr>
                    <th style="text-align: center;">TT</th>
                    <th>Mã phiếu mượn</th>
                    <th style="text-align: center;">Ngày mượn</th>
                    <th style="text-align: center;">Hạn trả</th>
                    <th>Trạng thái</th>
                    <th style="text-align: center;">Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="text-align: center;">1</td>
                    <td style="font-weight: 600;">PM0101</td>
                    <td style="text-align: center;">10/01/2026</td>
                    <td style="text-align: center;">24/01/2026</td>
                    <td><span class="badge badge-success">Đã trả hết</span></td>
                    <td style="text-align: center;"><a href="gdBorrowSlipDetail1.jsp?idSlip=101" name="linkViewSlip">[Xem]</a></td>
                </tr>
                <tr>
                    <td style="text-align: center;">2</td>
                    <td style="font-weight: 600;">PM0215</td>
                    <td style="text-align: center;">15/02/2026</td>
                    <td style="text-align: center;">01/03/2026</td>
                    <td><span class="badge badge-success">Đã trả hết</span></td>
                    <td style="text-align: center;"><a href="gdBorrowSlipDetail1.jsp?idSlip=215" name="linkViewSlip">[Xem]</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>