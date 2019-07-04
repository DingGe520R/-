package com.web.ShopServlet;

import com.domain.Book;
import com.domain.Shop;
import com.domain.User;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 点击加入购物车，将数据插入其中
 */
@WebServlet("/addShopServlet")
public class addShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取 id
        String id=request.getParameter("id");
        System.out.println(id);
        //调用 service 查询
        BookService service=new BookServiceImpl();
        Book book =service.findBookById(id);
        //接收用户 id
        HttpSession hs = request.getSession();
        if(hs.getAttribute("userid")==null)
            System.out.println("用户名为空");
        else
            System.out.println("已保存用户 id 为："+hs.getAttribute("userid"));
        //购物车表插入数据
        service.addshop(book,hs.getAttribute("userid"));

        response.sendRedirect(request.getContextPath()+"/findShopServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
