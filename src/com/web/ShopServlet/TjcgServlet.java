package com.web.ShopServlet;

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
 * 添加成功页面
 */
@WebServlet("/TjcgServlet")
public class TjcgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        //将 list 存入request 域
        request.setAttribute("id",id);
        BookService service=new BookServiceImpl();
        List<Book> books=service.findallbook();
        //将 list 存入request 域
        request.setAttribute("books",books);
        System.out.println(id);
        //转发到 ph.jsp
        request.getRequestDispatcher("/tjcg.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
