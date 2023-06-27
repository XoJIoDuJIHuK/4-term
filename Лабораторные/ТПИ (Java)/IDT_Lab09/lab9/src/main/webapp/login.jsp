<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login or Register</title>
    <style>
        label,h1,p {
            color: white;
            text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;        }
    </style>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error!=null}" >
<p><%= request.getAttribute("error") %></p>
</c:if>
<body style='background-image: url("img/101.gif"); background-size: cover;
  background-repeat: no-repeat;'>
<h1>Login or Register</h1>
<form method="post" action="login">
    <input type="hidden" name="action" value="login">
    <label for="login">Login:</label>
    <input type="text" name="login" id="login" required><br>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required><br>
    <button type="submit">Login</button>
</form>
<br>
<a href="registrarion.jsp">Регистрация</a>
</body>
</html>
