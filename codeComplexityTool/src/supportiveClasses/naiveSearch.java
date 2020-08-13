package supportiveClasses;



public class naiveSearch
{
    public static Boolean search(String txt, String pattern) 
    { 
    	//qwe1qwe1
        int M = pattern.length();
        int N = txt.length(); 
  
        /* A loop to slide pattern one by one */
        for (int i = 0; i <= N - M; i++)
        { 
            int j;
  
            /* For current index i, check for pattern
              match */
            for (j = 0; j < M; j++)
                if (txt.charAt(i + j) != pattern.charAt(j))
                    break; 
  
            if (j == M) // if pattern[0...M-1] = txt[i, i+1, ...i+M-1] 
                return true;
        }
        return false; 
    } 

    public static int searchIndex(String txt, String pattern) 
    { 
        int M = pattern.length();
        int N = txt.length(); 
  
        /* A loop to slide pattern one by one */
        for (int i = 0; i <= N - M; i++)
        { 
            int j;
  
            /* For current index i, check for pattern
              match */
            for (j = 0; j < M; j++)
                if (txt.charAt(i + j) != pattern.charAt(j))
                    break; 
  
            if (j == M) // if pattern[0...M-1] = txt[i, i+1, ...i+M-1] 
                return i ;
        }
        return -99;
    } 
    
    public static String split(String startRegex, String endRegex,String s)
    {
    	int start = naiveSearch.searchIndex(s, startRegex);
    	int end = naiveSearch.searchIndex(s, endRegex);
    	
    	String ss = "";
    	if(start > 0 && end > 1)
    	{
    		ss = s.substring(start+1,end).trim();
    	}
    	
    	return ss;
    }
    
    public static int count(String txt, String pattern)
    {
       	//qwe1
        int M = pattern.length();
        int N = txt.length(); 
        int cnt = 0;
  
        /* A loop to slide pattern one by one */
        for (int i = 0; i <= N - M; i++)
        { 
            int j;
  
            /* For current index i, check for pattern
              match */
            for (j = 0; j < M; j++)
                if (txt.charAt(i + j) != pattern.charAt(j))
                    break; 
  
            if (j == M) // if pattern[0...M-1] = txt[i, i+1, ...i+M-1] 
                cnt += 1;
            	j = 0;
        }

        return cnt;
    }

    
}