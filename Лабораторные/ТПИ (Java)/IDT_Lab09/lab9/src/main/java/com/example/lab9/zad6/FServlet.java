package com.example.lab9.zad6;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/FirstServlet")
public class FServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = "Abobus";
        String age = "33";
        String city = "Gorki";
        String url = "SecondServlet?name=" + name + "&age=" + age + "&city=" + city;
        response.sendRedirect(url);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String city = request.getParameter("city");
        String url = "SecondServlet?name=" + name + "&age=" + age + "&city=" + city;
        response.sendRedirect(url);
    }
}

