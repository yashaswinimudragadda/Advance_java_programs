package problem; // This must match the folder structure

public class Main {
    public static void main(String[] args) {
       Thread t = Thread.currentThread();
       t.setName("My Main Thread");
       t.setPriority(7);
       
       System.out.println(t);
       System.out.println("Name: " + t.getName());
       System.out.println("Priority: " + t.getPriority());
   }
}
