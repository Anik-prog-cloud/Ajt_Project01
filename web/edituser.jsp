<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="userpack.User,userdao.UserDao" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String country = request.getParameter("country");

    User u = new User();
    u.setId(id);
    u.setName(name);
    u.setEmail(email);
    u.setCountry(country);

    int status = UserDao.update(u);
    if (status > 0) {
        response.sendRedirect("viewusers.jsp");
    } else {
        out.println("Error: Unable to update user!");
    }
%>
