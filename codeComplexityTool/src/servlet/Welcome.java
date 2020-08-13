package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import supportiveClasses.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import resources.DataModel;
import resources.Unzip_File_Folder;



@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   	// 100 MB
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "Uploads";

    public Welcome() {
        super();}
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		
		// gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        
        
        //Create if not available... If available, delete all files inside of it
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        else
        {
        	File[] listOfFiles = fileSaveDir.listFiles();
        	for(File file : listOfFiles)
        	{
        		if(!file.isDirectory())
        		{
        			file.delete();
        		}
        		else
        		{
        			deleteFolder(file);
        		}
        		
        	}
        }
        
        String fileName = null;
        String loc = uploadFilePath + File.separator;
        String output = "";
        
        for(Part part : request.getParts()) 
        {
        	fileName = null;
        	fileName = part.getSubmittedFileName();
        	

        	if(naiveSearch.search(fileName, ".zip"))
        	{
        		loc = loc + fileName;
        		part.write(loc);
        		ArrayList<String> list = Unzip_File_Folder.unzip(loc, uploadFilePath);
        		
        		System.out.println("came here");
        		
        		if(!list.isEmpty())
        		{
            		System.out.println("came here 2");
        			for(int i = 0 ; i < list.size()-1;i++)
        			{
        				output = "|[{\"Status\": \"Success\",\"filename\": \""+list.get(0)+"\"},";
        			}
        			
    				output = output + "{\"Status\": \"Success\",\"filename\": \""+list.get(list.size()-1)+"\"}]";
        		}
        	}
        	else
        	{
        		DataModel.map.clear();
                loc = loc + fileName;
                part.write(loc);
                DataModel.map.putIfAbsent(fileName, loc);
                output = "|{\"Status\" : \"Success\" ,\"filename\": \""+fileName+"\" }";
        	}

        	


            
        }
       

       System.out.println(output);
       response.getWriter().write(output);
       
	}
	
	private static void deleteFolder(File file){
	      for (File subFile : file.listFiles()) {
	         if(subFile.isDirectory()) {
	            deleteFolder(subFile);
	         } else {
	            subFile.delete();
	         }
	      }
	      file.delete();
	   }

}
