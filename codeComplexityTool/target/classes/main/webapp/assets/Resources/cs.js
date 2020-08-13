$(document).ready(function(){    
    $("#showresult").click(function(){
    	console.log("Came here");
        $("#bjForm").attr("action","result.jsp");
    	$("#bjForm").submit();
    	
    });
    $("#chngRslt").click(function(){
    	console.log("Came here");
        $("#bjForm").attr("action","controlWeight.jsp");
    	$("#bjForm").submit();
    	
    });
    
    
});