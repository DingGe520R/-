package com.service.impl;

import com.dao.Userdao;
import com.dao.impl.UserDaoImpl;
import com.domain.Address;
import com.domain.PageBean;
import com.domain.User;
import com.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
private Userdao dao=new UserDaoImpl();
    @Override
    public List<User> findall() {
        //调用 dao 完成查询
        return dao.findall();
    }

    @Override
    public User login(User user) {
        return dao.findUserByUsernameAndPassword(user.getUsername(),user.getPassword());
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void adduser(User user) {
      dao.add(user);
    }

    /**
     * 删除 user
     * @param id
     */
    @Override
    public void deleteUser(String id) {
       dao.delete(Integer.parseInt(id));
    }

    /**
     * 根据 id 查询
     * @param id
     * @return
     */
    @Override
    public User findUserById(String id) {
        return dao.findById(Integer.parseInt(id));
    }

    /**
     * 修改用户信息
     * @param user
     */
    @Override
    public void updateUser(User user) {
        dao.update(user);
    }

    /**
     * 批量删除用户
     * @param ids
     */
    @Override
    public void delSelectUser(String[] ids) {
        if(ids!=null&&ids.length> 0){
            //遍历数组
            for (String id:ids) {
                //调用 dao 删除
                dao.delete(Integer.parseInt(id));
            }
        }


    }

    /**
     * 分页查询
     * @param _currentPage
     * @param _rows
     * @param condition
     * @return
     */
    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage=Integer.parseInt(_currentPage); //当前页码
        int rows=Integer.parseInt(_rows);  //每页显示的记录数
       if(currentPage<=0){
           currentPage=1;
       }
        //创建一个空的PageBean对象
        PageBean<User> pb=new PageBean<User>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        //调用 dao 查询总记录数
        int totalcount=dao.findTotalCount(condition);
        System.out.println(totalcount);
        pb.setTotalCount(totalcount);
        //调用 dao 查询 list 集合
        //计算开始的记录索引
        int start=(currentPage-1)*rows;
        List<User> list=dao.findByPage(start,rows,condition);
        pb.setList(list);
        //计算总页码
        int totalPage=(totalcount%rows)== 0 ? totalcount/rows : (totalcount/rows)+1;
        pb.setTotalPage(totalPage);
        return pb;
    }

    @Override
    public void zhuceuser(User user) {
            dao.zhuceuser(user);
    }

    @Override
    public User userlogin(User user) {
        return dao.finduser(user.getName(),user.getQq());
    }

    @Override
    public boolean namepd(User user) {
        return dao.userpd(user);
    }

    @Override
    public void address(Address address,Object userid) {
        dao.address(address, userid);
    }

    @Override
    public Address findaddress(Object userid) {
        return dao.findaddress(userid);
    }

}
