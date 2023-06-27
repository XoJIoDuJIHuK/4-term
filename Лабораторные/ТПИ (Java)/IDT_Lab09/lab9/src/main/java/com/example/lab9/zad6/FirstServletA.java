package com.example.lab9.zad6;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/FirstServletA")

public class FirstServletA extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("a")) {
            String param1 = "value1";
            String param2 = "value2";
            String url = "SecondServlet?param1=" + param1 + "&param2=" + param2;
            response.sendRedirect(url);
        }
    }
}
