<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Formatting</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>

<fmt:setLocale value="en-EN"/>
<fmt:timeZone value="GMT-5:00">
    <p>EN: Today is <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
</fmt:timeZone>

<fmt:setLocale value="ru-RU"/>
<p>RU: Сегодня <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>

<fmt:parseNumber var="num" type="number" integerOnly="true" value="32100.12"/>
<p>Currency fmt: <fmt:formatNumber value="${num}" type="currency"/></p>

<fmt:parseDate value="21.05.2023" var="date" pattern="dd.MM.yyyy"/>
<p>date = ${date}</p>
</body>
</html>
