package com.web.OrderServlet;

import com.domain.Book;
import com.domain.Shop;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
  添加订单
 */
@WebServlet("/addOrderServlet")
public class addOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取所有id
        String ids=request.getParameter("ids");
        //获取所有数量
        String nums=request.getParameter("num");
        String[] id = ids.split(",");
        String[] num = nums.split(",");
        BookService service=new BookServiceImpl();
        for(int i=0;i<id.length;i++){
            //循环去查找id对应的购物车数据
            Shop shop =service.findshopById(id[i]);
            //循环插入数据到order
            service.addorder(shop,num[i]);
        }
         //重定向
        response.sendRedirect(request.getContextPath()+"/findOrderServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
