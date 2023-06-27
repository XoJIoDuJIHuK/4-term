<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="post" action="login-servlet">
    <label content="Login">
        <input type="text" name="login" value="user1"/>
    </label>
    <label content="Password" style="display: block">
        <input type="text" name="password" value="1234"/>
    </label>
    <button type="submit">
        Click me
    </button>
</form>

</body>
</html>