package model;

import java.sql.Date;

public class BorrowDetail1 {
    private int id;
    private int quantity;
    private Date actualReturnDate;
    private String bookCondition;
    private float fineAmount;
    private Document1 document;

    public BorrowDetail1() {
        super();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Date getActualReturnDate() { return actualReturnDate; }
    public void setActualReturnDate(Date actualReturnDate) { this.actualReturnDate = actualReturnDate; }

    public String getBookCondition() { return bookCondition; }
    public void setBookCondition(String bookCondition) { this.bookCondition = bookCondition; }

    public float getFineAmount() { return fineAmount; }
    public void setFineAmount(float fineAmount) { this.fineAmount = fineAmount; }

    public Document1 getDocument() { return document; }
    public void setDocument(Document1 document) { this.document = document; }
}