package com.service;

import com.domain.Address;
import com.domain.PageBean;
import com.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户管理的业务接口
 */
public interface UserService {
    //查找整张表
    public List<User> findall();
    //登录方法
    User login(User user);
    //保存 user
    void adduser(User user);
    //根据 id 删除 user
    void deleteUser(String id);
    // 根据 id 查询
    User findUserById(String id);
   //修改用户信息
    void updateUser(User user);
    //批量删除用户
    void delSelectUser(String[] ids);
    //分页条件查询
    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
    //用户注册
    void zhuceuser(User user);
    //用户登录
    User userlogin(User user);
   //判断用户名是否已经存在
    boolean namepd(User user);
    //添加地址
    void address(Address address,Object userid);

    Address findaddress(Object userid);
}
