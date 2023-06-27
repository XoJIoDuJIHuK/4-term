<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Core</title>
</head>
<body>
<c:set var="str" value="Hello" scope="page"/>
<p><c:out value="${str}"/></p>
<c:if test="${str eq 'Hello'}">
    <p><c:out value="world!"/></p>
</c:if>
<c:remove var="str"/>
<c:if test="${str eq null}">
    <p><c:out value="str is null"/></p>
</c:if>

<c:forEach var="i" begin="0" end="3">
    <c:choose>
        <c:when test="${i == 0}">
            <p><c:out value="i == 0"/></p>
        </c:when>
        <c:when test="${i == 1}">
            <p><c:out value="i == 1"/></p>
        </c:when>
        <c:otherwise>
            <p><c:out value="i > 1"/></p>
        </c:otherwise>
    </c:choose>
</c:forEach>

<c:catch var="ex">
    <c:if test="${1 / 0}">
        <p><c:out value="1 / 0"/></p>
    </c:if>
</c:catch>
<c:if test="${not empty ex}">
    <p><c:out value="Exception: ${ex.message}"/></p>
</c:if>

<c:set var="str" value="A, B C; D"/>
<p><c:out value="${str}"/></p>
<c:forTokens var="token" items="${str}" delims=" ,;">
    <p><c:out value="token = ${token}"/></p>
</c:forTokens>
<c:import url="rect.jsp"/>
</body>
</html>
