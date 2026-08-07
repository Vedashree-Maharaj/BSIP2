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
    String age = request.getParameter("r5");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn;
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","");
    if (!password.equals(confirmPassword)) {
        out.println("<script>alert('Passwords do not match!'); window.location.href='register.html';</script>");
    }
    else {
        try {
            String query = "INSERT INTO users (name, email, password, age, dob, gender) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);  // Use password hashing in real apps
            pstmt.setInt(4, Integer.parseInt(age));
            pstmt.setString(5, dob);
            pstmt.setString(6, gender);
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<script>alert('Registration Successful!'); window.location.href='login.html';</script>");
            } else {
                out.println("<script>alert('Registration Failed!'); window.location.href='register.html';</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='index.html';</script>");
        }
    }
%>
</body>
</html>