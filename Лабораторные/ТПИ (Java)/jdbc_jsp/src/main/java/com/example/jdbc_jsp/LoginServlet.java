package com.example.jdbc_jsp;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "login-servlet", urlPatterns = {"/login-servlet"})
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
       try
       {
           boolean isAuthenticated = unitOfWork.IsAuthenticated(login, password);
           if (isAuthenticated) {
               var session = request.getSession();

               //зачем это надо, я не знаю, но задание есть задание
               session.getCreationTime();
               session.getId();

               session.setAttribute("currentUser", login);
               response.sendRedirect("action.jsp");
           }
           else response.sendRedirect("error.jsp");
       } catch (Exception e) {
           throw new RuntimeException(e);
       }
    }

    public void destroy() {
    }
}