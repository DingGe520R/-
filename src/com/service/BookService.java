package com.service;

import com.domain.*;

import java.util.List;
import java.util.Map;

public interface BookService {
    //分页条件查询
    PageBean<Book> findBookByPage(String currentPage, String rows, Map<String, String[]> condition);
   //添加图书
    void addbook(Book book);

    void deletebook(String id);

    void delSelectBook(String[] ids);
    //修改图书信息
    void updateUser(Book book);

    Book findBookById(String id);

    List<Book> findall(String id);

    List<type> findalltype();

    void deleteshop(String id);

    void delSelectShop(String[] ids);

    void addshop(Book book, Object userid);

    List<Shop> findallshop(Object userid);
    
    Shop findshopById(String id);

     void addorder(Shop shop, String s);

     List<order> findorder(Object userid);
    //查找所有图书
     List<Book> findallbook();

     List<Shop> findallshops();

     List<order> findallorders();

    List<Book> ssbook(String ss);
}
