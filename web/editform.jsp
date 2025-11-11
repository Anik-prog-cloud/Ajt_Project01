<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="userpack.User,userdao.UserDao" %>
<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);
    User u = UserDao.getUserById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h2>Edit User</h2>
    <form action="edituser.jsp" method="post">
        <input type="hidden" name="id" value="<%= u.getId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= u.getName() %>" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= u.getEmail() %>" required><br><br>

        <label>Country:</label>
        <input type="text" name="country" value="<%= u.getCountry() %>" required><br><br>

        <input type="submit" value="Update User">
    </form>
</body>
</html>
