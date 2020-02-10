package com.kkb.servlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {
    protected WebApplicationContext context;

    @Override
    public void init() throws ServletException {
        context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    }
}
