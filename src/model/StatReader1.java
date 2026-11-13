package model;

public class StatReader1 extends Reader1 {
    private int totalBorrowCount;
    private int totalBorrowDocs;

    public StatReader1() {
        super();
    }

    public int getTotalBorrowCount() { return totalBorrowCount; }
    public void setTotalBorrowCount(int totalBorrowCount) { this.totalBorrowCount = totalBorrowCount; }

    public int getTotalBorrowDocs() { return totalBorrowDocs; }
    public void setTotalBorrowDocs(int totalBorrowDocs) { this.totalBorrowDocs = totalBorrowDocs; }
}