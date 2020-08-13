package supportiveClasses;

public class model 
{
	
	
	public model() {
		
	}
	
	public String[] keywords = {"class","public","private","protected","void","true","else","default","return","null","break","this"};
	public String[] primitiveDataTypes = {"Boolean","char","byte","short","int","long","float","double"};
	public String[] nPrimitiveDataTypes = {"String","ArrayList"};
	public String[] operators = {"+","-","*","/","%","++","--","==","!=",">","<",">=","<=","&&","||","!","|","^","~","<<",">>",">>>","<<<",",","->",".","::","+=","-=","*=","/=","=",">>>=","|=","&=","%=","<<=",">>=","^="};
	public String[] numericalValues = {"0","1","2","3","4","5","6","7","8","9"};
	public String[] controlStrucures = {"if","while","do","switch"};
	
	public String[] getKeywords() {
		return keywords;
	}

	public String[] getPrimitiveDataTypes() {
		return primitiveDataTypes;
	}

	public String[] getnPrimitiveDataTypes() {
		return nPrimitiveDataTypes;
	}
	
	
	
	
	
	
}
