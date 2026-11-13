package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.BorrowDetail1;
import model.BorrowSlip1;
import model.Document1;

public class BorrowSlipDAO1 extends DAO1 {

    public BorrowSlipDAO1() {
        super();
    }

    /**
     * Lấy danh sách lịch sử các phiếu mượn của một độc giả trong khoảng thời gian
     * @param idReader: id độc giả
     * @param startDate: ngày bắt đầu
     * @param endDate: ngày kết thúc
     * @return ArrayList<BorrowSlip1>: danh sách phiếu mượn của độc giả
     */
    public ArrayList<BorrowSlip1> getBorrowHistory(int idReader, Date startDate, Date endDate) {
        ArrayList<BorrowSlip1> listSlips = new ArrayList<BorrowSlip1>();
        String sql = "SELECT bs.id, bs.borrowDate, bs.dueDate, "
                   + "CASE WHEN rs.id IS NOT NULL THEN 'Đã trả hết' ELSE 'Đang mượn' END AS status "
                   + "FROM tblBorrowSlip1 bs "
                   + "INNER JOIN tblLibraryCard1 lc ON bs.tblLibraryCard1id = lc.id "
                   + "LEFT JOIN tblReturnSlip1 rs ON bs.id = rs.tblBorrowSlip1id "
                   + "WHERE lc.tblReader1id = ? AND bs.borrowDate >= ? AND bs.borrowDate <= ? "
                   + "ORDER BY bs.borrowDate ASC";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idReader);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Gọi hàm khởi tạo BorrowSlip1() theo bước 17-18 Sequence Diagram
                BorrowSlip1 slip = new BorrowSlip1();
                slip.setId(rs.getInt("id"));
                slip.setBorrowDate(rs.getDate("borrowDate"));
                slip.setDueDate(rs.getDate("dueDate"));
                slip.setStatus(rs.getString("status"));
                listSlips.add(slip);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSlips;
    }

    /**
     * Lấy thông tin chi tiết một phiếu mượn kèm danh sách tài liệu mượn
     * @param idSlip: id phiếu mượn
     * @return BorrowSlip1: đối tượng phiếu mượn hoàn chỉnh
     */
    public BorrowSlip1 getSlipDetail(int idSlip) {
        BorrowSlip1 slip = null;
        String sqlSlip = "SELECT bs.id, bs.borrowDate, bs.dueDate, m.name AS librarianName "
                       + "FROM tblBorrowSlip1 bs "
                       + "INNER JOIN tblStaff1 s ON bs.tblStaff1id = s.tblMember1id "
                       + "INNER JOIN tblMember1 m ON s.tblMember1id = m.id "
                       + "WHERE bs.id = ?";

        String sqlDetails = "SELECT bd.id, bd.quantity, d.id AS docId, d.title, "
                          + "rs.returnDate AS actualReturnDate, "
                          + "COALESCE(rd.bookCondition, 'Bình thường') AS bookCondition, "
                          + "COALESCE(rd.fineAmount, 0) AS fineAmount "
                          + "FROM tblBorrowDetail1 bd "
                          + "INNER JOIN tblDocument1 d ON bd.tblDocument1id = d.id "
                          + "LEFT JOIN tblReturnSlip1 rs ON bd.tblBorrowSlip1id = rs.tblBorrowSlip1id "
                          + "LEFT JOIN tblReturnDetail1 rd ON (rs.id = rd.tblReturnSlip1id AND d.id = rd.tblDocument1id) "
                          + "WHERE bd.tblBorrowSlip1id = ?";
        try {
            PreparedStatement psSlip = con.prepareStatement(sqlSlip);
            psSlip.setInt(1, idSlip);
            ResultSet rsSlip = psSlip.executeQuery();

            if (rsSlip.next()) {
                PreparedStatement psDet = con.prepareStatement(sqlDetails);
                psDet.setInt(1, idSlip);
                ResultSet rsDet = psDet.executeQuery();

                ArrayList<BorrowDetail1> tempDetails = new ArrayList<BorrowDetail1>();
                while (rsDet.next()) {
                    // Bước 26-28 Sequence Diagram: Khởi tạo Document1()
                    Document1 doc = new Document1();
                    doc.setId(rsDet.getInt("docId"));
                    doc.setTitle(rsDet.getString("title"));

                    // Bước 29-31 Sequence Diagram: Khởi tạo BorrowDetail1() và nạp Document1
                    BorrowDetail1 detail = new BorrowDetail1();
                    detail.setId(rsDet.getInt("id"));
                    detail.setQuantity(rsDet.getInt("quantity"));
                    detail.setActualReturnDate(rsDet.getDate("actualReturnDate"));
                    detail.setBookCondition(rsDet.getString("bookCondition"));
                    detail.setFineAmount(rsDet.getFloat("fineAmount"));
                    detail.setDocument(doc);

                    tempDetails.add(detail);
                }

                // Bước 32-34 Sequence Diagram: Khởi tạo BorrowSlip1() và đóng gói BorrowDetail1[]
                slip = new BorrowSlip1();
                slip.setId(rsSlip.getInt("id"));
                slip.setBorrowDate(rsSlip.getDate("borrowDate"));
                slip.setDueDate(rsSlip.getDate("dueDate"));
                slip.setLibrarianName(rsSlip.getString("librarianName"));
                slip.setBorrowDetails(tempDetails.toArray(new BorrowDetail1[0]));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slip;
    }
}