package com.web.BookServlet;

import com.domain.Book;
import com.service.BookService;
import com.service.impl.BookServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * （管理员）添加图书
 */
@WebServlet("/addBookServlet")
public class addBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        // 2.获取所有参数
        /**
         *  request.getParameterMap()返回的是一个Map类型的值，
         *  该返回值记录着前端（如jsp页面）所提交请求中的请求参数和请求参数值的映射关系。
         *  这个返回值有个特别之处——只能读。
         */
        Map<String,String[]> map=request.getParameterMap();
        //3.封装对象
        Book book=new Book();
        try {
            BeanUtils.populate(book,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用 service 保存
        BookService service=new BookServiceImpl();
        service.addbook(book);
        //5.跳转到 userListServlet
        response.sendRedirect(request.getContextPath()+"/findBookByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
