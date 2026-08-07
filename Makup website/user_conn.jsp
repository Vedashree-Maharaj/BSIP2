<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Database Connection Test</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/UserDB"; // Database URL
    String user = "root"; // Your MySQL username
    String pass = ""; // Your MySQL password

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        conn = DriverManager.getConnection(url, user, pass);
        out.println("Database Connection Successful!"); 
    } catch (Exception e) {
        out.println("Database Connection Failed: " + e.getMessage()); 
    } finally {
        if (conn != null) conn.close();
    }
%>
</body>
</html>
