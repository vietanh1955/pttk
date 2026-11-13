package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.StatReader1;

public class StatReaderDAO1 extends DAO1 {
    public StatReaderDAO1() {
        super();
    }

    public ArrayList<StatReader1> getStatReader(Date startDate, Date endDate) {
        ArrayList<StatReader1> list = new ArrayList<>();
        String sql = "SELECT m.id, m.name, r.readerType, r.department, "
                   + "COUNT(b.id) AS totalBorrowCount "
                   + "FROM tblMember1 m "
                   + "JOIN tblReader1 r ON m.id = r.tblMember1id "
                   + "JOIN tblLibraryCard1 lc ON r.tblMember1id = lc.tblReader1id "
                   + "JOIN tblBorrowSlip1 b ON lc.id = b.tblLibraryCard1id "
                   + "WHERE b.borrowDate BETWEEN ? AND ? "
                   + "GROUP BY m.id, m.name, r.readerType, r.department "
                   + "ORDER BY totalBorrowCount DESC";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, startDate);
            ps.setDate(2, endDate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StatReader1 sr = new StatReader1();
                sr.setId(rs.getInt("id"));
                sr.setName(rs.getString("name"));
                sr.setReaderType(rs.getString("readerType"));
                sr.setDepartment(rs.getString("department"));
                sr.setTotalBorrowCount(rs.getInt("totalBorrowCount"));
                list.add(sr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}