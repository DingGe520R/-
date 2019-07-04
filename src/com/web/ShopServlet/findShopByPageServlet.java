package com.web.ShopServlet;

import com.domain.Book;
import com.domain.PageBean;
import com.domain.Shop;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * （管理员）显示购物车信息到页面
 */
@WebServlet("/findShopByPageServlet")
public class findShopByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BookService service=new BookServiceImpl();
        List<Shop> shops=service.findallshops();
        //将 user 存入 request
        request.setAttribute("shops",shops);

        //转发到 list.jsp
        request.getRequestDispatcher("/cartlist.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
