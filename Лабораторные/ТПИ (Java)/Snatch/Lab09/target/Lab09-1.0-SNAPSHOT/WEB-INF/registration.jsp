<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.05.2021
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>register</title>
</head>
<body>
<fieldset>
  <legend>Регистрация</legend>
  <form method="POST" action="Registration">
    <input name="login" type="text" placeholder="Логин"/>
    <input name="password" type="text" placeholder="Пароль"/>
    <input type="submit" value="Регистрация"/>
  </form>
</fieldset>
<form method="POST" action="GoToLogin">
  <input type="submit" value="Войти"/>
</form>
</body>
</html>
