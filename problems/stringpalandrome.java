class palandromestring{
    public static void main(String [ ]args){
        String s1="hello";
        String rev="";
        String temp=s1.replaceAll("\\s","").toLowerCase();
        String n=temp;
        int i=0;
        while(n.length()>i){
            rev=n.charAt(i)+rev;
            i++;
        }
        System.out.println(n.equals(rev)?"palandrome":"not parlandrome");
    }
}
