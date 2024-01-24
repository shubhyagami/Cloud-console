<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
String fname,lname,gmail,pwd;
 gmail=request.getParameter("eAdd");
fname=request.getParameter("fname");
lname=request.getParameter("lname");
pwd=request.getParameter("pwd");


Class.forName("com.mysql.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","root");
String sqlQuery="UPDATE sreg SET FirstName=?,LastName=?,Password=? WHERE Email=?";
PreparedStatement stmt = conn.prepareStatement(sqlQuery);
stmt.setString(4,gmail);
stmt.setString(1,fname);
stmt.setString(2,lname);
stmt.setString(3,pwd);
stmt.executeUpdate();
conn.close();
stmt.close();
%>
<%
	HttpSession ss = request.getSession();
	ss.invalidate();
%>
<script>
alert("Registration successfully ! BOSS");
<%
response.sendRedirect("index.jsp");
%>
</script>