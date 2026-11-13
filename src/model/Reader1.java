package model;

public class Reader1 extends Member1 {
    private String readerType;
    private String department;
    private LibraryCard1 card;

    public Reader1() {
        super();
    }

    public String getReaderType() { return readerType; }
    public void setReaderType(String readerType) { this.readerType = readerType; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public LibraryCard1 getCard() { return card; }
    public void setCard(LibraryCard1 card) { this.card = card; }
}