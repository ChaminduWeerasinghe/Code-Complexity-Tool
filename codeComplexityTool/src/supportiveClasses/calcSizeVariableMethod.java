package supportiveClasses;
import supportiveClasses.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;



public class calcSizeVariableMethod extends Thread
{
    model m = new model();
    String[] keyWords = m.keywords;
    String[] pDataTy = m.primitiveDataTypes;
    String[] nPDataTy = m.nPrimitiveDataTypes;
    String[] operators = m.operators;
    String[] numericalValue = m.numericalValues;
    String[] controlStruct = m.controlStrucures;

    String[] line = null;
    String[] arrForVariableMethod = new String[pDataTy.length + 1];
    String[] words=null; 
    
    ArrayList<String> nameOfClasses = new ArrayList<String>();
    ArrayList<String> nameOfMethods = new ArrayList<String>();
    ArrayList<String> nameOfVariable = new ArrayList<String>();
    ArrayList<String> nameOfPrimitiveVar = new ArrayList<String>();
    ArrayList<String> nameOfCompositeVar = new ArrayList<String>();
    
    static int tempIdentifiers = 0;
    static int numOfKeyworods = 0;
    HashMap<Integer, Integer> keywords = new HashMap<Integer,Integer>();    
    HashMap<Integer, Integer> primitive_Method_Return = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> composite_Method_Return = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> primitive_Parameter = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> composite_Parameter = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> Operators = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> identifiers = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> numericalVal = new HashMap<Integer,Integer>();
    HashMap<Integer, Integer> compositeGlobalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> compositeLocalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> primitiveGlobalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> primitiveLocalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> stringLiteral = new HashMap<Integer, Integer>();


    static int numOfPrimitiveVariables = 0;
    static int numCompositeeVariables = 0;
	static int cntOfOperators = 0;
    int x;
    int lineNumber1 = 0;
    static int lineNumber2 = 0;
    boolean controlStructureChecker = false; //false mean not inside control structure
    static boolean variableScopeChecker = false; //false mean global stage
    int internalControlStructures = 0; //this for stop distraction coming from control structures to variable scope.
    
   public void run()
   {
	   if(line != null)
	   {
		   methodHandler(line);
	   }
	  
	   
	   line = null;
	  
   }
   
   public DATAofSizeVariableMethod mainMethod(String loc) throws IOException
   {

    File f1 = new File(loc); //Creation of File Descriptor for input file
    System.out.println("Location : "+loc);
    FileReader fr = new FileReader(f1);    //Creation of File Reader object
    FileReader fr2 = new FileReader(f1);    //Creation of File Reader object
    BufferedReader br = new BufferedReader(fr);    //Creation of BufferedReader object
    BufferedReader br2 = new BufferedReader(fr2);    //Creation of BufferedReader object
    String s;
    DATAofSizeVariableMethod data = new DATAofSizeVariableMethod();
    
    for(int l = 0; l < pDataTy.length; l++)
	   {
		   arrForVariableMethod[l] = pDataTy[l];
	   }
	   
	   arrForVariableMethod[pDataTy.length] = "String";
	   

	   
    while((s=br.readLine())!=null)    //Reading Content from the file
    {
    	lineNumber1 += 1;
    	
    	data.string.put(lineNumber1, s);
    	
       words=s.trim().split(" ");   //Split the word using space  words = string array which had 1 line of words   
       
       if(words != null) // check array is null
       {
    	   
    	   for(int i = 0; i < words.length ;i++)
           {

               for(int j = 0; j < keyWords.length; j++)
               {
            	   handler(words, i, j);
            	   
               }

           } 
    	   
    	 
    	   controlStructureHandler(s);
     	   variableScope(s);

     	  
           for(int i = 0; i < words.length ;i++)
           {   
               if(words[i].trim().equals("new")) // check there is word called new
               {
            	  checkWithNew(words, i, s);
               }
           }
           
           checkOperators(words);
           checkSizeOfString(words);
           
       }
       
       Operators.put(lineNumber1,cntOfOperators);
       identifiers.put(lineNumber1,tempIdentifiers);
       keywords.put(lineNumber1, numOfKeyworods);
	   numOfKeyworods = 0;
       tempIdentifiers = 0; //set 0 for next row
       cntOfOperators = 0;
      
    }

    while((s=br2.readLine())!=null)    //Reading Content from the file
    {
    	lineNumber2 += 1;
    	words = s.split(" ");
    	

    	
 	   	variableScope(s);
    	controlStructureHandler(s);
    	checkVariable(words, s);
    	checkArguments(s);
    	checkNumericalValue(words);
    }

 
    fr.close();    //Print the word count
    fr2.close();
    
    lineNumber1 = 0;
    lineNumber2 = 0;

    
    System.out.println("Composite Return Type :"+ composite_Method_Return);
    System.out.println("Primitive Return Type :"+ primitive_Method_Return);
    System.out.println("Composite Parameter:"+ composite_Parameter);
    System.out.println("Primitive Parameter :"+ primitive_Parameter);

    data.compositeGlobalVariable = this.compositeGlobalVariable;
    data.compositeLocalVariable = this.compositeLocalVariable;
    data.primitiveGlobalVariable = this.primitiveGlobalVariable;
    data.primitiveLocalVariable= this.primitiveLocalVariable;
    data.keywords = this.keywords;
    data.identifiers = this.identifiers;
    data.Operators = this.Operators;
    data.numericalVal = this.numericalVal;
    data.stringLiteral = this.stringLiteral;
    data.composite_Method_Return = this.composite_Method_Return;
    data.composite_Parameter = this.composite_Parameter;
    data.primitive_Method_Return = this.primitive_Method_Return;
    data.primitive_Parameter =  this.primitive_Parameter;

    return data;
    
   }
   
   private void controlStructureHandler(String s)
   {
	   for(int j =0; j < controlStruct.length; j++)
	   {

		   if(naiveSearch.search(s, controlStruct[j]))
		   {		   
			   controlStructureChecker = true;
    		   
			   if(variableScopeChecker == true) //if compiler is already inside method a method
			   {

				   internalControlStructures = internalControlStructures + 1;


			   }
			   
		   }
		   else if(naiveSearch.search(s, "}"))
		   {
			   controlStructureChecker = false;
			   
			   if(variableScopeChecker == true) //if compiler is already inside method a method
			   {
				   
				   if(internalControlStructures > 0)
				   {
					   internalControlStructures  = internalControlStructures - 1;
				   }
				   else
				   {
					   internalControlStructures = 0;
				   }
				   
			   }
		   }

	   }
   }
   
   private void variableScope(String s)
   {
	   if(nameOfMethods != null)
	   {
   		for(int i = 0; i < nameOfMethods.size(); i++)
   		{

   			if(naiveSearch.search(s, nameOfMethods.get(i)))
       		{
   				if(!naiveSearch.search(s, ";"))
   				{
   	       			variableScopeChecker = true;
   				}
   				
       		}
   			else if(naiveSearch.search(s, "}"))
   			{
   				if(internalControlStructures == 0)
   				{
   					variableScopeChecker = false;
   				}
   			}
   			
   		}
   		
   	}
   }

   public void checkArguments(String s) 
   {
	   int cntOfArguments = 0;
	   int temp;
	  	for(int j = 0; j < nameOfMethods.size(); j++)
    	{
    		String x = nameOfMethods.get(j) + "(";
    		 if(naiveSearch.search(s, x))
    		 {

    			if(naiveSearch.search(s, ";"))
    			{
    				String ss = naiveSearch.split("(", ")", s);
    				
    				if(!ss.contentEquals(""))
    				{
        				
        				words = ss.split(",");
        				
        				for(int k = 0; k < words.length; k++)
        				{
        					cntOfArguments = cntOfArguments + 1;
        				}
    				}
    			}

           	 }
    	 }
	  	
	  	temp = identifiers.get(lineNumber2);
	  	identifiers.put(lineNumber2,cntOfArguments+temp);
	  	
	  	
   }
   
   //check with new keyword
   public void checkWithNew(String[] words, int i,String s)
   {
   
	   if(naiveSearch.search(words[i+1], "ArrayList")) //check word after the new is arraylist
	   {				  
		   if(controlStructureChecker == true)
		   {
			   tempIdentifiers = tempIdentifiers + 1;

		   }
		   else if(controlStructureChecker == false)
		   {
			   if(variableScopeChecker == true)
			   {
				   compositeLocalVariable.put(lineNumber1,1);
			   }
			   else if(variableScopeChecker == false)
			   {
				   compositeGlobalVariable.put(lineNumber1,1);
			   }
			   
			   
		   }
		   
	   }
	   else if(naiveSearch.search(words[i+1], "Hashmap"))
	   {
		   if(controlStructureChecker == true)
		   {
			   tempIdentifiers = tempIdentifiers + 1;
		   }
		   else if(controlStructureChecker == false)
		   {
			   if(variableScopeChecker == true)
			   {
				   compositeLocalVariable.put(lineNumber1,1);
			   }
			   else if(variableScopeChecker == false)
			   {
				   compositeGlobalVariable.put(lineNumber1,1);
			   }
		   }
	   }
	   else if(nameOfClasses.size() != 0) //check number of classes is 0 or not
	   {
		   for(int k = 0; k < nameOfClasses.size(); k++) //untill nameOfClasses array get over
    	   {
    		   if(naiveSearch.search(words[i+1], nameOfClasses.get(k))) // check array element (class name) equalsnto the word after new keyword
        	   {
    			   if(controlStructureChecker == true)
    			   {
    				   tempIdentifiers = tempIdentifiers + 1;
    			   }
    			   else if(controlStructureChecker == false)
    			   {
    				   if(variableScopeChecker == true)
    				   {
    					   compositeLocalVariable.put(lineNumber1,1);
    				   }
    				   else if(variableScopeChecker == false)
    				   {
    					   compositeGlobalVariable.put(lineNumber1,1);
    				   }
    			   }
        	   }
    	   }
	   }
   }
   
   public void handler(String[] words,int i, int j)
   {
       if(words[i].trim().equals(keyWords[j])) //take 1 word from 'words' array and check with all keywords (j mean keyword array representer)
       {
            if(j == 0) //1st keyword in "keyword" array is class
            {	
                nameOfClasses.add(words[i+1].replace("()", ""));   //take name of class for future use
                numOfKeyworods = numOfKeyworods + 1;//take number of classes for calculation
                tempIdentifiers = tempIdentifiers + 1;
            }
            else if(j == 1 || j == 2 || j == 3) //check that taken keyword is private public  or protected
            {
            	numOfKeyworods = numOfKeyworods + 1;
                if(!words[1+1].equals("class")) // if there someone written as "public class " this will work
                {
                    Boolean isMethod = false; //default we think this is not a method
                    
                    for(int k = 0; k < words.length; k++) // iterete untill the line ends (untill "words" array gets end)
                    {
                        if(naiveSearch.search(words[k], ";")) 
                        {                                /*public private protected can used in only variable creation or method creation.
                                                        *In variable creation that line will ends with ; but not in method so we can identify method like that */
                        	isMethod = false;         
                        }
                        else
                        {
                        	isMethod = true;
                        	variableScopeChecker = true;
                        }
                    }
                    
                    
                    
                    if(isMethod == true)
                    {
                    	tempIdentifiers = tempIdentifiers +1;
                    	calcSizeVariableMethod ts1 = new calcSizeVariableMethod();
                    	ts1.lineNumber1 = this.lineNumber1;
                    	ts1.line = this.words;
                    	ts1.primitive_Method_Return = this.primitive_Method_Return;
                    	ts1.primitive_Parameter = this.primitive_Parameter;
                    	ts1.composite_Method_Return = this.composite_Method_Return;
                    	ts1.composite_Parameter = this.composite_Parameter;
                    	ts1.nameOfMethods = this.nameOfMethods;
                    	ts1.start();
                    }
                 }

            }else if(j >= 4 && j <= 11)
            {
            	numOfKeyworods = numOfKeyworods +1;
            }

       }
   }

   public void checkOperators(String words[])
   {
	   int cnt = 0;
	   for(int i = 0; i < words.length; i++)
	   {
		   
		   for(int j = 0; j < operators.length; j++)
	       {
			   cnt = naiveSearch.count(words[i], operators[j]) +cnt;
			   
	       }
		  
		 
	   }

	   cntOfOperators = cntOfOperators + cnt;
   }

   public void checkVariable(String words[], String s)
   {

	   OUTER:
	   for(int i = 0; i < words.length; i++)
	   {

		   for(int j = 0; j < arrForVariableMethod.length; j++)
		   {
			   if(words[i].trim().equals(arrForVariableMethod[j]))
			   {
				   for(int k = i; k < words.length; k++) //go forward and check is there a ; in that line
				   {
					  if(naiveSearch.search(words[k], ";"))
					  {

						 int cnt = naiveSearch.count(s, ",");

						  if(controlStructureChecker == false)
						  {

							  if(variableScopeChecker == true)
							  {
								  primitiveLocalVariable.put(lineNumber2,cnt+1);
							  }
							  else if(variableScopeChecker == false)
							  {
								  primitiveGlobalVariable.put(lineNumber2,cnt+1);
							  }
						  }
						  else if(controlStructureChecker == true)
						  {
							identifiers.put(lineNumber2,cnt+1);
						  }
						  
						  break OUTER;
					  }

				   }
   
			   }

		   }
	   
	   
	   	
	   

	   }

	   
   }

   public void methodHandler(String[] arr)
   {

	   
       if(arr[1].equals("static"))
       {
       		x = 0;
       		checkMethod(arr);
       		
       }
       else
       {
       	x = 1;
       	try {
       		checkMethod(arr);
       	}
       	catch(Exception e)
       	{
       		
       	}
       	
       }
   }
   
   public void checkMethod(String arr[]) throws NullPointerException
	{
       int cntPrimitivePaara = 0;
       int cntCompositePara = 0;
	
	         if(!arr[2 - x].equals("void"))
	          {   
	              Boolean isFoundPrimitive = false;
	              for(int i = 0; i < pDataTy.length; i++)
	              {
	                  if(arr[2 - x].equals(pDataTy[i]))
	                  {

	                      primitive_Method_Return.put(lineNumber1,1);

	                      isFoundPrimitive = true;
	                      break;
	                  }
	              }
	              if(isFoundPrimitive == false)
	              {
	            	 composite_Method_Return.put(lineNumber1,1);
	              }
	          }
	         
	          String[] temp;
	          Boolean isParameter = true;
	          int positionHolder = 4 - x; //this use to keep tacking array position correcly. if we found " main(String[] " word (because word split by spaces);
	                                  // public = array positon 0
	                                  // static = array position 1
	                                  // void = array position 2
	                                  // main(String[] = array position 3     if 3 such cases 4 is a parameter not a data type again 5 is the data type. so we need to track data type is 4 or 5
	          						 // x used for not static methods

	          if(naiveSearch.search(arr[3 - x], "(")) //check array position 3 has ( charactor
	          {
	        	  
	              temp = arr[3 - x].split("\\(");

	              nameOfMethods.add(temp[0]);
	             
	              if(!naiveSearch.search(temp[1], ")") | !temp[1].equals(" ")) //check is there  parameter
	              {
	              	 positionHolder = 5 - x; //see positionHolder declaration
	              	 
	               // find 2nd splitted string is a primitive or not
	                  Boolean isPrimitivePara = false; //this variable is used to alert there is primitive data type or not; default we think this is used composite. but if below if condition is true mean this become true;

	                  for(int i = 0; i < pDataTy.length; i++)
	                  {
	                      if(temp[1].trim().equals(pDataTy[i])) //check is it primitive data type
	                      {

	                          cntPrimitivePaara = cntCompositePara + 1;
	                          isPrimitivePara = true;
	                          break;
	                      }
	                  }
	                  if(isPrimitivePara == false) //sometimes "main(<space>String[]" space between main() and String[] will take as temp[1] by split() method. so avoid that we check temp[1] equal or not for "<Space>" 
	                  {

	                      cntCompositePara = cntCompositePara + 1;
	                  }                              
	              }
	          }

	          //abouve line 80-110 to resolve " main(String[] ".. this helps to find there are another parameter datatypes like String[]
	          if(isParameter == true) //if there is not parameters this one isnt execute.
	          {
	        	 
	              for(int i = positionHolder; i < arr.length; i = i +2)
	              {

	              	if(!arr[i].equals(")")) //get rid to take bracket into calculations main(String args,<Space>) so bracket take as 1 object and start calculate
	              	{
	              		
		                    String s = "";
		                    s = arr[i].trim();
		                    if(arr[i].trim().equals(",")) //if next element found semicolon only then it iterator increase by 1 and again start to work
		                    {
		                        i++;
		                        s = arr[i];
		                    }
		                    s = s.replace(",", ""); //if this happen (int hh ,int kk) 2nd int not found because it's with colon. so get rid of it we reomove colon it found 
		                    
		                    Boolean nonPrimitive = true;
		                    for(int j = 0; j < pDataTy.length; j++)
		                    {

		                        if(s.equals(pDataTy[j]))
		                        {
		                        	
		                            cntPrimitivePaara = cntPrimitivePaara + 1;
		                            nonPrimitive = false;
		                        }
		                    }
		                    if(nonPrimitive == true)
		                    {
		                    	cntCompositePara = cntCompositePara + 1;
		                    }
	              	}

	              }
	          }

	          primitive_Parameter.put(lineNumber1,cntPrimitivePaara);
	          composite_Parameter.put(lineNumber1,cntCompositePara);
	  }

   public void checkSizeOfString(String[] words)
   {
	   Boolean status = false; //false mean no string literal found... true mean string literal found
	   int stringCountInRow = 0; //sometimes more string literals can in 1 row.... Ex: sout("Hello "+" World");
	   
	 for(int i = 0; i < words.length; i++)
	 {
		 if(naiveSearch.search(words[i], "\""))
		 {
			 if(status == false)
			 {
				 stringCountInRow = stringCountInRow +1;
				 stringLiteral.put(lineNumber1,stringCountInRow);
				 status = true;
			 }
			 else if(status == true)
			 {
				 status = false;
			 }
		 }
	 }
	 
   }
   
   public void checkNumericalValue(String[] words)
   {
	   for(int i = 0; i < words.length; i++)
	   {
		   for(int j = 0; j < numericalValue.length; j++)
		   {
			   int index = naiveSearch.searchIndex(words[i], numericalValue[j]);
			   if(index != -99)
			   {
				   int leftIndex = index - 1;			   

				   if(leftIndex > -1)
				   {
					   for(int k = 0; k < operators.length; k++)
					   {
						   String kk = String.valueOf(words[i].charAt(leftIndex));
						   
						   if(kk.equals(operators[k]))
						   {
							   numericalVal.put(lineNumber2,1);
						   }
					   }
					   
				   }
				   else
				   {
					   numericalVal.put(lineNumber2,1);
				   }
				   
			   }
		   }
	   }
   }
   
}