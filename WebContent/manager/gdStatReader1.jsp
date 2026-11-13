<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Bảng thống kê</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">📚 HỆ THỐNG QUẢN LÝ THƯ VIỆN - LIBMAN</div>
        <div class="role-badge">Phân hệ Quản lý</div>
    </div>

    <div class="container">
        <h2>BẢNG THỐNG KÊ ĐỘC GIẢ THEO SỐ LẦN MƯỢN</h2>
        
        <div style="display: flex; justify-content: space-between; align-items: center; background: #f8fafc; padding: 14px 20px; border-radius: 8px; border: 1px solid var(--border); margin-bottom: 20px;">
            <div>
                <span style="color: var(--text-muted); font-weight: 600;">Khoảng thời gian:</span>
                <span style="font-weight: 700; color: var(--primary); margin-left: 8px;">01/01/2026</span>
                <span style="margin: 0 8px;">→</span>
                <span style="font-weight: 700; color: var(--primary);">15/01/2026</span>
            </div>
            <a href="gdSelectTime1.jsp" name="btnBack" class="btn btn-secondary">⬅ Quay lại</a>
        </div>

        <table id="tblStat">
            <thead>
                <tr>
                    <th style="text-align: center;">TT</th>
                    <th>Mã độc giả</th>
                    <th>Họ và tên</th>
                    <th>Loại bạn đọc</th>
                    <th>Khoa/Viện</th>
                    <th style="text-align: center;">Số lần mượn</th>
                    <th style="text-align: center;">Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="text-align: center;">1</td>
                    <td style="font-weight: 600;">B23DCAT021</td>
                    <td style="font-weight: 500;">Trần Việt Anh</td>
                    <td>Sinh viên</td>
                    <td>ATTT</td>
                    <td style="text-align: center;"><span class="badge badge-success">12</span></td>
                    <td style="text-align: center;"><a href="gdBorrowHistory1.jsp?idReader=1" name="linkViewHistory">[Xem]</a></td>
                </tr>
                <tr>
                    <td style="text-align: center;">2</td>
                    <td style="font-weight: 600;">B23DCCN123</td>
                    <td style="font-weight: 500;">Nguyễn Văn B</td>
                    <td>Sinh viên</td>
                    <td>CNTT</td>
                    <td style="text-align: center;"><span class="badge badge-success">9</span></td>
                    <td style="text-align: center;"><a href="gdBorrowHistory1.jsp?idReader=2" name="linkViewHistory">[Xem]</a></td>
                </tr>
                <tr>
                    <td style="text-align: center;">3</td>
                    <td style="font-weight: 600;">GV001</td>
                    <td style="font-weight: 500;">Lê Thị B</td>
                    <td>Giảng viên</td>
                    <td>Cơ bản</td>
                    <td style="text-align: center;"><span class="badge badge-success">5</span></td>
                    <td style="text-align: center;"><a href="gdBorrowHistory1.jsp?idReader=3" name="linkViewHistory">[Xem]</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>