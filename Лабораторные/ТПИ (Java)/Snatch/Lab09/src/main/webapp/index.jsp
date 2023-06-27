<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lab 9</title>
</head>
<body>
<div >
    <form action="TimeServlet" method="GET">
        <input type="submit" value="Получить информацию">
    </form>
</div>
<div >
    <form method="POST" action="GoToLogin">
        <input type="submit" value="login">
    </form>
</div>
<div >
    <form method="POST" action="GoToRegister">
        <input type="submit" value="registration">
    </form>
</div>

<div>
    <form method="GET" action="FirstServlet">
        <input type="submit"  style="" value="GET"/>
    </form>
</div>
</body>
</html>