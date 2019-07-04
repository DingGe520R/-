package com.domain;

public class type {
    private  String type_id;
    private  String book_type;

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    @Override
    public String toString() {
        return "type{" +
                "type_id=" + type_id +
                ", book_type='" + book_type + '\'' +
                '}';
    }
}
