package com.web.Servlet;

import com.domain.User;
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
import java.util.Map;

/**
 * 用户登录验证
 */

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //1.设置编码
        request.setCharacterEncoding("utf-8");
        //获取数据
        String verifycode=request.getParameter("verifycode");
        Map<String,String[]> map=request.getParameterMap();

        //验证码校验
        //定义一个 session 对象
        HttpSession session=request.getSession();
       // 从 session 对象里面 ，取出验证码的值
        String checkcode_server=(String)session.getAttribute("CHECKCODE_SERVER");
        //确认验证码一次性
        session.removeAttribute("CHECKCODE_SERVER");
        //equalsIgnoreCase 忽略大小写
        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            System.out.println("验证码错误");
            //验证码不正确
            //提示信息
            request.setAttribute("login_msg","验证码错误！");
            //跳转登陆页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);

            return;
        }

        //2.封装 user 对象
        User user=new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //3.调用 service 查询
        UserService service=new UserServiceImpl();
        User loginusers=service.login(user);
        System.out.println(loginusers);
        //判断是否登录成功
        if(loginusers!=null){
            //登录成功
            //将用户存入session
            session.setAttribute("user",loginusers);
            //跳转页面(由于没有共享数据，所以重定向)
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
        else{
            System.out.println("登陆失败");
            //提示信息
            request.setAttribute("login_msg","用户名或者密码错误！");
            //跳转登陆页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
