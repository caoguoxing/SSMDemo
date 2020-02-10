package com.kkb.servlet.courseServlet;

import com.kkb.pojo.Course;
import com.kkb.service.CourseService;
import com.kkb.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/updateCourse")
public class UpdateCourseServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String teachName = req.getParameter("teachName");
        String startTime = req.getParameter("startTime");
        String score = req.getParameter("score");
        String hours = req.getParameter("hours");

        //将参数组装为对象
        Course course = new Course();
        course.setId(Integer.valueOf(id));
        course.setName(name);
        course.setTeachName(teachName);
        course.setScore(Integer.valueOf(score));
        course.setHours(Integer.valueOf(hours));

        //将传入的startTime字符串转为日期格式
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        Date parse = null;
        try {
            parse = sm.parse(startTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        course.setStartTime(parse);

        

        //获取service
        CourseService service = context.getBean(CourseService.class);
        boolean b = service.updateCourse(course);

        if (b){
            req.setAttribute("msg","更新成功");
        }else {
            req.setAttribute("msg", "系统错误，请重试..");

        }
        req.getRequestDispatcher("adminServlet").forward(req,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
