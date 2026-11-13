package model;

import java.sql.Date;

public class BorrowSlip1 {
    private int id;
    private Date borrowDate;
    private Date dueDate;
    private String status;
    private String librarianName;
    private LibraryCard1 card;
    private Librarian1 librarian;
    private BorrowDetail1[] borrowDetails;

    public BorrowSlip1() {
        super();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getBorrowDate() { return borrowDate; }
    public void setBorrowDate(Date borrowDate) { this.borrowDate = borrowDate; }

    public Date getDueDate() { return dueDate; }
    public void setDueDate(Date dueDate) { this.dueDate = dueDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getLibrarianName() { return librarianName; }
    public void setLibrarianName(String librarianName) { this.librarianName = librarianName; }

    public LibraryCard1 getCard() { return card; }
    public void setCard(LibraryCard1 card) { this.card = card; }

    public Librarian1 getLibrarian() { return librarian; }
    public void setLibrarian(Librarian1 librarian) { this.librarian = librarian; }

    public BorrowDetail1[] getBorrowDetails() { return borrowDetails; }
    public void setBorrowDetails(BorrowDetail1[] borrowDetails) { this.borrowDetails = borrowDetails; }
}