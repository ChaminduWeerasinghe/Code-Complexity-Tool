<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpSession, supportiveClasses.*" %>
     
    
<!DOCTYPE html>
<html style="background-color: #000000;">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="assets/Resources/applyForAll.js" type="text/javascript"></script>
	<script src="assets/Resources/controlPage.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="assets/css/styles.min.css">
    
</head>


<style>
table {
  width:80%;
  
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
table tr:nth-child(even) {
  background-color: #eee;
}
table tr:nth-child(odd) {
 background-color: #fff;
}
table th {
  background-color: black;
  color: white;
}table td{
	color: black;
}
</style>


<body id="page-top">

	<nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav" style="background-color: #000000;">
        <div class="container"><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler float-right" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <div class="collapse navbar-collapse"
                id="navbarResponsive">
                <a style="color:#fdcc52;" class="js-scroll-trigger" id="sizeVM">Size,Variable And Methods</a>
                <a style="color:#fdcc52;" class="js-scroll-trigger" id="inhr">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Inheritance</a>
                <a style="color:#fdcc52;" class="js-scroll-trigger" id="controlS">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Control strutures</a>
                <a style="color:#fdcc52;" class="js-scroll-trigger" id="cpling">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; coupling</a>
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item" role="presentation"></li>
                    </ul>
            </div>
        </div>
   </nav>
    <header class="text-center masthead" style="background: url('assets/img/bg-pattern.png'), linear-gradient(to left, #7b4397, #dc2430);height: 300%;"><img class="rounded-circle" src="assets/img/logo.png" width="200" style="margin: 43px;width: 110px;">
        <br>
        <br>
        <br>
        <br>
        <br>
        
       
	<table style="font-family: 'Fira Code'; text-align: center; margin-left:10%; margin-right:15%;">
 <tr>
    <th>Control Structure Type</th>
    <th>Weight</th>

  </tr>
  <tr>
    <td>A conditional control structure such as an 'if' or 'else-if' condition</td>
    <td><input type="text" id="w1" name="weight1"></td>
  </tr>
    <tr>
    <td>An iterative control structure such as a 'for', 'while', or 'do-while' loop</td>
    <td><input type="text" id="w2" name="weight2"></td>
  </tr>
    <tr>
    <td>The 'switch' statement in a 'switch-case' control structure</td>
     <td><input type="text" id="w3" name="weight3"></td>
  </tr>
    <tr>
    <td>Each 'case' statement in a 'switch-case' control structure</td>
    <td><input type="text" id="w4" name="weight4"></td>
  </tr>
</table>
	<br>
	<br>
	<br>
	<form method="post" id="commonForm" hidden>
	<input type="hidden" name="fileName" id="txtHide" value="<% out.print(request.getParameter("fileName"));%>">

	</form>
			    <a id="save"><button class="btn btn-dark">Save</button></a>
				<a id="show"><button class="btn btn-success">Show Result</button></a> 


</div>

</body>
</html>