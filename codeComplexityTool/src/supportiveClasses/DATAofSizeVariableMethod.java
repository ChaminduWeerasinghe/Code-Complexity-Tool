package supportiveClasses;

import java.util.ArrayList;
import java.util.HashMap;

public class DATAofSizeVariableMethod 
{
	//For ALL
    public HashMap<Integer, String> string = new HashMap<Integer,String>();
    
    //For Size
    public HashMap<Integer, Integer> Operators = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> identifiers = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> numericalVal = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> stringLiteral = new HashMap<Integer, Integer>();
    public HashMap<Integer, Integer> keywords = new HashMap<Integer,Integer>();  
    
    //For Variable
    public HashMap<Integer, Integer> compositeGlobalVariable = new HashMap<Integer, Integer>();
    public HashMap<Integer, Integer> compositeLocalVariable = new HashMap<Integer, Integer>();
    public HashMap<Integer, Integer> primitiveGlobalVariable = new HashMap<Integer, Integer>();
    public HashMap<Integer, Integer> primitiveLocalVariable = new HashMap<Integer, Integer>();
    
    //For Method
    public HashMap<Integer, Integer> primitive_Method_Return = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> composite_Method_Return = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> primitive_Parameter = new HashMap<Integer,Integer>();
    public HashMap<Integer, Integer> composite_Parameter = new HashMap<Integer,Integer>();
}
