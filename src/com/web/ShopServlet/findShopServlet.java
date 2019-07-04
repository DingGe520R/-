package com.web.ShopServlet;

import com.domain.Shop;
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
 * 显示购物车信息到页面
 */
@WebServlet("/findShopServlet")
public class findShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService service=new BookServiceImpl();
        //接收用户 id
        HttpSession hs = request.getSession();
        if(hs.getAttribute("userid")==null)
            System.out.println("用户名为空");
//        else
//            System.out.println("已保存用户 id 为："+hs.getAttribute("userid"));

        List<Shop> shops=service.findallshop(hs.getAttribute("userid"));
        //将 user 存入 request
        request.setAttribute("shops",shops);
        request.setAttribute("userids",hs.getAttribute("userid"));
        //转发到 gouwuche.jsp
        request.getRequestDispatcher("/gouwuche.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
