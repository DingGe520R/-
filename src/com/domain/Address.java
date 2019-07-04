package com.domain;

public class Address {
    private  int  id;
    private  String name;
    private  String phone;
    private  String sparephone;
    private  String address_type;
    private  String detail_adr;
    private  String userid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSparephone() {
        return sparephone;
    }

    public void setSparephone(String sparephone) {
        this.sparephone = sparephone;
    }

    public String getAddress_type() {
        return address_type;
    }

    public void setAddress_type(String address_type) {
        this.address_type = address_type;
    }

    public String getDetail_adr() {
        return detail_adr;
    }

    public void setDetail_adr(String detail_adr) {
        this.detail_adr = detail_adr;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", sparephone='" + sparephone + '\'' +
                ", address_type='" + address_type + '\'' +
                ", detail_adr='" + detail_adr + '\'' +
                ", userid='" + userid + '\'' +
                '}';
    }
}
