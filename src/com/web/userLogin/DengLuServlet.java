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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 用户登录
 */
@WebServlet("/DengLuServlet")
public class DengLuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        //获取数据
        String name=request.getParameter("username");
        String qq=request.getParameter("passwd");
        User user=new User();
        user.setName(name);
        user.setQq(qq);
        System.out.println(user);
        //3.调用 service 查询
        UserService service=new UserServiceImpl();
        User loginuser=service.userlogin(user);
        //存储用户名
        HttpSession hs = request.getSession();
        hs.setAttribute("userid", loginuser.getId());
        //判断是否登录成功
        if(loginuser!=null){
            //跳转页面(由于没有共享数据，所以重定向)
            response.sendRedirect(request.getContextPath()+"/ShowzhuyeServlet");
        }
        else{
            //提示信息
            request.setAttribute("login","用户名或密码错误！");
            //跳转登陆页面
            request.getRequestDispatcher("/denglu1hao.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
