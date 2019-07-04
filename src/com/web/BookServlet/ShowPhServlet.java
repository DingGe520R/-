package com.web.BookServlet;

import com.domain.Book;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 显示图书到排行页面
 */
@WebServlet("/ShowPhServlet")
public class ShowPhServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService service=new BookServiceImpl();
        List<Book> books=service.findallbook();
        //将 list 存入request 域
        request.setAttribute("books",books);
        System.out.println(books);
        //转发到 ph.jsp
        request.getRequestDispatcher("/ph.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
