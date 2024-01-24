<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
        <%@ page import="javax.servlet.http.*" %>

<%
String Email;
Email=request.getParameter("gmail");

Class.forName("com.mysql.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","root");

String sqlQuery="DELETE FROM sreg WHERE Email=?";
PreparedStatement stmt = conn.prepareStatement(sqlQuery);
stmt.setString(1,Email);
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
setTimeout(()=>{
    alert("redirecting......")},2000
)
<%
response.sendRedirect("index.jsp");
%>
</script>