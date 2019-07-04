package com.web.BookServlet;

import com.domain.Book;
import com.domain.User;
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
 * （管理员）通过 id 查询图书，从而去修改
 */
@WebServlet("/findBookServlet")
public class findBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取 id
        String id=request.getParameter("id");
        //调用 service 查询
        BookService service=new BookServiceImpl();
        Book book =service.findBookById(id);
        //将 user 存入 request
        request.setAttribute("book",book);
        //转发到 update.jsp
        request.getRequestDispatcher("/updateBook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
