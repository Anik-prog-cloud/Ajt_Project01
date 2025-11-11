<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- FIX APPLIED: Changed userdao.UserDao to userpack.UserDao --%>
<%@ page import="userpack.UserDao" %>
<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    int status = UserDao.delete(id);
    if (status > 0) {
        response.sendRedirect("viewusers.jsp");
    } else {
        out.println("Error: Unable to delete user!");
    }
%>