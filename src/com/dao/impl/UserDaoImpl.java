package com.dao.impl;

import com.dao.Userdao;
import com.domain.Address;
import com.domain.User;
import com.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements Userdao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override

    public List<User> findall() {
        //使用 JDBC 操作数据库
        //定义 sql
        String sql="select * from user";
        List<User> users= template.query(sql,new BeanPropertyRowMapper<User>(User.class));
        System.out.println("已经获取数据");
        return users;
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public User findUserByUsernameAndPassword(String username, String password) {

        try {
            String sql="select * from user where username= ? and password= ?";
            //它可自动将一行数据映射到指定类的实例中 它首先将这个类实例化，然后通过名称匹配的方式，映射到属性中去。
            User user=template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),username,password);
            System.out.println("登录");
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return  null;
        }
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void add(User user) {
        //定义 sql
        String sql="insert into user values(null,?,?,?,?,?,?,null,null)";
        //执行 sql
        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail());

    }

    /**
     * 删除用户
     * @param id
     */
    @Override
    public void delete(int id) {
        //定义 sql
        String sql="delete from user where id = ?";
         //执行 sql
        template.update(sql,id);
    }

    /**
     * 根据 id 查询用户
     * @param id
     * @return
     */
    @Override
    public User findById(int id) {
        String sql="select * from user where id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),id);
    }

    /**
     * 修改用户信息
     * @param user
     */

    @Override
    public void update(User user) {
        String sql="update user set name=?,gender=?,age=?,address=?,qq=?,email=? where id=?";
        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail(),user.getId());

    }
    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
    String sql="select * from user where 1 = 1 ";
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
        System.out.println(sb.toString());
        System.out.println(params);
    return  template.query(sb.toString(),new BeanPropertyRowMapper<User>(User.class),params.toArray());
    }
    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        //定义模板初始化 sql
        String sql="select count(*) from user where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        //遍历 map
       Set<String> keySet= condition.keySet();
       //定义参数集合
        List<Object> params =new ArrayList<Object>();

        for (String key:keySet) {
            //排除分页条件参数
            if("currentPage".equals(key)|| "rows".equals(key)){
               continue;
            }
            //获取value
            String value=condition.get(key)[0];
            System.out.println(value);
            //判断 value 是否有值
            if(value!= null && !"".equals(value)){
             //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%"); //加 ？条件的值
            }
        }
        System.out.println(sb.toString());
        System.out.println(params);

        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public void zhuceuser(User user) {
        //定义 sql
        String sql="insert into user (name,age,qq,email) values(?,?,?,?)";
        System.out.println("注册成功");
        //执行 sql
        template.update(sql,user.getName(),user.getAge(),user.getQq(),user.getEmail());
    }

    /**
     * 用户登录判断
     * @param name
     * @param qq
     * @return
     */
    @Override
    public User finduser(String name, String qq) {
        try {
            String sql="select * from user where name= ? and qq= ?";
            //它可自动将一行数据映射到指定类的实例中 它首先将这个类实例化，然后通过名称匹配的方式，映射到属性中去。
            User user=template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),name,qq);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return  null;
        }
    }

    @Override
    public boolean userpd(User user) {
        try {
            String sql="select * from user where name= ?";
            //它可自动将一行数据映射到指定类的实例中 它首先将这个类实例化，然后通过名称匹配的方式，映射到属性中去。
            template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),user.getName());
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return  true;
        }
    }

    @Override
    public void address(Address address,Object userid) {
        //定义 sql
        String sql="insert into address values(null,?,?,?,?,?,?)";
        //执行 sql
        template.update(sql,address.getName(),address.getPhone(),
        address.getSparephone(),address.getAddress_type(),address.getDetail_adr(),userid);
    }

    @Override
    public Address findaddress(Object userid) {
        try {
            String sql="select * from address where id=(select max(id) as id from address) and userid=?";
            Address addresses   = template.queryForObject(sql,new BeanPropertyRowMapper<Address>(Address.class),userid);
            System.out.println(addresses);
            return addresses;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }

    }
}
