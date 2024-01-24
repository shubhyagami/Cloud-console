<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cloud-Console</title>
<link rel="stylesheet" href="style.css">
<style>
  body {
    position: relative;
    background: url('https://cdn.dribbble.com/users/2480087/screenshots/7009361/media/5be4690e38762fd53647912018e86189.gif') no-repeat center center fixed;
    background-size: cover;
    min-width: 500px;
    min-height: 200px;
    color: #fff;
    font-family: 'Montserrat';
    height:100vmax;
  }</style>
</head>
<body>
<%
    HttpSession ss = request.getSession();
    Object user = ss.getAttribute("user");
    String usr = "";
    String pswd = "";

    if (user != null) {
        response.sendRedirect("dashboard.jsp");
    } else {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    usr = cookie.getValue();
                }
                if (cookie.getName().equals("password")) {
                    pswd = cookie.getValue();
                }
            }
        }
    }
%>
<div class="header">
        <div class="bars" id="nav-action">
            <span class="bar"> </span>
          </div>
          
          <!--Navbar Links-->
          <nav id="nav">
            <ul>
              <li class="shape-circle circle-one"><a href="reg.jsp">Register</a></li>
              <li class="shape-circle circle-two"><a href="sign.jsp">Sign In</a></li>
              <li class="shape-circle circle-three"><a href="About.jsp">About Us</a></li>
              <!-- <li class="shape-circle circle-five">
                <a href="index.html">Home</a> -->
              </li>
            </ul>
          </nav>
          
          <!--Main Body Content-->
          <article class="container">
            <h1>OOPS<br>AN<br> <br> <br>occur</h1>
            
          </article>
          
    </div>
    <script>
        // Setting up the Variables
var bars = document.getElementById("nav-action");
var nav = document.getElementById("nav");

//setting up the listener
bars.addEventListener("click", barClicked, false);


//setting up the clicked Effect
function barClicked() {
  bars.classList.toggle('active');
  nav.classList.toggle('visible');
}
    </script>
</body>
</html>