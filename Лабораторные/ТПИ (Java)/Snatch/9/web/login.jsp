<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Authorize</title>
    </head>
<body>
<fieldset>
    <legend>Авторизация</legend>
    <form action="Login" method="POST">
        <input name="login" type="text" placeholder="Логин"/>
        <input name="password" type="text" placeholder="Пароль"/>
        <input type="submit" value="Войти"/>
    </form>
</fieldset>
    <form action="GoToRegister" method="POST">
        <input type="submit" value="Регистрация"/>
    </form>
</body>
</html>
