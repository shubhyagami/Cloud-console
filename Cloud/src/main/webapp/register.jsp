<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
int reg;
String fname,lname,gmail,pwd;
fname=request.getParameter("fname");
lname=request.getParameter("lname");
gmail=request.getParameter("eAdd");
pwd=request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","root");

String sqlQuery="INSERT INTO sreg VALUES(?,?,?,?)";
PreparedStatement stmt = conn.prepareStatement(sqlQuery);
stmt.setString(1,fname);
stmt.setString(2,lname);
stmt.setString(3,gmail);
stmt.setString(4,pwd);
stmt.executeUpdate();
conn.close();
stmt.close();
%>
<script>
alert("Registration successfully ! BOSS");
setTimeout(()=>{
    alert("redirecting......")},2000
)
</script>
<%
response.sendRedirect("sign.jsp");
%>