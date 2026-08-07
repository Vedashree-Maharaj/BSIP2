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
    String url = "jdbc:mysql://localhost:3306/UserDB"; // Database URL
    String user = "root"; // Change this to your MySQL username
    String pass = ""; // Change this to your MySQL password

    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("Database Connection Failed: " + e.getMessage());
    }
%>
</body>
</html>