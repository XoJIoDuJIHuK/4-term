<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorize</title>
    <link rel="stylesheet" href="styles/form-style.css">
</head>
<body>
<jsp:include page="header.jsp" />
<h3 style="color: red">${ErrorMessage}</h3>
<fieldset>
    <legend>Authorize</legend>
    <form action="LoginServlet" method="POST">
        <input name="login" type="text" placeholder="login"/> <br/>
        <input name="password" type="text" placeholder="password"/> <br/>
        <input type="submit" value="login"/>
    </form>
</fieldset>
<form action="register.jsp">
    <button> To registration </button>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>