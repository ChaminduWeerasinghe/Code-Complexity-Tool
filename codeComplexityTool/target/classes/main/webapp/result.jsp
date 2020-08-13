<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="ControlStructure.ControlStructureCalculation"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpSession, supportiveClasses.*, resources.*" %>    
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/Resources/applyForAll.js" type="text/javascript"></script>

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
</head>
<meta charset="ISO-8859-1">
<body id="page-top">

	<form method="post" id="commonForm" hidden>
	<input type="hidden" name="fileName" id="txtHide" value="<% out.print(request.getParameter("fileName"));%>">
   </form>
<%
	String documentName =  DataModel.map.get(request.getParameter("fileName"));
	FileReader document = new FileReader(documentName);
	BufferedReader bufferedreader = new BufferedReader(document);
	
	String rows;
	ArrayList<String> row = new ArrayList<>();
	
	while((rows = bufferedreader.readLine())!= null) {
		row.add(rows);
	}
	
	ControlStructureCalculation complexity = new ControlStructureCalculation(row);
	
	ArrayList<Integer> Count = complexity.cntrolrow();
	ArrayList<Integer> WTC = complexity.wtcrow();
	ArrayList<Integer> NC = complexity.ncrow();
	ArrayList<Integer> Ccspps = complexity.ccsppsrow();
%>

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
        
        <h1>Control Structures Complexity</h1> <h2>Ccs = 21</h2>


 <table style="font-family: 'Fira Code'; text-align: center; margin-left:10%; margin-right:15%;">
                                         <thead>
                                                <tr>
                                                    <th>Line No</th>
                                                    <th>Program Statements</th>
                                                    <th>Wtcs</th>
                                                    <th>NC</th>
                                                    <th>Ccspps</th>
                                                    <th>Ccs</th>
                                                </tr>
                                        </thead>
		
		<%
		for(int i = 0; i < row.size(); i++) {
		
		%>
	
		<tbody>
			<tr>
				<td><%=(i+1) %></td>
			    <td><%=row.get(i) %></td>
			    <td><%=WTC.get(i) %></td>
			    <td><%=NC.get(i) %></td>
			    <td><%=Ccspps.get(i) %></td>
			    <td><%=(Count.get(i)+Ccspps.get(i)) %></td>
			    
			</tr>
		</tbody>
			
	
		<%
		}
		%> 
	</table>
	</header>
</body>
</html>