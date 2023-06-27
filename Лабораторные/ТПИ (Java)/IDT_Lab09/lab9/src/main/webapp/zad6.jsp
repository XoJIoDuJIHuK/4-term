<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Первый сервлет</title>
</head>
<body>
<h1>Введите ваши данные:</h1>
<form action="FirstServlet" method="get">
  <label for="name">Имя:</label>
  <input type="text" id="name" name="name"><br><br>
  <label for="age">Возраст:</label>
  <input type="text" id="age" name="age"><br><br>
  <label for="city">Город:</label>
  <input type="text" id="city" name="city"><br><br>
  <input type="submit" value="Отправить">
</form>
</body>
</html>
