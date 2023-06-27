<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
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
