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

/**
 * 删除用户
 */
@WebServlet("/delUserServlet")
public class delUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //1.获取 id
      String id=  request.getParameter("id");
     //2.调用 service 删除
        UserService service=new UserServiceImpl();
        service.deleteUser(id);
        //3.跳转到查询所有的 Servlet
        response.sendRedirect(request.getContextPath()+"/findUserByPageServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
