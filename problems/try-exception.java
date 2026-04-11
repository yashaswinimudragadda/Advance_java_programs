import java.util.*;
class main{
    public static void main(String args[]){
        Scanner sc= new Scanner(System.in);
        int n= sc.nextInt();
        System.out.println("dividing this number by 0");
        try{
            System.out.println(n/0);
        }catch(Exception e){
            System.out.println(e);
        }
        System.out.println("program completed");
    }
}
