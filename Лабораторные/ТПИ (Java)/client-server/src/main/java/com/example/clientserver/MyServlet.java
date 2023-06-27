package com.example.clientserver;


import java.util.Objects;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "my-servlet", urlPatterns = {"/my-servlet"})
public class MyServlet extends HttpServlet {
    private static int counter = 0;
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("post" + counter++);
        try {
            String string = request.getParameter("string");
            if (true) {
                boolean found = false;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (Objects.equals(cookie.getName(), "number")) {
                        found = true;
                        System.out.println("Before: " + cookie.getValue());
                        if (Objects.equals(cookie.getValue(), "true")) cookie.setValue("false");
                        else cookie.setValue("true");
                        System.out.println("After: " + cookie.getValue());
                        response.addCookie(cookie);
                    }
                }
                if (!found) {
                    response.addCookie(new Cookie("number", "true"));
                }
            }
            try {
                //response.sendRedirect("index.jsp");
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("get");
    }
}
