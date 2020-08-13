<%@page import="java.util.Map"%>
<%@page import="utilpack.Method"%>
<%@page import="java.util.HashMap"%>
<%@page import="utilpack.ProcessFiles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="assets/css/styles.min.css">


<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.button {
	background-color: #660029;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: right;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 2px 2px;
	cursor: pointer;
}
</style>
</head>
  <body id="page-top">
   <form method="post" id="commonForm" hidden>
	<input type="hidden" name="fileName" id="txtHide" value="<% out.print(request.getParameter("fileName"));%>">
   </form>
  
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
	<h2>Coupling</h2>

	<%
		ProcessFiles pf = new ProcessFiles();
		pf.StartCalculate(request.getParameter("fileName"));
	%>

		<%		System.out.println(request.getParameter("fileName")); %>
	<table>
		<tr>

			<th scope="col">Program Mehods</th>
			<th scope="col">Nr</th>
			<th scope="col">Nmcms</th>
			<th scope="col">Nmcmd</th>
			<th scope="col">Nmcrms</th>
			<th scope="col">Nmcrmd</th>
			<th scope="col">Nrmcrms</th>
			<th scope="col">Nrmcrmd</th>
			<th scope="col">Nrmcms</th>
			<th scope="col">Nrmcmd</th>
			<th scope="col">Nmrgvs</th>
			<th scope="col">Nmrgvd</th>
			<th scope="col">Nrmrgvs</th>
			<th scope="col">Nrmrgvd</th>
			<th scope="col">Ccp</th>
		</tr>

		<%
			HashMap<String, Method> methodMapjsp = new HashMap<String, Method>();
		methodMapjsp.putAll(pf.methodMap);
		for (Map.Entry<String, Method> readlines : methodMapjsp.entrySet()) {
			System.out.println("line " + readlines.getKey());
		%>
		<tr>

			<td>
				<%
					out.print(readlines.getKey());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnR());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMcms());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMcmd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMcrms());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMcrmd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmcrms());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmcrmd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmcms());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmcmd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMrgvs());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnMrgvd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmrgvs());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getnRmrgvd());
				%>
			</td>
			<td>
				<%
					out.print(readlines.getValue().getCcp());
				%>
			</td>
		<tr>
			<%
				}
			%>
		
	</table>

	<a href="WeightCoupling.jsp" class="button">Back</a>

</body>
</html>
