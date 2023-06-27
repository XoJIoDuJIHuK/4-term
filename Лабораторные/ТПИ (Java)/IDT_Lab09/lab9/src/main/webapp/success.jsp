<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("visitsCount".equals(cookie.getName())) {
                int visitsCount = Integer.parseInt(cookie.getValue());
                System.out.println("Количество посещений: " + visitsCount);
                cookie.setValue(Integer.toString(visitsCount + 1));
                response.addCookie(cookie);
            } else if ("userType".equals(cookie.getName())) {
                String userType = cookie.getValue();
                System.out.println("Тип пользователя: " + userType);
            } else if ("lastSessionTime".equals(cookie.getName())) {
                String lastSessionTime = cookie.getValue().replace("_", " ");
                System.out.println("Последняя сессия: " + lastSessionTime);
            }
        }
    }
%>
<%@ page import="com.example.lab9.zad3.Schedule" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success Page</title>
</head>
<body>
<h1>УРА ВЫ тут</h1>
<p>Welcome <%= session.getAttribute("login") %>!</p>
<p>Your role is <%= session.getAttribute("role") %> and you logged in at <%= session.getAttribute("date") %></p>

<table>
    <thead>
    <tr>
        <th>User ID</th>
        <th>Channel Name</th>
        <th>Href</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="userSchedule" items="${scheduleList}">
    <tr>
        <td>${userSchedule.getuser_id()}</td>
        <td>${userSchedule.getChannel_name()}</td>
        <td>${userSchedule.getHref()}</td>
    </tr>
    <tr>
    </tr>
    </c:forEach>

</table>

<a href="List.jsp">List</a>
<img src="img/101.gif">


</body>
</html>
