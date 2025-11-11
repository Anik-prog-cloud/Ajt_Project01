<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.*,userpack.UserDao,userpack.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // FIX APPLIED: Changed getAllUsers() to getAllRecords()
    List<User> list = UserDao.getAllRecords();
    request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 30px auto;
        }
        th, td {
            border: 1px solid #666;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
        a {
            text-decoration: none;
            color: blue;
        }
        a:hover {
            text-decoration: underline;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>📋 Student List</h2>
    <center><a href="userform.html">Add New Student</a></center>
    <br>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Fee</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="u" items="${list}">
            <tr>
                <td>${u.id}</td>
                <td>${u.name}</td>
                <td>${u.email}</td>
                <td>${u.course}</td>
                <td>${u.fee}</td>
                <td>${u.country}</td>
                <td>
                    <a href="editform.jsp?id=${u.id}">Edit</a> |
                    <a href="deleteuser.jsp?id=${u.id}" onclick="return confirm('Delete this student?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body> 
</html>