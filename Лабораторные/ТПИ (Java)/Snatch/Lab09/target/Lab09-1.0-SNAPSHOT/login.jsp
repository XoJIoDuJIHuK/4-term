<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.05.2021
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<fieldset>
  <legend>login</legend>
  <form action="Login" method="POST">
    <input name="login" type="text" placeholder="login"/>
    <input name="password" type="text" placeholder="password"/>
    <input type="submit" value="Войти"/>
  </form>
</fieldset>
<form action="GoToRegister" method="POST">
  <input type="submit" value="registration"/>
</form>
</body>
</html>
