package com.example.jdbc_jsp;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Objects;

public class MyFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        Time time = new Time(System.currentTimeMillis());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);
        int minutes = calendar.get(Calendar.MINUTE);
        unitOfWork.WriteLogFile(String.valueOf(minutes));
        System.out.println(minutes);
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        if (minutes % 2 == 1) {
            httpResponse.sendRedirect("error.jsp");
        } else {
            httpResponse.sendRedirect("action.jsp");
        }
    }

    public void destroy() {
    }
}
