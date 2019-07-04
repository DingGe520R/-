package com.service.impl;

import com.dao.Bookdao;
import com.dao.impl.BookDaoImpl;
import com.domain.*;
import com.service.BookService;

import java.util.List;
import java.util.Map;

public class BookServiceImpl implements BookService {
    private Bookdao dao = new BookDaoImpl();

    /**
     * 分页查询所有图书
     *
     * @param _currentPage
     * @param _rows
     * @param condition
     * @return
     */
    @Override
    public PageBean<Book> findBookByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage); //当前页码
        int rows = Integer.parseInt(_rows);  //每页显示的记录数
        System.out.println("currentPage:" + currentPage + " rows:" + rows);
        //点击最左侧按钮让其停留在第一页
        if (currentPage <= 0) {
            currentPage = 1;
        }
        //创建一个空的PageBean对象
        PageBean<Book> pb = new PageBean<Book>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        //调用 dao 查询总记录数
        int totalcount = dao.findTotalCount(condition);
        System.out.println("总记录数: " + totalcount);
        pb.setTotalCount(totalcount);
        //调用 dao 查询 list 集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<Book> list = dao.findByPage(start, rows, condition);
        pb.setList(list);
        //计算总页码
        int totalPage = (totalcount % rows) == 0 ? totalcount / rows : (totalcount / rows) + 1;
        pb.setTotalPage(totalPage);
        return pb;
    }

    /**
     * 添加图书
     *
     * @param book
     */
    @Override
    public void addbook(Book book) {
        dao.add(book);
    }

    /**
     * 删除图书
     *
     * @param id
     */
    @Override
    public void deletebook(String id) {
        dao.delete(Integer.parseInt(id));
    }

    /**
     * 批量删除图书
     *
     * @param ids
     */
    @Override
    public void delSelectBook(String[] ids) {
        if (ids != null && ids.length > 0) {
            //遍历数组
            for (String id : ids) {
                //调用 dao 删除
                dao.delete(Integer.parseInt(id));
            }
        }
    }

    /**
     * 修改图书信息
     * @param book
     */
    @Override
    public void updateUser(Book book) {
        dao.update(book);
    }

    /**
     * 通过id查找图书
     * @param id
     * @return
     */
    @Override
    public Book findBookById(String id) {
        return dao.findById(Integer.parseInt(id));
    }

    /**
     * 查找所有图书
     * @return
     */
    @Override
    public List<Book> findall(String id)
    {
        return dao.findall(id);
    }

    /**
     * 查找所有图书类型
     * @return
     */
    @Override
    public List<type> findalltype() {
        return dao.findalltype();
    }


    /**
     * 删除单一购物
     * @param id
     */
    @Override
    public void deleteshop(String id) {
        dao.deleteshop(id);
    }

    /**
     * 删除选中购物车
     * @param ids
     */
    @Override
    public void delSelectShop(String[] ids) {
        if (ids != null && ids.length > 0) {
            //遍历数组
            for (String id : ids) {
                //调用 dao 删除
                dao.deleteshop(id);
            }
        }
    }

    /**
     * 添加到购物车
     * @param book
     * @param userid
     */
    @Override
    public void addshop(Book book, Object userid) {
        dao.addshop( book,userid);
    }

    /**
     * 购物车显示到页面
     * @param userid
     * @return
     */
    @Override
    public List<Shop> findallshop(Object userid) {
        return dao.findallshop(userid);
    }

    /**
     * 通过id查询shop
     * @param id
     * @return
     */
    @Override
    public Shop findshopById(String id) {
            return dao.findshopById(Integer.parseInt(id));
    }

    @Override
    public void addorder(Shop shop, String s) {
        dao.addorder( shop ,s);
    }

    @Override
    public List<order> findorder(Object userid) {
        return dao.findallorder(userid);
    }

    @Override
    public List<Book> findallbook() {
        return dao.findallbook();
    }

    /**
     * 查找所有购物车
     * @return
     */
    @Override
    public List<Shop> findallshops() {
        return dao.findallshops();
    }

    @Override
    public List<order> findallorders() {
        return dao.findallorders();
    }

    @Override
    public List<Book> ssbook(String ss) {
        return dao.ssbook(ss);
    }


}
