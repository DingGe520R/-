package com.web.BookServlet;

import com.service.BookService;
import com.service.UserService;
import com.service.impl.BookServiceImpl;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * （管理员）删除选中图书
 */
@WebServlet("/delSelectBookServlet")
public class delSelectBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取所有的 id
        String[] ids=request.getParameterValues("uid");
        //调用 service 删除
        BookService service=new BookServiceImpl();
        service.delSelectBook(ids);
        //跳转查询所有的servlet
        response.sendRedirect(request.getContextPath()+"/findBookByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
