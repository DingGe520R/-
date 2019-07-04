package com.web.userLogin;

import com.domain.User;
import com.service.UserService;
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
 * 对用户名进行校验，判断是否重复
 */
@WebServlet("/JiaoYanServlet")
public class JiaoYanServlet extends HttpServlet {
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
        User user=new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用 service 保存
        UserService service=new UserServiceImpl();
        boolean pd=service.namepd(user);
        System.out.println(pd);
        if (pd) {
            //跳转登陆页面
            request.getRequestDispatcher("/ZhuCeServlet").forward(request,response);
        }
        else {
            request.setAttribute("logins", "用户名已存在，请重新注册");
            //跳转登陆页面
            request.getRequestDispatcher("/denglu1hao.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
