$(document).ready(function(){

    $("#save").click(function(){
        $("#commonForm").attr("action","result.jsp");
        $("#commonForm").submit();
    });
    
    $("#show").click(function(){
        $("#commonForm").attr("action","result.jsp");
        $("#commonForm").submit();
    });
    
    
});