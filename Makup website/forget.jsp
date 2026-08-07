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
    String U;
    String P;
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn;
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdata","root","");
	Statement s1=conn.createStatement();
	ResultSet rs=s1.executeQuery("select * from userdatabase");
	while(rs.next())
	{
		U=rs.getString("email");
		
		if(U.equals(email))
		{
			PreparedStatement ps=conn.prepareStatement("update users SET password='"+password+"' where email='"+email+"'");
			ps.executeUpdate();
			out.println("<script>window.alert('Successs!!')</script>");	
			
			out.println("<script>window.location.href='login.html'</script>");	
			
		}
		else
		{
			out.println("<script>window.alert('Failed!!')</script>");	
			out.println("<script>window.location.href='forget.html'</script>");	
			
		}
		
	}
	

	
	
%>
</body>
</html>