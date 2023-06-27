<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Functions</title>
</head>
<body>
<c:set var="str" value="Hello, world!"/>
<p>str = <c:out value="${str}"/></p>
<p>length = ${fn:length(str)}</p>
<p>toUpperCase = ${fn:toUpperCase(str)}</p>
<p>toLowerCase = ${fn:toLowerCase(str)}</p>
<p>substring(2, 4) = ${fn:substring(str, 2, 4)}</p>
<p>replace(world, Universe) = ${fn:replace(str, "world", "Universe")}</p>
<p>split(,)[0] = ${fn:split(str, ",")[0]}</p>
<p>startsWith(Hello) = ${fn:startsWith(str, "Hello")}</p>
<p>endsWith(Hello) = ${fn:endsWith(str, "Hello")}</p>
<p>contains(h) = ${fn:contains(str, "h")}</p>
<p>containsIgnoreCase(h) = ${fn:containsIgnoreCase(str, "h")}</p>
<p>indexOf(lo) = ${fn:indexOf(str, "lo")}</p>
</body>
</html>
