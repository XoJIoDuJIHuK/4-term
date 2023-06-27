package com.example.lab9.zad3;

import java.io.*;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if ("login".equals(action)) {
            // Login existing user
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByLogin(login);
            if (user != null && userDAO.checkPassword(password, user.getPassword())) {
                request.getSession().setAttribute("login", user.getLogin());
                request.getSession().setAttribute("role", user.getRole());
                request.getSession().setAttribute("date", LocalDate.now());
                // Получить расписание занятий пользователя
                ScheduleDAO scheduleDAO = new ScheduleDAO();
                List<Schedule> scheduleList = scheduleDAO.getUserSchedule(user.getId());
                Cookie visitsCountCookie = new Cookie("visitsCount", "1");
                visitsCountCookie.setMaxAge(3600);
                response.addCookie(visitsCountCookie);

                Cookie userTypeCookie = new Cookie("userType", user.getRole());
                userTypeCookie.setMaxAge(3600);
                response.addCookie(userTypeCookie);

                Cookie lastSessionTimeCookie = new Cookie("lastSessionTime", new Date().toString().replace(" ", "_"));
                lastSessionTimeCookie.setMaxAge(3600); // Set the cookie's age to 1 hour
                response.addCookie(lastSessionTimeCookie);

                request.setAttribute("scheduleList", scheduleList);

                request.getRequestDispatcher("/success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Неверный логин или пароль");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } else if ("register".equals(action)) {

            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String role = "USER";

            UserDAO userDAO = new UserDAO();
            if (userDAO.checkUserExists(login)) {
                request.setAttribute("error", "Пользователь уже существует");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                User user = new User();
                user.setLogin(login);
                user.setPassword(password);
                user.setRole(role);
                request.getSession().setAttribute("login", user.getLogin());
                request.getSession().setAttribute("role", user.getRole());
                request.getSession().setAttribute("date", LocalDate.now());

                if (userDAO.addUser(user)) {
                    response.sendRedirect(request.getContextPath() + "/success.jsp");
                } else {
                    request.setAttribute("error", "Ошибка регестрации");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            }
        }
    }
}
