<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lab9.zad3.ScheduleDAO" %>
<%@ page import="com.example.lab9.zad3.Schedule" %>
<%
    String userIdParam = request.getParameter("user_id");
    int userId = -1;
    if (userIdParam != null && !userIdParam.isEmpty()) {
        userId = Integer.parseInt(userIdParam);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update and Save Schedule</title>
</head>
<body>

<%
    ScheduleDAO scheduleDAO = new ScheduleDAO();

    if(request.getMethod().equals("POST")) {
        // Получаем данные из формы
        List<Schedule> schedule = (List<Schedule>) request.getAttribute("schedule");

        // Обновляем и сохраняем расписание
        boolean updateSuccess = scheduleDAO.updateSchedule(schedule);
        scheduleDAO.saveSchedule(schedule);

        if(updateSuccess) {
            out.println("<p>Расписание успешно обновлено и сохранено!</p>");
        } else {
            out.println("<p>Ошибка при обновлении расписания!</p>");
        }
    } else {
        // Получаем текущее расписание пользователя
        List<Schedule> schedule = scheduleDAO.getUserSchedule(userId);
%>

<form method="post" action="edit-list">
    <label for="login">name:</label>
    <input type="text" name="name" id="name" required><br>
    <label for="password">href:</label>
    <input type="password" name="href" id="href" required><br>

    <input type="submit" value="Обновить и сохранить расписание">

    <%
            // Сохраняем расписание в атрибут запроса
            request.setAttribute("schedule", schedule);
        }
    %>
</form>
</body>
</html>
