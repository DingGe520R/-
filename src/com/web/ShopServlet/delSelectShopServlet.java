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
 * 对购物车数据选中删除
 */
@WebServlet("/delSelectShopServlet")
public class delSelectShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取所有的 id
        String[] ids=request.getParameterValues("uid");
        //调用 service 删除
        BookService service=new BookServiceImpl();
        service.delSelectShop(ids);
        //跳转查询所有的servlet
        response.sendRedirect(request.getContextPath()+"/findShopServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
