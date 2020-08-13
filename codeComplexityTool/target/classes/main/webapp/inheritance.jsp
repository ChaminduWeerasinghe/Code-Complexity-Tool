<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="supportiveClasses.Inheritance" %>
<%@ page import="resources.DataModel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    <title>Inheritance</title>
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
      
	<div class="container" style="display: flex;flex-direction: column;">
	<h1 style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Inheritance</h1>
		<table id="inTable" class="table table-bordered" style="font-family: 'Courier New', Courier, monospace;">
		  <thead>
			<tr>
			  <th scope="col">Line No</th>
			  <th scope="col">Class Name</th>
			  <th scope="col">No of direct inheritance</th>
			  <th scope="col">No of indirect inheritance</th>
			  <th scope="col">Total inheritance</th>
			  <th scope="col">Ci</th>
			</tr>
		  </thead>
		  <tbody id="inTableBody">
		 	<% 		
		 			String code = "";
		 			File file = null;
		 			Scanner scanner = null;
		 			
		 			if(request.getParameter("fileName") != null) {
		 				String location = DataModel.map.get(request.getParameter("fileName"));
		 				file = new File(location);
				      	scanner = new Scanner(file);
		 			}
		 			else {
		 				code = Inheritance.getCode();
		 				scanner = new Scanner(code);	
		 			}
		 	
					try {
						  int count = 0;
					      while (scanner.hasNextLine()) {
					        String line = scanner.nextLine();
					        int a = Inheritance.getDirectInheritances(code);
					        int b = Inheritance.getInDirectInheritances(code);
					        int c = (a + b);
					        int d = (c >= 4) ? 4 : c; 
					        out.print("<tr>");
				        	out.print("<td scope=\"col\">"+(++count)+"</td>");
				        	out.print("<td scope=\"col\">"+line+"</td>");
				        	out.print("<td scope=\"col\">"+a+"</td>");
				        	out.print("<td scope=\"col\">"+b+"</td>");
				        	out.print("<td scope=\"col\">"+c+"</td>");
				        	out.print("<td scope=\"col\">"+d+"</td>");
				        	out.print("</tr>");
					      }
					      scanner.close();
				    } catch (FileNotFoundException e) {
				      System.out.println("An error occurred.");
				      e.printStackTrace();
				    }
			%>
		  </tbody>
		</table>
	</div>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- <script src="./src/js/main.js"></script> -->
  </body>
</html>