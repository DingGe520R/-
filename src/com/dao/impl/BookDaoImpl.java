package com.dao.impl;

import com.dao.Bookdao;
import com.domain.Book;
import com.domain.Shop;
import com.domain.order;
import com.domain.type;
import com.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BookDaoImpl implements Bookdao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 查询总记录数
     * @param condition
     * @return
     */
    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        //定义模板初始化 sql
        String sql = "select count(*) from book where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        //遍历 map
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<Object>();

        for (String key : keySet) {
            //排除分页条件参数
            if ("currentPage".equals(key) || "rows".equals(key)) {
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            System.out.println(value);
            //判断 value 是否有值
            if (value != null && !"".equals(value)) {
                //有值
                sb.append(" and " + key + " like ? ");
                params.add("%" + value + "%"); //加 ？条件的值
            }
        }
        return template.queryForObject(sb.toString(), Integer.class, params.toArray());
    }

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */

    @Override
    public List<Book> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql="select * from book where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        //遍历 map
        Set<String> keySet= condition.keySet();
        //定义参数集合
        List<Object> params =new ArrayList<Object>();

        for (String key:keySet) {
            //排除分页条件参数
            if ("currentPage".equals(key) || "rows".equals(key)) {
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            System.out.println(value);
            //判断 value 是否有值
            if (value != null && !"".equals(value)) {
                //有值
                sb.append(" and " + key + " like ? ");
                params.add("%" + value + "%"); //加 ？条件的值
            }
        }
        //添加分页查询
        sb.append("limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        return  template.query(sb.toString(),new BeanPropertyRowMapper<Book>(Book.class),params.toArray());
    }

    /**
     * 添加图书
     * @param book
     */
    @Override
    public void add(Book book) {
        //定义 sql
        String sql="insert into book values(null,?,?,?,?,?,?,?)";
        //执行 sql
        template.update(sql,book.getBookname(),book.getBook_author(),book.getPublish(),
                book.getBook_price(),book.getBook_intro(),book.getBook_picture(),book.getBook_type());
    }

    /**
     * 删除图书
     * @param id
     */
    @Override
    public void delete(int id) {
        //定义 sql
        String sql="delete from book where id = ?";
        //执行 sql
        template.update(sql,id);
    }

    /**
     * 修改图书
     * @param book
     */
    @Override
    public void update(Book book) {
        String sql="update book set bookname=?,book_author=?,publish=?,book_price=?,book_intro=?,book_picture=?,book_type=? where id=?";
        System.out.println(sql);
        template.update(sql,book.getBookname(),book.getBook_author(),book.getPublish(),
                book.getBook_price(),book.getBook_intro(),book.getBook_picture(),book.getBook_type(),book.getId());
        System.out.println(sql);
    }

    /**
     * 通过id查询
     * @param id
     * @return
     */
    @Override
    public Book findById(int id) {
        String sql="select * from book where id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Book>(Book.class),id);
    }


    /**
     * 查询所有图书
     * @param id
     * @return
     */
    public List<Book> findall(String id) {
        String sql="select * from book where 1 = 1";
        StringBuilder sb=new StringBuilder(sql);
        String value=id;
        if (value != null && !"".equals(value)){
            //有值
            sb.append(" and book.book_type = "+value);
        }
        System.out.println(sb);
        List<Book> books= template.query(sb.toString(),new BeanPropertyRowMapper<Book>(Book.class));
        return books;
    }

    /**
     * 查询所有图书类型
     * @return
     */
    @Override
    public List<type> findalltype() {
        String sql="select * from booktype";
        List<type> types= template.query(sql,new BeanPropertyRowMapper<type>(type.class));
        return types;
    }



    /**
     * 删除购物车所有商品
     * @param id
     */
    @Override
    public void deleteshop(String id) {
        //定义 sql
        String sql="delete from shop where id = ?";
        //执行 sql
        template.update(sql,id);
    }

    /**
     * 加入购物车
     * @param book
     * @param userid
     */
    @Override
    public void addshop(Book book, Object userid) {
        //定义 sql
        String sql="insert into shop values(null,?,?,?,?,?,?,?,?)";
        //执行 sql
        template.update(sql,book.getBookname(),book.getBook_author(),book.getPublish(),
                book.getBook_price(),book.getBook_intro(),book.getBook_picture(),book.getBook_type(),userid);
    }

    /**
     * 显示购物车
     * @param userid
     * @return
     */
    @Override
    public List<Shop> findallshop(Object userid) {
        String sql="select * from shop where shopid= ?";
       List<Shop> shops=template.query(sql,new BeanPropertyRowMapper<Shop>(Shop.class),userid);
       return shops;
    }

    /**
     * 添加订单
     * @param shop
     * @param s
     */
    @Override
    public void addorder(Shop shop, String s) {
        //定义 sql
        String sql="insert into `order` values(null,?,?,?,?,?,?,?,?,?)";
        //执行 sql
        template.update(sql,shop.getBookname(),shop.getBook_author(),shop.getPublish(),shop.getBook_price(),
                shop.getBook_intro(),shop.getBook_picture(),shop.getBook_type(),shop.getShopid(),s);
    }

    /**
     * 通过 id 查找购物车数据
     * @param id
     * @return
     */
    @Override
    public Shop findshopById(int id) {
        String sql="select * from shop where id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Shop>(Shop.class),id);
    }

    /**
     * 查找整张订单表
     * @param userid
     * @return
     */
    @Override
    public List<order> findallorder(Object userid) {
        String sql="select * from `order` where userid= ?";
        List<order> orders=template.query(sql,new BeanPropertyRowMapper<order>(order.class),userid);
        return orders;
    }

    /**
     * 查找所有书
     * @return
     */
    @Override
    public List<Book> findallbook() {
        String sql="select * from book ";
        List<Book> books=template.query(sql,new BeanPropertyRowMapper<Book>(Book.class));
        return books;

    }

    /**
     * 查找所有购物车内容显示在管理员界面
     * @return
     */
    @Override
    public List<Shop> findallshops() {
        String sql="select * from shop";
        List<Shop> shops=template.query(sql,new BeanPropertyRowMapper<Shop>(Shop.class));
        return shops;
    }
    /**
     * 查找所有订单内容显示在管理员界面
     * @return
     */
    @Override
    public List<order> findallorders() {
        String sql="select * from `order`";
        List<order> orders=template.query(sql,new BeanPropertyRowMapper<order>(order.class));
        return orders;
    }

    @Override
    public List<Book> ssbook(String ss) {
        String sql="select * from book where bookname like '%"+ss+"%'";
        System.out.println("搜索");
        System.out.println(sql);
        List<Book> books=template.query(sql,new BeanPropertyRowMapper<Book>(Book.class));
        return books;
    }
}
