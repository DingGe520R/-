package com.web.BookServlet;

import com.domain.Book;
import com.domain.PageBean;
import com.domain.User;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * （管理员）分页查询所有图书
 */
@WebServlet("/findBookByPageServlet")
public class findBookByPageServlet extends HttpServlet {
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
        BookService service=new BookServiceImpl();
        PageBean<Book> pb=service.findBookByPage(currentPage,rows,condition);

        System.out.println("所有数据："+pb);
        //将 PageBean 存入 request
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition); //将查询条件存入 request
        //转发到 list.jsp
        request.getRequestDispatcher("/booklist.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
