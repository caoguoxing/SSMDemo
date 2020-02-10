package com.kkb.servlet;

import com.kkb.pojo.User;
import com.kkb.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/loginServlet")
public class LoginServlet extends BaseServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收参数
        String username = request.getParameter("user");
        String password = request.getParameter("password");

        //调用Service判断用户名和密码是否正确
        //1.获取Service对象
        UserService service = context.getBean(UserService.class);
        //2.1 调用service中的userLogin方法，接收返回值
        int i = service.userLogin(username, password);
        //2.2 调用service中的userLogin方法
        User user = service.getUserByName(username);

        //接收返回结果，判断跳转到学生界面还是管理员界面
        if (i == 0){
            request.setAttribute("error","用户名和密码不正确");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else if (i == 1){
            //跳转到管理员Servlet
            response.sendRedirect("adminServlet");
            request.getSession().setAttribute("userid",user.getId());
        }else{
            //跳转到学员Servlet
            response.sendRedirect("userServlet");
            request.getSession().setAttribute("userid",user.getId());
        }

    }
}
