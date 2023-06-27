<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22.06.2023
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my-tl" uri="mytl"%>
<%
    Cookie cookie = new Cookie("number", "true");
    cookie.setMaxAge(10);
    response.addCookie(cookie);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="cookie1" items="${cookie.values().toArray()}">
    Map value: ${cookie1.getName()}<br/>
</c:forEach>
<iframe id="myFrame" name="myFrame" style="display:none;"></iframe>
<form action="${pageContext.request.contextPath}/my-servlet" method="post" target="myFrame">
    <label>
        <input type="text" name="string" value="string"/>
    </label>
    <button type="submit">Click me</button>
</form>
<div>
<c:choose>
    <c:when test="${cookie.values().toArray()[0].getValue() == \"true\"}">True: ${cookie.values().toArray()[0].getValue()}</c:when>
    <c:otherwise>False: ${cookie.values().toArray()[0].getValue()}</c:otherwise>
</c:choose>
    <p>do something already</p>
<my-tl:customTagFunction varName="QWERTY"/>
</div>
</body>
</html>
