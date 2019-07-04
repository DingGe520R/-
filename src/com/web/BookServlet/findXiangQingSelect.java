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

/**
 * 显示每本书的详情
 */
@WebServlet("/findXiangQingSelect")
public class findXiangQingSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取 id
        String id=request.getParameter("id");
        //调用 service 查询
        BookService service=new BookServiceImpl();
        Book book =service.findBookById(id);
        //将 user 存入 request
        request.setAttribute("book",book);
        System.out.println(book);
        //转发到 update.jsp
        request.getRequestDispatcher("/xiangqing.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
