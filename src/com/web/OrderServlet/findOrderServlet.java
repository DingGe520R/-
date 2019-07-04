package com.web.OrderServlet;

import com.domain.Address;
import com.domain.order;
import com.service.BookService;
import com.service.UserService;
import com.service.impl.BookServiceImpl;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 查询用户订单到订单页面
 */
@WebServlet("/findOrderServlet")
public class findOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService service=new BookServiceImpl();
        HttpSession hs = request.getSession();
        //查询订单显示页面
        List<order> order= service.findorder(hs.getAttribute("userid"));
        System.out.println(order);
        //查询最新地址显示页面
        UserService services=new UserServiceImpl();
        Address addresses=services.findaddress(hs.getAttribute("userid"));

        System.out.println("addresses:"+addresses);
        //将地址存到request域
        request.setAttribute("address",addresses);
        //将订单存到request域里面
        request.setAttribute("orders",order);
        //转发到 querenorder.jsp
        request.getRequestDispatcher("/ensure.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
