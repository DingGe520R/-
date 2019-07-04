package com.web.BookServlet;

import com.domain.Book;
import com.domain.User;
import com.service.BookService;
import com.service.UserService;
import com.service.impl.BookServiceImpl;
import com.service.impl.UserServiceImpl;
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
 * （管理员）对图书信息进行修改
 */
@WebServlet("/updateBookServlet")
public class updateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //设置编码
        request.setCharacterEncoding("utf-8");
        // 获取map
        Map<String,String[]> map=request.getParameterMap();
        //封装对象
        Book book=new Book();
        try {
            BeanUtils.populate(book,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //调用 service 修改
        BookService service=new BookServiceImpl();
        service.updateUser(book);
        System.out.println(book);
        //跳转到查询所有的 Servlet
        response.sendRedirect(request.getContextPath()+"/findBookByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
