<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.http.*" %>
<%
String uname,pwd;
uname=request.getParameter("uname");
pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","root");

String sqlQuery="SELECT * FROM sreg WHERE Email=? and Password=? ;";
PreparedStatement stmt = conn.prepareStatement(sqlQuery);
stmt.setString(1,uname);
stmt.setString(2,pwd);
ResultSet rs = stmt.executeQuery();
if(rs.next()){
	%>
	<%
	HttpSession ss = request.getSession();
	ss.setAttribute("user", uname);
	Cookie userck = new Cookie("username", uname);
	userck.setMaxAge(24 * 60 * 60); 
	response.addCookie(userck);
	Cookie passck = new Cookie("password", pwd);
	passck.setMaxAge(24 * 60 * 60);
	response.addCookie(passck);
	response.sendRedirect("dashboard.jsp?gmail="+uname);
	%>
<%
} else{ %>
<script>
alert("login failed !!!");
window.location.href="http://localhost:8080/Cloud/error.jsp";
</script>
<% }
conn.close();
stmt.close();
%>