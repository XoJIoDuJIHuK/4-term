package com.example.lab9.zad6;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/SecondServletA")

public class SecondServletA extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String param1 = request.getParameter("param1");
        String param2 = request.getParameter("param2");
        response.setContentType("text/html");
        response.getWriter().write("<h1>Param1: " + param1 + "</h1><br><h1>Param2: " + param2 + "</h1>");
    }
}

