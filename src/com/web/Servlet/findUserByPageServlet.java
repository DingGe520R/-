package com.web.Servlet;

import com.domain.PageBean;
import com.domain.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 分页查询显示
 */
@WebServlet("/findUserByPageServlet")
public class findUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取参数
        String currentPage= request.getParameter("currentPage"); //当前页码
        String rows=request.getParameter("rows"); //每页显示条数

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="10";
        }
        //获取条件查询参数
        Map<String,String[]> condition=request.getParameterMap();

        //调用 service 查询
        UserService service=new UserServiceImpl();
        PageBean<User> pb=service.findUserByPage(currentPage,rows,condition);

        System.out.println(pb);
        //将 PageBean 存入 request
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition); //将查询条件存入 request
        //转发到 list.jsp
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
