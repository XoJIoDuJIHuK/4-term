package com.example.exam;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

public class MyFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
        // Initialization code here
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        Date date = new Date();
        var time = date.getTime();
        System.out.println("filter");

        if (true) {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("error.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // Cleanup code here
    }
}
