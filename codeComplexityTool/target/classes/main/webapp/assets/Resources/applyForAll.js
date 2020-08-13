$(document).ready(function(){
    var x = $("#txtHide").val();
    var commonForm = $("#commonForm");

    $("#sizeVM").click(function(){
                //check file extension
                console.log(x);
                var dotPositon = x.indexOf(".");
                var ext = x.substring(x.length,dotPositon +1);
                console.log("Ext : "+ext);
               
               //nevigate by the extension
               if(ext == "java")
                  {
                            commonForm.attr("action","size,variable,method.jsp");
                            commonForm.submit();
                  }
               else if(ext == "cpp")
                {
                            commonForm.attr("action","size,variable,methodCPP.jsp");
                            commonForm.submit();
                }
    });
    
    $("#controlS").click(function(){
        commonForm.attr("action","Control.jsp");
        commonForm.submit();
    });
        
    $("#cpling").click(function(){
        commonForm.attr("action","WeightCoupling.jsp");
        commonForm.submit();
    });
    
    $("#inhr").click(function(){
        commonForm.attr("action","inheritance.jsp");
        commonForm.submit();
    });
});