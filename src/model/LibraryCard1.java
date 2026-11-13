package model;

import java.sql.Date;

public class LibraryCard1 {
    private int id;
    private Date issueDate;
    private Date expiryDate;
    private String status;

    public LibraryCard1() {
        super();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getIssueDate() { return issueDate; }
    public void setIssueDate(Date issueDate) { this.issueDate = issueDate; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}