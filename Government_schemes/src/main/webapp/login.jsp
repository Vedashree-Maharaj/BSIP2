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
    String email = request.getParameter("l1");
    String password = request.getParameter("l2");
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn;
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","");
    try {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            HttpSession ss = request.getSession();
            session.setAttribute("user", rs.getString("name")); // Store user name
            response.sendRedirect("");
        } else {
            out.println("<script>alert('Invalid Credentials!'); window.location.href='index.html';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='index.html';</script>");
    }
%>
</body>
</html>