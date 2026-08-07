<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    String name = request.getParameter("r1");
    String email = request.getParameter("r2");
    String password = request.getParameter("r3");
    String confirmPassword = request.getParameter("r4");

    if (password != null && confirmPassword != null && password.equals(confirmPassword)) {
    	Class.forName("com.mysql.jdbc.Driver"); 
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdata", "root", "");

        PreparedStatement ps = conn.prepareStatement("INSERT INTO userdatabase (name, email, password) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);

        int i = ps.executeUpdate();
        if (i != 0) {
            out.println("<script> window.alert('Registered!'); window.location.href='login.html';</script>");
        }

        ps.close();
        conn.close();
    } else {
        out.println("<script> window.alert('Passwords do not match!'); window.location.href='register.html';</script>");
    }
%>
</body>
</html>
