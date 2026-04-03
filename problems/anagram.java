import java.util.Arrays;

class hello{
    public static void main(String [ ] args){
        String str1="hello";
        String str2="HELLO";
        boolean status=false;
        
        if(str1.length()== str2.length()){
            String s1=str1.replace("\\s","").toLowerCase();
            String s2=str2.replace("\\s","").toLowerCase();
            
            char [] char1=s1.toCharArray();
            char [] char2=s2.toCharArray();
            
            Arrays.sort(char1);
            Arrays.sort(char2);
            
            status = Arrays.equals(char1,char2);
            
        }else{
            status = false;
        }
        System.out.println(status?"anagram":"not anagrams");
    }
}
