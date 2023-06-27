<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Xml</title>
</head>
<body>
<x:parse var="doc">
    <c:import url="xml.xml"/>
</x:parse>
<table style="border: 1px solid black;">
    <tr>
        <th>Name</th>
        <th>Country</th>
    </tr>
    <x:forEach select="$doc/generals/general" var="general">
        <tr>
            <td>Name: <x:out select="$general/name"/> </td>
            <td>Country: <x:out select="$general/country"/> </td>
        </tr>
    </x:forEach>
</table>
<x:if select="$doc/generals">
    <x:set var="auth" select="$doc/generals/general[1]/name"/>
    <x:out select="$auth/."/>
</x:if>
</body>
</html>
