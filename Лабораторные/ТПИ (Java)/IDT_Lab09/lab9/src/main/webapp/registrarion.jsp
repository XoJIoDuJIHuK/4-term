<%--
  Created by IntelliJ IDEA.
  User: rubas
  Date: 31.03.2023
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <form method="post" action="login">
    <input type="hidden" name="action" value="register">
    <label for="newLogin">New login:</label>
    <input type="text" name="login" id="newLogin" required><br>
    <label for="newPassword">New password:</label>
    <input type="password" name="password" id="newPassword" required><br>
    <button type="submit">Register</button>
  </form>
</head>
<body>

</body>
</html>
