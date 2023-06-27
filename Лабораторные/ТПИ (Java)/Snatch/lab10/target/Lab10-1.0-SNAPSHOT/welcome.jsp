<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<c:if test="${med == null}">
    <c:redirect url="/MedServlet"/>
</c:if>

<table class="responsive-table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Adress</th>
        <th>Phone</th>
    </tr>
    <c:forEach var="med" items="${meds}">
        <tr>
            <td>${med.id}</td>
            <td>${med.name}</td>
            <td>${med.teacher}</td>
            <td>${med.faculty}</td>
        </tr>
    </c:forEach>
</table>

<div style="display: flex; background-color: white">
    <fieldset>
        <h3 style="color: red">${DeleteErrorMessage}</h3>
        <legend>Delete</legend>
        <form action="DeleteMedServlet" method="POST">
            <input name="id" type="text" placeholder="Med center ID to delete"/> <br/>
            <input type="submit" value="Delete"/>
        </form>
    </fieldset>

    <fieldset>
        <h3 style="color: red">${AddErrorMessage}</h3>
        <legend>Add</legend>
        <form action="AddMedServlet" method="POST">
            <input name="name" type="text" placeholder="Center name"/> <br/>
            <input name="adress" type="text" placeholder="adress"/> <br/>
            <input name="phone" type="text" placeholder="phone"/> <br/>
            <input type="submit" value="Add"/>
        </form>
    </fieldset>

    <fieldset>
        <h3 style="color: red">${UpdateErrorMessage}</h3>
        <legend>Update</legend>
        <form action="UpdateMedServlet" method="POST">
            <input name="id" type="text" placeholder="Med center ID to update"/> <br/>
            <input name="name" type="text" placeholder="New center name"/> <br/>
            <input name="adress" type="text" placeholder="New adress"/> <br/>
            <input name="phone" type="text" placeholder="New phone"/> <br/>
            <input type="submit" value="Update"/>
        </form>
    </fieldset>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
