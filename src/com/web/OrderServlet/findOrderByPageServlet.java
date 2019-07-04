package com.web.OrderServlet;

import com.domain.Shop;
import com.domain.order;
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
 * （管理员）查询用户订单到订单页面
 */
@WebServlet("/findOrderByPageServlet")
public class findOrderByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BookService service=new BookServiceImpl();
        List<order> orders=service.findallorders();
        //将 user 存入 request
        request.setAttribute("orders",orders);

        //转发到 list.jsp
        request.getRequestDispatcher("/orderlist.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
