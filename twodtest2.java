package Twod;

public class twodtest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a[][] = new int[3][]; //
        a[0] = new int[] {10, 20, 30}; //
        a[1] = new int[] {1, 2, 3, 4, 5}; //
        a[2] = new int[] {7, 9}; //

        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                System.out.print(a[i][j] + " "); //
            }
            System.out.println();
        }

	}

}
