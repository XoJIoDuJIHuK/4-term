<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>Title</title>
</head>
<>
<jsp:include page="header.jsp"/>

<c:if test="${meds == null}">
    <c:redirect url="/MedServlet"/>
</c:if>

<c:set var="userr" value="guest" scope="page"/>
<c:if test="${not empty userr and userr eq 'guest'}">
    Somebody once told me the world is gonna roll me
    I ain't the sharpest tool in the shed
    She was looking kind of dumb with her finger and her thumb
    In the shape of an "L" on her forehead
</c:if>

<br>
<ul>
    <li><c:out value="${userr}" /></li>
</ul>
<c:remove var="userr"/>
<br>
<c:if test="${ empty userr }">
    Хаха, уже пусто
</c:if>
<br>
<c:set var="currentDate" value="<%=new java.util.Date()%>"/>
<table>
    <c:forEach var="timeZone"
               items="<%=java.util.TimeZone.getAvailableIDs()%>">
        <tr>
            <td>
                <c:out value="${timeZone}" />
            </td>
            <td>
                <fmt:timeZone value="${timeZone}">
                    <fmt:formatDate
                            value="${currentDate}" type="both" />
                </fmt:timeZone>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<c:set var="num" value="324123.23234"/>
Number after setting type attribute: <br/>
<fmt:formatNumber value="${num}" type="currency"/> <br/>
Number after setting maxIntegerDigits and maxFractionDigits attribute:
<br/>
<fmt:formatNumber type="number" maxIntegerDigits="4"
                  maxFractionDigits="3" value="${num}" /> <br/>
Number after setting pattern attribute: <br/>
<fmt:formatNumber type="number" pattern="##,###.##" value="${num}" />
<table class="responsive-table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Adress</th>
        <th>Phone</th>
        <th>For choose</th>
    </tr>
    <c:forEach var="med" items="${meds}">
        <tr>
            <td>${med.getId()}</td>
            <td>${med.getName()}</td>
            <td>${med.getAdress()}</td>
            <td>${med.getPhone()}</td>
            <td> <c:choose>
                <c:when test="${med.getId()== 1}">
                    <p>Equals to 1</p>
                </c:when>
                <c:when test="${med.getId() == 2}">
                    <p>Equals to 2</p>
                </c:when>
                <c:otherwise>
                    <p>Undefined</p>
                </c:otherwise>
            </c:choose></td>
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
