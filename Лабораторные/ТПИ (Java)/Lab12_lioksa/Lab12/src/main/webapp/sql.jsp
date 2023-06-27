<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sql</title>
</head>
<body>
<sql:setDataSource var="db"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://XoJIoDuJIHuK\\MSQL_SERVER_V1;databaseName=ExtremeIroningDatabase;encrypt=true;trustServerCertificate=true;"
                   user="testuser" password="1111"/>
<sql:query dataSource="${db}" var="Tanks">
    select battalion_name, soft_attack, hard_attack from Battalions where type = ?
    <sql:param value="tnk"/>
</sql:query>

<table style="border: 1px solid black;">
    <tr>
        <th>battalion_name</th>
        <th>soft_attack</th>
        <th>hard_attack</th>
    </tr>

    <c:forEach var="entity" items="${Tanks.rows}">
        <tr>
            <td><c:out value="${entity.battalion_name}"/></td>
            <td><c:out value="${entity.soft_attack}"/></td>
            <td><c:out value="${entity.hard_attack}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
