package com.example.lab9.zad3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/inputServlet")
public class InputServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("channel_name");
        String href = request.getParameter("href");

        if (request.getParameter("update") != null)
        {
            ScheduleDAO.UpdateChannel(id, name, href);
        }
        else if (request.getParameter("delete") != null)
        {
            ScheduleDAO.DeleteChannel(id, name);
        }
        else ScheduleDAO.AddChannel(id, name, href);

        request.getRequestDispatcher("List.jsp").forward(request, response);
    }

}
