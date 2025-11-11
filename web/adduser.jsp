<%@ page import="userpack.UserDao,userpack.User" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String course = request.getParameter("course");
    double fee = Double.parseDouble(request.getParameter("fee"));
    String country = request.getParameter("country");

    User u = new User();
    u.setName(name);
    u.setEmail(email);
    u.setCourse(course);
    u.setFee(fee);
    u.setCountry(country);

    int status = UserDao.save(u);
    if (status > 0) {
%>
        <h3>? Student added successfully!</h3>
        <jsp:forward page="viewusers.jsp" />
<%
    } else {
%>
        <h3>? Sorry, unable to save record.</h3>
<%
    }
%>
