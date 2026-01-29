package Twod;


public class Twodadditonofarrays {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int a[][] = new int[3][3];
		a[0][0]=10;
		a[0][1]=10;
		a[0][2]=10;
		
		a[1][0]=20;
		a[1][1]=20;
		a[1][2]=20;
		
		a[2][0]=30;
		a[2][1]=30;
		a[2][2]=30;
		
		int b[][] = new int[3][3];
		b[0][0]=10;
		b[0][1]=10;
		b[0][2]=10;
		
		b[1][0]=20;
		b[1][1]=20;
		b[1][2]=20;
		
		b[2][0]=30;
		b[2][1]=30;
		b[2][2]=30;
		System.out.println("array one");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print(a[i][j]+" ");
			}
			System.out.println();
		}
		
		System.out.println();
		System.out.println("array two");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print(b[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println();
		
		System.out.println("addition of the two arrays");
		System.out.println();
		
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print((a[i][j]+b[i][j])+" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("subtraction of the two arrays");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print((a[i][j]-b[i][j])+" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("Multiplication of the two arrays");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print((a[i][j]*b[i][j])+" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("Division of the two arrays");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print((a[i][j]/b[i][j])+" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("reminder operator of the two arrays");
		System.out.println();
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.print((a[i][j]%b[i][j])+" ");
			}
			System.out.println();
		}
		
		
	}

}
