package com.example.lab9;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "time", value = "/time")
public class TimeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String protocol = request.getProtocol();
        String ip = request.getRemoteAddr();
        String method = request.getMethod();
        String url = request.getRequestURL().toString();
        String headers = request.getHeader("User-Agent");

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Текущее время: " + new Date() + "</h1>");
        out.println("<p>Версия протокола: " + protocol + "</p>");
        out.println("<p>IP-адрес клиента: " + ip + "</p>");
        out.println("<p>Имя клиента: " + request.getRemoteHost() + "</p>");
        out.println("<p>Метод запроса: " + method + "</p>");
        out.println("<p>URL запроса: " + url + "</p>");
        out.println("<p>Информация о заголовке: " + headers + "</p>");
        out.println("</body></html>");

        out.close();
    }
}
