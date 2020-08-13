package supportiveClasses;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import resources.DataModel;

public class calcSizeVariableMethodCPP 
{
	model m = new model();

    String[] arr = new String[m.primitiveDataTypes.length + 1];
   
    String[] arrForVariableMethod = new String[m.primitiveDataTypes.length + 1];
    String[] words=null; 
    
    ArrayList<String> nameOfClasses = new ArrayList<String>();
    ArrayList<String> nameOfMethods = new ArrayList<String>();
    
    static int tempIdentifiers = 0;
    static int numOfKeyworods = 0;
    HashMap<Integer, String> StrLine = new HashMap<Integer,String>(); 
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
    HashMap<Integer, Integer> primitiveLocalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> primitiveGlobalVariable = new HashMap<Integer, Integer>();
    HashMap<Integer, Integer> stringLiteral = new HashMap<Integer, Integer>();



    int lineNumber1 = 0;
    
    //check there is keyword called "class" found
    Boolean controlStruct = false;
    Boolean methods = false;

    public static void main(String[] args)throws Exception {
    	calcSizeVariableMethodCPP c = new calcSizeVariableMethodCPP();

	}
    
	public DATAofSizeVariableMethodCPP mainMethod(String loc) throws IOException
	{
	    File f1 = new File(loc); //Creation of File Descriptor for input file
	    System.out.println("Location : "+loc);
	    FileReader fr = new FileReader(f1);    //Creation of File Reader object
	    BufferedReader br = new BufferedReader(fr);    //Creation of BufferedReader object	    

	    
	    
	    for(int l = 0; l < m.primitiveDataTypes.length; l++)
		   {
			   arrForVariableMethod[l] = m.primitiveDataTypes[l];
			   arr[l] = m.primitiveDataTypes[l];
		   }
	    arrForVariableMethod[m.primitiveDataTypes.length] = "String";
		arr[m.primitiveDataTypes.length] = "void";
		
	    
	    String s;
		while((s=br.readLine())!=null)
		{
			lineNumber1 += 1;
			
			identifiers.put(lineNumber1,0);
			Operators.put(lineNumber1,0);
	    	keywords.put(lineNumber1,0);
	    	//data.string.put(lineNumber1, s);
	    	
	       words=s.trim().split(" ");   
	       checkOperators(words,lineNumber1);
			
			if(handler(s,lineNumber1) == false)
			{
				if(composite_Methods_Variables(s,lineNumber1) == false)
				{
					findArguments(s, lineNumber1);
				}
			}
			checkSizeOfString(words, lineNumber1);
			variableScopeHandler(s);
			checkNumericalValue(words, lineNumber1);

			
			StrLine.put(lineNumber1, s);
	
		}
		DATAofSizeVariableMethodCPP data = new DATAofSizeVariableMethodCPP();
		data.StrLine = this.StrLine;
		data.keywords = this.keywords;
		data.primitive_Method_Return = this.primitive_Method_Return;
		data.composite_Method_Return = this.composite_Method_Return;
		data.primitive_Parameter = this.primitive_Parameter;
		data.composite_Parameter = this.composite_Parameter;
		data.Operators = this.Operators;
		data.identifiers = this.identifiers;
		data.numericalVal = this.numericalVal;
		data.compositeGlobalVariable = this.compositeGlobalVariable;
		data.compositeLocalVariable = this.compositeLocalVariable;
		data.primitiveLocalVariable = this.primitiveLocalVariable;
		data.primitiveGlobalVariable = this.primitiveGlobalVariable;
		data.stringLiteral = this.stringLiteral;
		return data;
	  
	
	}
	
		private void variableScopeHandler(String s)
		{
			if(naiveSearch.search(s, "}"))
			{
				if(controlStruct == true && methods == true)
				{
					controlStruct = false;
				}
				else if(methods == true)
				{
					methods = false;
				}
				else
				{
					controlStruct = false;
				}
			}
			else
			{
				for(String ctrlStruct:m.controlStrucures)
				{
					if(naiveSearch.search(s, ctrlStruct))
					{
						controlStruct = true;
					}
				}
				
				for(int i = 0; i < nameOfMethods.size();i++)
				{
					if(naiveSearch.search(s, nameOfMethods.get(i)) && !naiveSearch.search(s, ";"))
					{
						methods = true;
					}
				}
			
			}

		}
		
		private Boolean handler(String s,int line)
		{

				if(naiveSearch.search(s, "class"))
				{
					String[] ss = s.split(" ");
					String[] ss2 = ss[1].split("[(]");
					
					nameOfClasses.add(ss2[0].replace("{", ""));   //take name of class for future use
	                numOfKeyworods = numOfKeyworods + 1;//take number of classes for calculation
	                keywords.put(line,1);
	                return true;
				}
				else if(naiveSearch.search(s, "public") || naiveSearch.search(s, "private") || naiveSearch.search(s, "protected"))
				{
	                numOfKeyworods = numOfKeyworods + 1;
					return false;
				}
				else if(naiveSearch.search(s, "list"))
				{
	                identifiers.put(line, identifiers.get(line)+1);
	                return true;
				}
				else
				{
					for(String pdata: arrForVariableMethod)
					{
						if((naiveSearch.search(s, "void") || naiveSearch.search(s,pdata)) && naiveSearch.search(s, "(") && naiveSearch.search(s, ")") && naiveSearch.search(s, ";"))//primitive method
						{
							primitive_Methods_Variables(s,line);
							return true;
						}	
						else if(naiveSearch.search(s,pdata) && naiveSearch.search(s, ";")  && !naiveSearch.search(s, "(") && !naiveSearch.search(s, ")"))
						{
							if(naiveSearch.search(s, ","))
							{
								if(methods)
								{
									primitiveLocalVariable.put(line,naiveSearch.count(s, ",")+1);
								}
								else if(controlStruct)
								{
									identifiers.put(line,identifiers.get(line)+naiveSearch.count(s, ",")+1);
								}
								else
								{
									primitiveGlobalVariable.put(line,naiveSearch.count(s, ",")+1);
								}
								

							}
							else
							{
								if(methods)
								{
									primitiveLocalVariable.put(line,1);
								}
								else if(controlStruct)
								{
									identifiers.put(line,identifiers.get(line)+1);
								}
								else
								{
									primitiveGlobalVariable.put(line,1);
								}
							}
							
							return true;
						}
						
					}
					return false;
				}		
				
		}
		   private void checkSizeOfString(String[] words, int line)
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
						 stringLiteral.put(line,stringCountInRow);
						 status = true;
					 }
					 else if(status == true)
					 {
						 status = false;
					 }
				 }
			 }
			 
		   }
		   
		private void findArguments(String s, int line)
		{
			for(int i = 0 ; i < nameOfMethods.size(); i++)
			{
				if(naiveSearch.search(s, nameOfMethods.get(i)) && naiveSearch.search(s, "(") && naiveSearch.search(s, ")") && naiveSearch.search(s, ";"))
				{
					String ss = naiveSearch.split("(",")", s);
					
					if(!ss.equals(" ") || !ss.equals(""))
					{
						int commaCnt = naiveSearch.count(s, ",");
						identifiers.put(line, identifiers.get(line)+(commaCnt+1));
					}
					
					
					
				}
			}
			
			
			
			
		}
		
		//find methods using names of classes and list type (Actually they are return types) + use open bracket [(] and close bracket [)]
		private Boolean composite_Methods_Variables(String s,int line)
		{
			for(int i = 0; i < nameOfClasses.size(); i++)
			{
				if(naiveSearch.search(s, nameOfClasses.get(i)))
				{
					if(naiveSearch.search(s, "(") && naiveSearch.search(s, ")"))
					{
						composite_Method_Return.put(line,1);
						storeMethodName(s);
						findParameters(s,line);
					}
					else
					{
						if(naiveSearch.search(s, ","))
						{
							if(methods)
							{
								compositeLocalVariable.put(line,naiveSearch.count(s, ",")+1);
							}
							else if(controlStruct)
							{
								identifiers.put(line,identifiers.get(line)+naiveSearch.count(s, ",")+1);
							}
							else
							{
								compositeGlobalVariable.put(line,naiveSearch.count(s, ",")+1);
							}
							
						}
						else
						{
								if(methods)
								{
									compositeLocalVariable.put(line,1);
								}
								else if(controlStruct)
								{
									identifiers.put(line,identifiers.get(line)+1);
								}
								else
								{
									compositeGlobalVariable.put(line,1);
								}
						}
					}
					return true;
				}
						
			}
			
			if(naiveSearch.search(s, "list"))
			{
				if(naiveSearch.search(s, "(") && naiveSearch.search(s, ")"))
				{
					composite_Method_Return.put(line,1);
					findParameters(s,line);
					storeMethodName(s);
				}
				else
				{
					if(naiveSearch.search(s, ","))
					{
						if(methods)
						{
							compositeLocalVariable.put(line,naiveSearch.count(s, ",")+1);
						}
						else if(controlStruct)
						{
							identifiers.put(line,identifiers.get(line)+naiveSearch.count(s, ",")+1);
						}
						else
						{
							compositeGlobalVariable.put(line,naiveSearch.count(s, ",")+1);
						}
					}
					else
					{
						if(methods)
						{
							compositeLocalVariable.put(line,1);
						}
						else if(controlStruct)
						{
							identifiers.put(line,identifiers.get(line)+1);
						}
						else
						{
							compositeGlobalVariable.put(line,1);
						}
					}
				}
				return true;
			}
			return false;
		}
		
		   public void checkNumericalValue(String[] words, int line)
		   {
			   for(int i = 0; i < words.length; i++)
			   {
				   for(int j = 0; j < m.numericalValues.length; j++)
				   {
					   int index = naiveSearch.searchIndex(words[i], m.numericalValues[j]);
					   if(index != -99)
					   {
						   
						   int leftIndex = index - 1;			   

						   if(leftIndex > -1) //there are indexes in leftside. this checks we dosent use numbers in normal
						   {
							   for(int k = 0; k < m.operators.length; k++)
							   {
								   String kk = String.valueOf(words[i].charAt(leftIndex));
								   
								   if(kk.equals(m.operators[k]))
								   {
									   numericalVal.put(line,1);
								   }
							   }
							   
						   }
						   else
						   {
							   numericalVal.put(line,1);
						   }
						   
					   }
				   }
			   }
		   }
	
		private void storeMethodName(String s)
		{
			//find method name
			String[] str = s.split(" ");
			for(String methodName:str)
			{
				if(naiveSearch.search(methodName, "("))
				{
					String[] str2 = methodName.split("[(]");
					nameOfMethods.add(str2[0]);
				}
			}
		}
		
		private void primitive_Methods_Variables(String s, int line) 
		{
			
			storeMethodName(s);
			
			String[] ss = s.split("[(]");
			String[] ss2 = s.split(" ");
			String rtnType = "";
			
			//find return type
			for(int i = 0; i < ss2.length; i++)
			{
				for(int j = 0; j < arr.length; j++)
				{
					if(arr[j].equals(ss2[i].trim()))
					{
						rtnType = arr[j];
						primitive_Method_Return.put(line,1);
					}
				}
			}
			
			findParameters(s,line);
		}
		
		private void findParameters(String s,int line)
		{
			//finding prameters
			String paras = naiveSearch.split("(", ")", s);

			if(!paras.equals(""))
			{
				int commas = 0;
				commas = naiveSearch.count(s, ",");

					int cntPrimitiveParameters = 0;
					
					
					for(String pdata2: arrForVariableMethod)//get count of primitive type parameters in para variable
					{
						cntPrimitiveParameters = cntPrimitiveParameters + naiveSearch.count(paras, pdata2);
					}

					if(cntPrimitiveParameters != 0) 
					{
						primitive_Parameter.put(line,cntPrimitiveParameters);
					}
					

					if(cntPrimitiveParameters < (commas + 1))//if this true mean there is composite parameter..    "," is situated between 2 paramters
					{
						composite_Parameter.put(line,(commas+1)-cntPrimitiveParameters);
					}

			}
			
		
	}

		
		public void checkOperators(String words[], int line)
		   {
			   int cnt = 0;
			   for(int i = 0; i < words.length; i++)
			   {
				   
				   for(int j = 0; j < m.operators.length; j++)
			       {
					   cnt = naiveSearch.count(words[i], m.operators[j]) +cnt;
					   
			       }
				  
				 
			   }

			   Operators.put(line, Operators.get(line)+cnt);
		   }
		
		

}
