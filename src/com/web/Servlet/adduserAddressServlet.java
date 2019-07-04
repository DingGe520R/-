package com.web.Servlet;

import com.domain.Address;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * 添加用户地址
 */
@WebServlet("/adduserAddressServlet")
public class adduserAddressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //设置编码
        request.setCharacterEncoding("utf-8");
        //获取参数
        Map<String,String []> map=request.getParameterMap();
        Address address=new Address();
       //封装对象
        try {
            BeanUtils.populate(address,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        HttpSession hs = request.getSession();
        //添加地址信息
        UserService service=new UserServiceImpl();
        service.address(address,hs.getAttribute("userid"));

        //重定向到 findOrderServlet
        response.sendRedirect(request.getContextPath()+"/findOrderServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
