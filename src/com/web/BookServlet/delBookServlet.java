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
 * （管理员）删除图书
 */
@WebServlet("/delBookServlet")
public class delBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取 id
        String id=  request.getParameter("id");
        //2.调用 service 删除
        BookService service=new BookServiceImpl();
        service.deletebook(id);

        //3.跳转到查询所有的 Servlet
        response.sendRedirect(request.getContextPath()+"/findBookByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
