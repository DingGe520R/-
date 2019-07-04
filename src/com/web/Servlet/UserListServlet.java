package com.web.Servlet;

import com.domain.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 查询数据库的数据，显示在页面上
 */

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用 UserService 完成查询
        UserService service=new UserServiceImpl();
        List<User> users=service.findall();
        //将 list 存入request 域
        request.setAttribute("users",users);
        //转发到 list.jsp
        request.getRequestDispatcher("/list.jsp").forward(request,response);
        System.out.println("数据已经发送到 list 页面");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
