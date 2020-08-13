<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html style="background-color: #000000;">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/styles.min.css">
     <script src="assets/Resources/Menu.js"></script> 
</head>
<body id="page-top">

    <header class="text-center masthead" style="background: url('assets/img/bg-pattern.png'), linear-gradient(to left, #7b4397, #dc2430);height: auto;"><img class="rounded-circle" src="assets/img/logo.png" width="200" style="margin: 43px;width: 110px;"><img class="d-xl-flex justify-content-xl-start" src="assets/img/hinting-down-the-mythical-high-quality-code.png" style="width: 430px;height: 199px;margin-left: 541px;margin-bottom: 67px;">
        <h1 class="display-4 text-justify d-xl-flex justify-content-center justify-content-xl-center" style="width: 457px;height: 57px;margin: -4px;padding: 0px;margin-left: 467px;padding-left: 742px;margin-top: -292px;padding-bottom: 0px;margin-bottom: 177px;margin-right: 0px;">Code Complexity Measuring Tool</h1>
            <div class="container h-100" style="height: 1166px;">
            	
            	<!-- boostrap modal -->
				<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="toggleModel" id="myModel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle"><b style="color:#000000;">Page Back Click Detected</b></h5>
				      </div>
				      <div class="modal-body">
				        <span style="color:#000000;">The Page Becomes Reloaded in Order to Remove from the Crash Hence You Must Again Upload the File.</span>
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="refreshPage" class="btn btn-primary">OK</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div class="modal fade bd-example-modal-sm"  id="warningModel" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-sm">
				    <div class="modal-content">
						<span style="color:#000000;">Please Upload Java, C++ or Zip File before Choose a Category</span>
				    </div>
				  </div>
				</div>
            
                <div class="row d-xl-flex align-items-xl-start h-100" style="margin: -7px;padding-bottom: 0px;margin-bottom: 0px;height: 0px;">
                <form id="formFileName">
                	<input type="hidden" name="fileName"id="hdnInput">
                </form>
                    <div class="col text-center" style="padding: 90px;margin-bottom: 21px;height: 690px;">
                    	
                    	<a class="btn btn-outline-warning btn-xl js-scroll-trigger" id="btnSubmit1" role="button" style="padding: 17px;margin: 10px;background-color: #0ab1a8;width: 255px;height: 80px;"><br><strong>&nbsp; Size,Variable And Methods</strong><br><br></a>
                        <a class="btn btn-outline-warning btn-xl js-scroll-trigger" id="btnSubmit2" role="button" href="#download" style="margin: 10px;background-color: #0ab1a8;width: 255px;"><br><strong>Inheritance</strong><br><br></a>
                        <a class="btn btn-outline-warning btn-xl js-scroll-trigger" id="btnSubmit3"role="button" href="#download" style="margin: 10px;background-color: #0ab1a8;width: 255px;height: 80px;"><br><strong>&nbsp; &nbsp;Control strutures</strong><br><br><br></a>
                        <a class="btn btn-outline-warning btn-xl js-scroll-trigger" id="btnSubmit4" role="button" href="#download" style="margin: 10px;background-color: #0ab1a8;height: 80px;width: 255px;"><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>Coupling &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong><br></a>
                        <a class="btn btn-outline-warning btn-xl js-scroll-trigger" id="btnSubmit5" role="button" href="#download" style="margin: 10px;background-color: #0ab1a8;width: 255px;height: 80px;"><strong>COMPLEXITY DUE TO ALL THE FACTORS</strong><br></a></div>
                 
                    <div class="col" style="margin: 75px;width: 388px;height: 251px;padding: 126px;padding-top: 148px;padding-bottom: 152px;margin-top: 187px;">
			 <div class="dashed_upload">

		<div>
		
		<select id="drpdown" style="display:none">
		<option value="">Please Select</option>
		</select>
		
		<form method="post" action="" enctype="multipart/form-data">
			<div class="form-group" id="progbarDiv" style="display:none">
				<div class="progress">
  						<div class="progress-bar progress-bar-striped progress-bar-animated" id="processBar" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
				</div>
			</div>
			<div class="form-group">
						<input type="file" Name="upfile" id="file" value="Click Here to Browse">
			</div>
			<div class="form-group">
							<input type="button" value="Upload" id="subBtn">
			</div>
			</form>
		</div>
			
						</div>
						
						  
                    </div>
                    <div class="col-lg-7 my-auto">
                        <div class="mx-auto header-content"></div>
                    </div>
                </div>
            </div>
    </header>
    <footer style="margin-top: 0px;">
        <div class="container">
            <p>©&nbsp;Brand 2018. All Rights Reserved.</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">FAQ</a></li>
            </ul>
        </div>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="assets/js/script.min.js"></script>

</body>
</html>