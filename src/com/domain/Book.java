package com.domain;

public class Book {
    private int id;
    private String bookname;
    private String book_author;
    private String publish;
    private String book_price;
    private String book_intro ;
    private String book_picture;
    private String book_type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getBook_price() {
        return book_price;
    }

    public void setBook_price(String book_price) {
        this.book_price = book_price;
    }

    public String getBook_intro() {
        return book_intro;
    }

    public void setBook_intro(String book_intro) {
        this.book_intro = book_intro;
    }

    public String getBook_picture() {
        return book_picture;
    }

    public void setBook_picture(String book_picture) {
        this.book_picture = book_picture;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookname='" + bookname + '\'' +
                ", book_author='" + book_author + '\'' +
                ", publish='" + publish + '\'' +
                ", book_price='" + book_price + '\'' +
                ", book_intro='" + book_intro + '\'' +
                ", book_picture='" + book_picture + '\'' +
                ", book_type='" + book_type + '\'' +
                '}';
    }
}
