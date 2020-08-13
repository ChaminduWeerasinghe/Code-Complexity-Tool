<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="ISO-8859-1">
<title>User Login</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
	if(request.getParameter("email") != null)
	{
		String un = request.getParameter("email");
		String pw = request.getParameter("password");
		
		if(!un.equals("admin@123.com") || !pw.equals("admin"))
		{
			session.setAttribute("Invalid Credentials", "result");
		}
		else
		{
			  getServletContext().getRequestDispatcher("/Welcome.jsp").forward(request, response);
		}
	}

%>



<link rel="stylesheet" type="text/css" href="css/login.css">
 </head>
<body id="LoginForm">
<div class="container">	
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h2>Admin Login</h2>
   <p>Please enter your email and password</p>
   </div>
    <form id="login" method="post" action="login.jsp">

        <div class="form-group">
            <input type="email" class="form-control" id="inputmail" name="email" placeholder="Email Address">
        </div>

        <div class="form-group">
            <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
        </div>

        <button type="submit" class="btn btn-primary">Login</button>

    </form>
    </div>

</div></div>


</body>
</html>