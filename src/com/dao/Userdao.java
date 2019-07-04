package com.dao;

import com.domain.Address;
import com.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户操作的 dao
 */
    public interface    Userdao {

    public List<User> findall();

    User findUserByUsernameAndPassword(String username, String password);

    void add(User user);

    void delete(int parseInt);

    User findById(int parseInt);

    void update(User user);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */

    List<User> findByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    void zhuceuser(User user);

    User finduser(String name, String qq);

    boolean userpd(User user);

    void address(Address address,Object userid);

   Address findaddress(Object userid);
}
