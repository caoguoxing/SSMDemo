package com.kkb.servlet;

import com.kkb.pojo.Course;
import com.kkb.service.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet",urlPatterns = "/adminServlet")
public class AdminServlet extends BaseServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("userid"+ request.getSession().getAttribute("userid"));
        //查询数据库拿出所有课程信息
        CourseService service = context.getBean(CourseService.class);
        List<Course> courseList = service.getCousers();

        request.setAttribute("courses", courseList);
        request.getRequestDispatcher("admin.jsp").forward(request,response);


    }
}
