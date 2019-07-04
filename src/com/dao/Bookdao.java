package com.dao;

import com.domain.*;

import java.util.List;
import java.util.Map;

public interface Bookdao {

    int findTotalCount(Map<String, String[]> condition);


    List<Book> findByPage(int start, int rows, Map<String, String[]> condition);

    void add(Book book);

    void delete(int parseInt);

    void update(Book book);

    Book findById(int parseInt);

    List<Book> findall(String id);

    List<type> findalltype();

//    List<Shop> findallshop();

    void deleteshop(String id);

    void addshop(Book book, Object userid);

    List<Shop> findallshop(Object userid);

    void addorder(Shop shop, String s);

    Shop findshopById(int id);


    List<order> findallorder(Object userid);

    List<Book> findallbook();

    List<Shop> findallshops();

    List<order> findallorders();

    List<Book> ssbook(String ss);
}
