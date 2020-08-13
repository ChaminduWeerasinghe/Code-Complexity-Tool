$(document).ready(function(){

    var saveBtn = $("#subBtn");
    var uploadBtn = $("#file");
    var progbarDiv = $("#progbarDiv");
    
    $.ajaxSetup({
       cache : false 
    });
    
    uploadBtn.on("change",function(){
        if(saveBtn.prop("disabled"))
           {
                saveBtn.prop("disabled",false);
           }
        
        uploadBtn.unbind("change");
        saveBtn.click(function(){
        
        uploadBtn.bind("change",function(){
            if(saveBtn.prop("disabled"))
           {
                saveBtn.prop("disabled",false);
           }
        })   
        
        var fd = new FormData();
        var files = $("#file")[0].files[0];

        
        fd.append("file",files);
        
        $.ajax({
            url: "Welcome",
            enctype:"multipart/form-data",
            type: "POST",
            data: fd,
            contentType: false,
            processData: false,
            beforeSend: function()
            {
                saveBtn.attr("disabled",true);
                uploadBtn.attr("disabled",true);
                progbarDiv.css("display","block");
                
                var percentage = 0;         
                var timer = setInterval(function(){
                percentage = percentage + 20;
                progressBar_Change_func(percentage,timer);
                },2000);

            },
            complete: function(response,status){
                takeValues(response.responseText,status);
            }

        });
    });
    });

    
    function takeValues(response, status)
    {
        if(status == "success")
        {
            console.log(response);
            var res  = '';
            var str = response.split("|");
            res = str[1];
            var obj = jQuery.parseJSON(res);
            
            
            $("#drpdown").css("display","block");

            $("#drpdown").empty();
            
            $(obj).each(function(){
        
                if(this.Status == "Success")
                   {
                        $("#drpdown").append($("<option>").attr("value",this.filename).text(this.filename));
                   }
            });

            //hide buttons and progressbar and choose button enable (for upload again and again)
            progbarDiv.css("display","none");
            saveBtn.attr("disabled",true);
            uploadBtn.attr("disabled",false);
        }    

    }
    
     function progressBar_Change_func(percentage,timer)
    {
        $("#processBar").css("width",percentage + "%");
        if(percentage > 100)
           {
                clearInterval(timer);
           }
    }
    
    
    
    
    
    
    //form submittion section
    var subForm = $("#formFileName");
    
    $("#btnSubmit1").click(function(){
        var dat = $("#drpdown").val();
        console.log(dat);
        if(dat != null)
           {
               if(dat != "")
                  {
                        $("#hdnInput").attr("value",dat);
                        console.log("Selected File : "+dat);

                       //check file extension
                        var dotPositon = dat.indexOf(".");
                        var ext = dat.substring(dat.length,dotPositon +1);
                        console.log("Ext : "+ext);

                       //nevigate by the extension
                       if(ext == "java")
                          {
                                    subForm.attr("action","size,variable,method.jsp");
                                    location.reload();
                                    subForm.submit();
                          }
                       else if(ext == "cpp")
                        {
                                    subForm.attr("action","size,variable,methodCPP.jsp");
                                    location.reload();
                                    subForm.submit();
                        }
 
                  }
               else{
                   displayWarning();
               }
  
           }
            else{
                reloadFunc();
            }
        
        
    });
    

    $("#btnSubmit2").click(function(){
    	
        var dat = $("#drpdown").val();
        console.log(dat);
        if(dat != null)
        {
            if(dat != "")
               {
                $("#hdnInput").attr("value",dat);
                subForm.attr("action","inheritance.jsp");
                location.reload();
                subForm.submit();
               }
            else{
                     displayWarning();
               }
           
        }
         else{
             
                reloadFunc();
            }

    });
    
    $("#btnSubmit3").click(function(){
        var dat = $("#drpdown").val();
        console.log(dat);
        if(dat != null)
        {
             if(dat != ""){
                  $("#hdnInput").attr("value",dat);
                  subForm.attr("action","Control.jsp");
                  subForm.submit();
                 
             } 
            else{
                   displayWarning();
               }
           
        } else{
                reloadFunc();
            }
    });
    
    $("#btnSubmit4").click(function(){ 
    	 var dat = $("#drpdown").val();
        console.log(dat);
	    if(dat != null)
	    {
             if(dat != "")
             {
               $("#hdnInput").attr("value",dat);
                subForm.attr("action","WeightCoupling.jsp");
                subForm.submit();    
             }    
            else{
                     displayWarning();
               }
	       
	    } else{
                reloadFunc();
            }
    });
    
    $("#btnSubmit5").click(function(){
        //subForm.attr("action","size,variable,method.jsp");
        //subForm.submit();
    });
    
    $("#refreshPage").click(function(){
        location.reload();
    });
    
    function reloadFunc(){
        $("#myModel").modal('toggle');

    }
    
    function displayWarning(){
    console.log("Came here");
     $("#warningModel").modal('toggle');

       $('#warningModel').delay(2000).fadeOut(750);

      setTimeout(function(){
        $('#warningModel').modal('hide');
      }, 1500);
        
    }
    
    
});



