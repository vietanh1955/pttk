package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Document1;

public class DocumentDAO1 extends DAO1 {

    public DocumentDAO1() {
        super();
    }

    /**
     * Tìm danh sách tài liệu có tên chứa từ khóa keyword
     * @param keyword: từ khóa tên tài liệu
     * @return ArrayList<Document1>: danh sách tài liệu phù hợp
     */
    public ArrayList<Document1> searchDocument(String keyword) {
        ArrayList<Document1> listDoc = new ArrayList<Document1>();
        if (keyword == null || keyword.trim().isEmpty()) {
            return listDoc;
        }
        String sql = "SELECT * FROM tblDocument1 WHERE title LIKE ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword.trim() + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Document1 doc = new Document1();
                doc.setId(rs.getInt("id"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setCategory(rs.getString("category"));
                doc.setPublisher(rs.getString("publisher"));
                doc.setDocumentType(rs.getString("documentType"));
                doc.setPublishYear(rs.getInt("publishYear"));
                doc.setStockQuantity(rs.getInt("stockQuantity"));
                doc.setPrice(rs.getFloat("price"));
                doc.setDescription(rs.getString("description"));
                listDoc.add(doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listDoc;
    }

    /**
     * Lấy thông tin chi tiết của một tài liệu theo mã idDoc
     * @param idDoc: id của tài liệu
     * @return Document1: đối tượng tài liệu chi tiết
     */
    public Document1 getDocDetail(int idDoc) {
        Document1 doc = null;
        String sql = "SELECT * FROM tblDocument1 WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idDoc);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Gọi hàm khởi tạo Document1() theo bước 16-17 Sequence Diagram
                doc = new Document1();
                doc.setId(rs.getInt("id"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setCategory(rs.getString("category"));
                doc.setPublisher(rs.getString("publisher"));
                doc.setDocumentType(rs.getString("documentType"));
                doc.setPublishYear(rs.getInt("publishYear"));
                doc.setStockQuantity(rs.getInt("stockQuantity"));
                doc.setPrice(rs.getFloat("price"));
                doc.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doc;
    }
}