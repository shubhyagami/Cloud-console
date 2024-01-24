<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cloud-Console</title>
    <link rel="stylesheet" href="style.css">
    <style>
         body {
            padding-top: 160px;
            padding-left: 10%;
    position: relative;
    background: url('https://cdn.dribbble.com/users/200656/screenshots/3072979/media/bb83de96c0100b0f707041953706607f.gif') no-repeat center center fixed;
    background-size: cover;
    min-width: 500px;
    min-height: 200px;
    color: #fff;
    font-family: 'Montserrat';
    height:100vmax;
  }
  
  .card {
    margin: 17%;
  max-width: 300px;
  min-height: 200px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin-top: 20px;
  max-width: 500px;
  height: 300px;
  color: whitesmoke;
  padding: 35px;
  font-size: 45px;
  border: 1px solid rgba(255, 255, 255, .25);
  border-radius: 20px;
  background-color: rgba(255, 255, 255, 0.153);
  box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.25);

  backdrop-filter: blur(15px);
}

.card-footer {
  font-size: 0.65em;
  color: whitesmoke;
}
    </style>
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
              <!-- <li class="shape-circle circle-three"><a href="#">About Us</a></li> -->
              <li class="shape-circle circle-five">
                <a href="index.jsp">Home</a>
              </li>
            </ul>
          </nav>
          
          <!--Main Body Content-->
          <div class="cart">
          </div>
          
    </div>
    <div class="card">
        <p>A Console where you can Store <strong>Unlimited Files </strong> With Fun.</p>
        <p class="card-footer">Created by Shubh Kumar</p>
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