<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Выберите действие</title>
</head>
<body>
<h1>Выберите действие:</h1>
<form action="FirstServlet" method="post">
    <input type="radio" id="a" name="action" value="a">
    <label for="a">Выполнить переопределение Get-запроса на второй сервлет</label><br>
    <input type="submit" value="Выбрать">
</form>
</body>
</html>
