package com.example.jdbc_jsp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import static java.lang.System.out;

@WebServlet(name = "action-servlet", urlPatterns = {"/action-servlet"})
public class ActionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userName = (String)request.getSession().getAttribute("currentUser");
        try {
            String currentUser = (String)request.getSession().getAttribute("currentUser");
            unitOfWork.Pay(currentUser);
            unitOfWork.WriteLogFile(currentUser + " paid\n");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        doGet(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            //cookie
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    String value = cookie.getValue();
                    // do something with the cookie
                }
            }

            //headers
            Enumeration<String> headerNames = request.getHeaderNames();
            out.println("Headers:");
            while (headerNames.hasMoreElements()) {
                String headerName = headerNames.nextElement();
                out.println(headerName + " = " + request.getHeader(headerName));
            }

            String currentUser = (String)request.getSession().getAttribute("currentUser");
            int balance = unitOfWork.GetBalance(currentUser);
            request.setAttribute("number", balance);
            unitOfWork.WriteLogFile(currentUser + " has " + balance + " money\n");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/action.jsp").forward(request, response);
    }
}
