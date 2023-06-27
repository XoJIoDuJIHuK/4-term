<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 20.06.2023
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userName = (String)session.getAttribute("currentUser");
%>
<%
    Cookie cookie = new Cookie("username", "Pete");
    cookie.setMaxAge(60*60*24);
    response.addCookie(cookie);
%>
<html>
<head>
    <title>Action</title>
</head>
<body>
<img src="hello.jpg" alt="Hello there"/>
</body>
</html>
