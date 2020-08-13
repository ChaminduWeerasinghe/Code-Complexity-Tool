package supportiveClasses;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

public class Inheritance {
	
	static String code = "public class Teacher {\r\n" +
            "   String designation = \"Teacher\";\r\n" +
            "   String collegeName = \"Beginnersbook\";\r\n" +
            "   void does(){\r\n" +
            "	System.out.println(\"Teaching\");\r\n" +
            "   }\r\n" +
            "}\r\n" +
            "\r\n" +
            
            "public class Student {\r\n" +
            "   String designation = \"Student\";\r\n" +
            "   String collegeName = \"vck\";\r\n" +
            "   void does(){\r\n" +
            "	System.out.println(\"Student\");\r\n" +
            "   }\r\n" +
            "}\r\n" +
            "\r\n" +
            
            "public class PhysicsTeacher extends Teacher{\r\n" +
            "   String mainSubject = \"Physics\";\r\n" +
            "   public static void main(String args[]){\r\n" +
            "	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
            "	System.out.println(obj.collegeName);\r\n" +
            "	System.out.println(obj.designation);\r\n" +
            "	System.out.println(obj.mainSubject);\r\n" +
            "	obj.does();\r\n" +
            "   }\r\n" +
            
			                
			"class PhysicsTeacher1 extends physicsteacher2Teacher{\r\n" +
			"   String mainSubject = \"Physics\";\r\n" +
			"   public static void main(String args[]){\r\n" +
			"	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
			"	System.out.println(obj.collegeName);\r\n" +
			"	System.out.println(obj.designation);\r\n" +
			"	System.out.println(obj.mainSubject);\r\n" +
			"	obj.does();\r\n" +
			"   }\r\n" +
			
"class physicsteacher2Teacher extends phys {\r\n" +
"   String mainSubject = \"Physics\";\r\n" +
"   public static void main(String args[]){\r\n" +
"	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
"	System.out.println(obj.collegeName);\r\n" +
"	System.out.println(obj.designation);\r\n" +
"	System.out.println(obj.mainSubject);\r\n" +
"	obj.does();\r\n" +
"   }\r\n" +

			
			"class PhysicsTeacher1 extends physicsteacher3Teacher{\r\n" +
			"   String mainSubject = \"Physics\";\r\n" +
			"   public static void main(String args[]){\r\n" +
			"	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
			"	System.out.println(obj.collegeName);\r\n" +
			"	System.out.println(obj.designation);\r\n" +
			"	System.out.println(obj.mainSubject);\r\n" +
			"	obj.does();\r\n" +
			"   }\r\n" +
			
			
"class PhysicsTeacher2 extends physicsteacher4male{\r\n" +
"   String mainSubject = \"Physics\";\r\n" +
"   public static void main(String args[]){\r\n" +
"	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
"	System.out.println(obj.collegeName);\r\n" +
"	System.out.println(obj.designation);\r\n" +
"	System.out.println(obj.mainSubject);\r\n" +
"	obj.does();\r\n" +
"   }\r\n" +

"class Student extends Nimal{\r\n" +
"   String mainSubject = \"Physics\";\r\n" +
"   public static void main(String args[]){\r\n" +
"	PhysicsTeacher obj = new PhysicsTeacher();\r\n" +
"	System.out.println(obj.collegeName);\r\n" +
"	System.out.println(obj.designation);\r\n" +
"	System.out.println(obj.mainSubject);\r\n" +
"	obj.does();\r\n" +
"   }\r\n" +
            "}";
	
	public static int getDirectInheritances(String code) {
		Inheritance inheritance = new Inheritance();
		Map<String, Integer> analyzedData = inheritance.analyzeInheritance(code);
		return analyzedData.get("directInheritancesCount");
	}
	
	public static int getInDirectInheritances(String code) {
		Inheritance inheritance = new Inheritance();
		Map<String, Integer> analyzedData = inheritance.analyzeInheritance(code);
		return analyzedData.get("indirectInheritancesCount");
	}
	
	public static String getCode() {
		return code;
	}

	public static void setCode(String code) {
		Inheritance.code = code;
	}
	
	public static void main(String[] args) {
        System.out.println("Hello World !!!!!");

        Inheritance inheritance = new Inheritance();

        Map<String, Integer> analyzedData = inheritance.analyzeInheritance(code);

        System.out.println("Direct Inheritances: " + analyzedData.get("directInheritancesCount"));
        System.out.println("In-Direct Inheritances: " + analyzedData.get("indirectInheritancesCount"));
        System.out.println("TOTAL INHERITANCE: " + analyzedData.get("totalInheritance"));
    }

    private Map<String, Integer> analyzeInheritance(String code){
        Map<String, Integer> anlyzedData = new HashMap<String, Integer>();

        String[] classDefList = filterClassDefs(code);

        ArrayList<String> concreteClassDefs = getConcreteClassDefs(classDefList);
        ArrayList<String> inheritedClassDefs = getInheritedClassDefs(classDefList);
        Set<String> directInheritances = filterDirectInheritances(inheritedClassDefs, concreteClassDefs);
        Set<String> inDirectInheritances = filterIndirectInheritances(classDefList, directInheritances);

        anlyzedData.put("directInheritancesCount", directInheritances.size());
       if(classDefList !=null )
       {
    	   anlyzedData.put("indirectInheritancesCount",(classDefList.length - concreteClassDefs.size())-directInheritances.size());
    	   anlyzedData.put("totalInheritance",(directInheritances.size() +( classDefList.length - concreteClassDefs.size())-directInheritances.size()));
           
    	   
       }
       else {
    	   
    	   anlyzedData.put("indirectInheritancesCount",0);
    	   anlyzedData.put("totalInheritance",(directInheritances.size() +( 0 - concreteClassDefs.size())-directInheritances.size()));
           
    	   
       }
        
       return anlyzedData;
        
    }

    public static String[] filterClassDefs(String code) {




        /*
         * using java substring() and get only the class def
         * eg: class Animal {
         *
         * */


        String[] classDefinitions = StringUtils.substringsBetween(code, "class", "{");

        return classDefinitions;
    }

    private ArrayList<String> getConcreteClassDefs(String[] classDefinitions){
        /*
         * using java contains() get only the class definitions without extend keyword
         *
         *
         * */
        ArrayList<String> concreteClassDefs = new ArrayList<String>();
        for(int i=0; classDefinitions !=null && i<classDefinitions.length;i++)
        {
            if(!classDefinitions[i].trim().contains("extends"))
            {
                concreteClassDefs.add(classDefinitions[i].trim());
            }
        }

        return concreteClassDefs;
    }

    private ArrayList<String> getInheritedClassDefs(String[] classDefinitions){
        /*
         * using java contains() get only the class def with extend keyword
         *
         *
         * */

        ArrayList<String> inheritedClassDefs = new ArrayList<String>();
        for(int i=0; classDefinitions !=null && i<classDefinitions.length;i++)
        {
            if(classDefinitions[i].trim().contains("extends"))
            {
                inheritedClassDefs.add(classDefinitions[i].trim());
            }
        }

        return inheritedClassDefs;
    }

    private Set<String> filterDirectInheritances(ArrayList<String> inheritedClassDefs, ArrayList<String> concreteClassDefinitions){
        /*
         * Loop concreteClassDefinitions arrayList
         * Filter only the class name5
         * filter only the concreteClassDefinitions which class names are included in classDefinitions
         * */

        Set<String> directInheritances = new HashSet<String>();
        for(int i=0;i<concreteClassDefinitions.size();i++)
        {
            for(int j=0;j<inheritedClassDefs.size();j++)
            {
                if(inheritedClassDefs.get(j).contains(concreteClassDefinitions.get(i)))
                {
                    directInheritances.add(concreteClassDefinitions.get(i));
                }
            }
        }
        return directInheritances;
        
    }

    private Set<String> filterIndirectInheritances(String[] classDefinitions, Set<String> directInheritances){
        /*
         *  indirectInheritance = classDefinitions - directInheritances
         * */

        List<String> directInheritancesList = new ArrayList<String>();
        directInheritancesList.addAll(directInheritances);


        Set<String> indirectInheritance = new HashSet<String>();
        for(int a =0;classDefinitions !=null && a < classDefinitions.length; a ++){
            for (int w =0; w < directInheritancesList.size(); w++){
                if (classDefinitions[a].trim().equals(directInheritancesList.get(w))){
                    continue;
                }
                if (classDefinitions[a].trim().contains(directInheritancesList.get(w))){
                    indirectInheritance.add(classDefinitions[a]);
                }
            }
        }

        return  indirectInheritance;
    }
}
