package com.web.BookServlet;

import com.domain.Book;
import com.domain.User;
import com.domain.type;
import com.service.BookService;
import com.service.UserService;
import com.service.impl.BookServiceImpl;
import com.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * 显示图书按分类到页面上
 */
@WebServlet("/ShowBookServlet")
public class ShowBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //1.获取 id
        String id=  request.getParameter("id");
       //调用 UserService 完成查询
        BookService service=new BookServiceImpl();
        List<Book> books=service.findall(id);
        List<type> types = service.findalltype();
        //将 list 存入request 域
        request.setAttribute("types", types);
        //将 list 存入request 域
        request.setAttribute("books",books);
        System.out.println(types);
        System.out.println(books);
        //转发到 list.jsp
        request.getRequestDispatcher("/xianshi.jsp").forward(request,response);
        System.out.println("数据已经发送到 list 页面");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
