package com.example.lab9.zad3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/edit-schedule")
public class EditScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_idParam = request.getParameter("user_id");
        if (user_idParam != null) {
            int user_id = Integer.parseInt(user_idParam);

            // Получаем пользователя по его ID с помощью объекта UserDAO
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(user_id);

            // Получаем расписание занятий пользователя из базы данных
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<Schedule> schedule = scheduleDAO.getUserSchedule(user_id);

            // Передаем информацию о пользователе и его расписании на страницу редактирования расписания
            request.setAttribute("user", user);
            request.setAttribute("schedule", schedule);
            request.getRequestDispatcher("edit-schedule.jsp").forward(request, response);
        } else {
            // Обработка случая, когда параметр "user_id" не указан в запросе
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID parameter is missing");
        }}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Получаем параметры запроса, которые были отправлены пользователем при редактировании расписания
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String channel_name = request.getParameter("channel_name");
        String href = request.getParameter("href");

        // Создаем объект Schedule и сохраняем его в базе данных
        Schedule schedule = new Schedule(user_id, channel_name, href);
        List<Schedule> schedules = new ArrayList<>();
        schedules.add(schedule);
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        scheduleDAO.saveSchedule(schedules);

        // Перенаправляем пользователя на страницу редактирования расписания занятий
        response.sendRedirect("edit-schedule?user_id=" + user_id);
    }



}
