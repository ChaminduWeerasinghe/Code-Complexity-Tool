<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="supportiveClasses.*,resources.DataModel" %>
 <%
 	if(request.getParameter("fileName") != null)
 	{
		String loc = DataModel.map.get(request.getParameter("fileName"));
 		calcSizeVariableMethodCPP calc = new calcSizeVariableMethodCPP();
 		DATAofSizeVariableMethodCPP data =  calc.mainMethod(loc);
 		session.setAttribute("data", data);

 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="assets/Resources/applyForAll.js" type="text/javascript"></script>
<title>Size, Variable, Methods</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/styles.min.css">
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
<header class="text-center masthead" style="background: url('assets/img/bg-pattern.png'), linear-gradient(to left, #7b4397, #dc2430);height:auto;"><img class="rounded-circle" src="assets/img/logo.png" width="200" style="margin: 43px;width: 110px;"><img class="d-xl-flex justify-content-xl-start" src="assets/img/hinting-down-the-mythical-high-quality-code.png" style="width: 430px;height: 199px;margin-left: 541px;margin-bottom: 67px;">
<div class="container">
 <div class="table-wrapper">
<h2><b>Complexity due to SIZE</b></h2>
	<table class="table table-hover table-dark">
	 <thead>
		<tr>
			<th scope="col">
				Line No
			</th>
			<th scope="col">
				Program statements
			</th>
			<th scope="col">
				Nkw
			</th>
			<th scope="col">
				Nid
			</th>
			<th scope="col">
				Nop 
			</th>
			<th scope="col">
				Nnv
			</th>
			<th scope="col">
				Nsl 
			</th>
			<th scope="col">
				Cs 
			</th>
		</tr>
	  </thead>
	  <tbody>
		<%
		DATAofSizeVariableMethodCPP data = (DATAofSizeVariableMethodCPP)session.getAttribute("data");
		for(int  i = 1; i < data.StrLine.size() + 1; i++)
		{
			int keywords = data.keywords.get(i);
			int identifiders = data.identifiers.get(i);
			int operators = data.Operators.get(i);
			int numericalvalue = 0;
			int stringLiterals = 0;
			int total = 0;
			
			
			String skeywords = "";
			String sidentifiders = "";
			String soperators = "";
			String snumericalvalue = "";
			String sstringLiterals = "";
			String stotal = "";
			
			if(keywords != 0)
			{
				skeywords = String.valueOf(keywords);
			}
			if(identifiders != 0)
			{
				sidentifiders = String.valueOf(identifiders);
			}
			if(operators != 0)
			{
				soperators = String.valueOf(operators);
			}
			if(data.numericalVal.get(i) != null)
			{
				numericalvalue = data.numericalVal.get(i);
				snumericalvalue = String.valueOf(numericalvalue);
			}
			
			if(data.stringLiteral.get(i) != null)
			{
				stringLiterals = data.stringLiteral.get(i);
				sstringLiterals = String.valueOf(stringLiterals);
			}
			total = keywords + identifiders + operators + numericalvalue + stringLiterals;
			
			if(total != 0)
			{
				stotal = String.valueOf(total);
			}

			
			
			out.print("<tr>"+
					"<th scope='row'>"+i+"</th>"+
					"<td>"+data.StrLine.get(i)+"</td>"+
					"<td>"+skeywords+"</td>"+
					"<td>"+sidentifiders+"</td>"+
					"<td>"+soperators+"</td>"+
					"<td>"+snumericalvalue+"</td>"+
					"<td>"+sstringLiterals+"</td>"+
					"<td>"+stotal+"</td>"+
			"</tr>");
		}
	
		%>
	  </tbody>
	</table>
	</div>
<div class="table-wrapper">
	<h2><b>Complexity due to Variable</b></h2>
	<table class="table table-hover table-dark">
	 <thead>
		<tr>
			<th scope="col">
				Line No
			</th>
			<th scope="col">
				Program statements
			</th>
			<th scope="col">
				Wvs 
			</th>
			<th scope="col">
				Npdtv 
			</th>
			<th scope="col">
				Ncdtv  
			</th>
			<th scope="col">
				Cv 
			</th>
		
		</tr>
			
		</thead>
	  <tbody>	
		<%
		for(int  i = 1; i < data.StrLine.size() + 1; i++)
		{
			int primitiveGlobal = 0;
			int compositeGlobal = 0;
			int compositeLocal = 0;
			int primitiveLocal = 0;
			int variableScope = 2;
			String displayScope = "";
			String primitive = "";
			String composite = "";
			String stotal = "";
			
			if(data.compositeGlobalVariable.get(i) != null)
			{
				compositeGlobal = data.compositeGlobalVariable.get(i);//count of compositeGlobalVariable
				variableScope = 2;
				displayScope = "2";
			}
			else if(data.compositeLocalVariable.get(i) != null)
			{
				compositeLocal = data.compositeLocalVariable.get(i);//count of compositeGlobalVariable
				variableScope = 1;
				displayScope = "1";
			}
			else if(data.primitiveGlobalVariable.get(i) != null)
			{
				primitiveGlobal = data.primitiveGlobalVariable.get(i);
				variableScope = 2;
				displayScope = "2";
			}
			else if(data.primitiveLocalVariable.get(i) != null)
			{
				primitiveLocal = data.primitiveLocalVariable.get(i);
				variableScope = 1;
				displayScope = "1";
			}
			else
			{
				displayScope = "";
			}
			
			if((primitiveGlobal + primitiveLocal) != 0)
			{
				primitive = String.valueOf(primitiveGlobal + primitiveLocal);
			}
			
			if((compositeGlobal + compositeLocal) != 0)
			{
				composite = String.valueOf(compositeGlobal + compositeLocal);
			}

			int total = (variableScope * (1 * (primitiveGlobal + primitiveLocal)) + (2 * (compositeGlobal + compositeLocal)) );
			
			if(total != 0)
			{
				stotal = String.valueOf(total);
			}

			
			
			out.print("<tr>"
						+"<th scope='row'>"+i+"</th>"
						+"<td>"+data.StrLine.get(i)+"</td>"
						+"<td>"+displayScope+"</td>"
						+"<td>"+primitive+"</td>"
						+"<td>"+composite+"</td>"
						+"<td>"+stotal+"</td>"
					+"</tr>");
			
		}

		%>
			  </tbody>
		</table>
</div>

<div class="table-wrapper">
<h2><b>Complexity due to Methods</b></h2>
	<table class="table table-hover table-dark">
	 <thead>
	<tr>
	<th scope="col">
		Line Number
	</th>
	<th scope="col">
		Program Statement
	</th>
	<th scope="col">
		Wmrt 
	</th>
	<th scope="col">
		Npdtp 
	</th>
	<th scope="col">
		Ncdtp   
	</th>
	<th scope="col">
		Cm  
	</th>
	</tr>

		</thead>
	  <tbody>		
	<%
	
	int returnWeight = 0; //default void
	int primitiveParameter = 0;
	int compositeParameter = 0;
	String displayReturnWeight = "";
	String scompositeParameter = "";
	String sprimitiveParameter = "";
	String sfinalValue = "";
	
	for(int  i = 1; i < data.StrLine.size() + 1; i++)
	{
		//get return type data
		if(data.primitive_Method_Return.get(i) != null)
		{
			returnWeight = 1;
			displayReturnWeight = "1";
		}
		else if(data.composite_Method_Return.get(i) != null)
		{
			returnWeight = 2;
			displayReturnWeight = "2";
		}
		else
		{
			returnWeight = 0;
			displayReturnWeight = "";
		}
		
		//get composite paramter data
		if(data.composite_Parameter.get(i) != null)
		{
			compositeParameter = data.composite_Parameter.get(i);
			scompositeParameter = String.valueOf(compositeParameter);
		}
		else
		{
			compositeParameter = 0;
			scompositeParameter = "";
		}
		
		
		if(data.primitive_Parameter.get(i) != null)
		{
			primitiveParameter = data.primitive_Parameter.get(i);
			sprimitiveParameter = String.valueOf(primitiveParameter);
		}
		else
		{
			primitiveParameter = 0;
			sprimitiveParameter = "";
		}


		
		//do final calculation
		
		int finalValue = returnWeight +	(1 * primitiveParameter) + (2 * compositeParameter);
		if(finalValue != 0)
		{
			sfinalValue =  String.valueOf(finalValue);
		}
		else
		{
			sfinalValue = "";
		}

		
		
		out.print("<tr>"
				  +"<th scope='row'>"+i+"</th>"
				  +"<td>"+data.StrLine.get(i)+"</td>"
				  +"<td>"+displayReturnWeight+"</td>"
				  +"<td>"+sprimitiveParameter+"</td>"
				  +"<td>"+scompositeParameter+"</td>"
				  +"<td>"+sfinalValue+"</td>"

		+"</tr>");
	}
	%>
	 </tbody>
</table>
</div>
</div>

</body>
</html>