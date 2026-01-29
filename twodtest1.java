package Twod;
import java.io.*;

public class twodtest1 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        System.out.print("Enter Number of Rows: ");
        int r = Integer.parseInt(br.readLine());
        System.out.print("Enter Number of Columns: ");
        int c = Integer.parseInt(br.readLine());
        
        int a[][] = new int[r][c];
        
        // Input Matrix with helpful prompts
        for(int i = 0; i < r; i++) {
            for(int j = 0; j < c; j++) {
                System.out.print("Enter value for row " + i + ", col " + j + ": ");
                a[i][j] = Integer.parseInt(br.readLine());
            }
        }
        
        // Output Matrix with Tab spacing
        System.out.println("\nYour Matrix:");
        for(int i = 0; i < r; i++) {
            for(int j = 0; j < c; j++) {
                System.out.print(a[i][j] + "\t");
            }
            System.out.println();
        }
        
        br.close();
    }
}