<%--
  Created by IntelliJ IDEA.
  User: Jonathan
  Date: 10/16/2020
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Person Page</title>
</head>
<body>
<h1>
    Add a Person
</h1>

<c:url var="addAction" value="/person/add" ></c:url>

<form:form action="${addAction}" commandName="person">
    <table>
        <c:if test="${!empty person.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8"  disabled="true" />
                    <form:hidden path="id" />
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="email"/>
                </form:label>
            </td>
            <td>
                <form:input path="email" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty person.name}">
                    <input type="submit"
                           value="<spring:message text="Edit Person"/>" />
                </c:if>
                <c:if test="${empty person.name}">
                    <input type="submit"
                           value="<spring:message text="Add Person"/>" />
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>Persons List</h3>
<c:if test="${!empty listPersons}">
    <table class="tg">
        <tr>
            <th width="80">Person ID</th>
            <th width="120">Person Name</th>
            <th width="120">Person email</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listPersons}" var="person">
            <tr>
                <td>${person.id}</td>
                <td>${person.name}</td>
                <td>${person.email}</td>
                <td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
                <td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
