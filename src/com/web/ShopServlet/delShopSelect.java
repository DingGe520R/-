package com.web.ShopServlet;

import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 删除单个购物车
 */
@WebServlet("/delShopSelect")
public class delShopSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取 id
        String id=  request.getParameter("id");
        //2.调用 service 删除
        BookService service=new BookServiceImpl();
        service.deleteshop(id);

        //3.跳转到查询所有的 Servlet
        response.sendRedirect(request.getContextPath()+"/findShopServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
