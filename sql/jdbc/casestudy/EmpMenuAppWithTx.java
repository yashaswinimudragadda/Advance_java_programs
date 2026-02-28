package advancejavaprograms;
import java.sql.*;

import java.util.*;

public class EmpMenuAppWithTx {
	private static final String url="jdbc:mysql://localhost:3306/demobase";
	private static final String user="root";
	private static final String password ="1234";
	
	public static void main(String [] args) {
		try(Connection con = DriverManager.getConnection(url,user,password);
				Scanner sc=new Scanner(System.in)){
			con.setAutoCommit(false);
			
			
			while(true) {
				System.out.println("\n======employeemenu===========");
				System.out.println("1.Insert Records");
				System.out.println("2.List All Records");
				System.out.println("3.Display Single Record(by eno)");
				System.out.println("4.Update Record (by eno) ");
				System.out.println("5.Delete Record(by eno)");
				System.out.println("6.Exit");
				System.out.println("Enter your choice: ");
				int choice = sc.nextInt();
				
			try {
				switch (choice){
					case 1:
						insertRecord(con,sc);
						break;
					case 2:
						listAllRecords(con);
						break;
					case 3:
						displaySingleRecord(con,sc);
						break;
					case 4:
						updateRecord(con,sc);
						break;
					case 5:
						deleteRecord(con,sc);
						break;
					case 6:
						System.out.println("exiting program...");
						return;
					default:
						System.out.println("Invalid choice! try again, ");
				}
			}catch(SQLException e) {
				System.out.println("Error: "+e.getMessage());
				con.rollback();
			}
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}


private static void insertRecord(Connection con,Scanner sc) throws SQLException
{

System.out.print("Enter eno(or 0 for Null): ");
int eno = sc.nextInt();
sc.nextLine();

System.out.print("enter ename (or leave blank for null): ");
String ename = sc.nextLine().trim();

System.out.print("enter esal (or 0 ro null): ");
double esal = sc.nextDouble();
sc.nextLine();

System.out.print("enter grade (or leave blank for null): ");
String egrade = sc.nextLine().trim();

String sql ="insert into myemp (eno,ename,esal,egrade) values (?,?,?,?)";
try(PreparedStatement pstmt = con.prepareStatement(sql)){
	if(eno == 0)pstmt.setNull(1, Types.INTEGER);
	else pstmt.setInt(1, eno);
	
	if(ename.isEmpty())pstmt.setNull(2,Types.VARCHAR);
	else pstmt.setString(2,ename);
	
	if(esal==0) pstmt.setNull(3, Types.VARCHAR);
	else pstmt.setDouble(3,esal);
	
	if(egrade.isEmpty( )) pstmt.setNull(4, Types.VARCHAR);
	else pstmt.setString(4, egrade);
	
	int rows= pstmt.executeUpdate();
	System.out.println(rows +" record(s) inserted. ");
}
confirmTransaction(con,sc);
}

private static void listAllRecords(Connection con) throws SQLException {
	String sql="select * from myemp";
	try(Statement stmt= con.createStatement();
			ResultSet rs=stmt.executeQuery(sql)){
		System.out.printf("%-6s %-10s %-8s %-6s%n","eno","ename","esal","egrade");
		System.out.println("=====================================================");
		while(rs.next()) {
			String eno = rs.getString("eno");
			String ename = rs.getString("ename");
			String esal=rs.getString("esal");
			String egrade = rs.getString("egrade");
			
			System.out.printf("%-6s %-10s %-8s %-6s%n",
					eno == null? "null": eno,
							ename== null?"null":ename,
									esal==null?"null":esal,
											egrade == null?"null":egrade);
		}
	}
			
}

private static void displaySingleRecord(Connection con,Scanner sc) throws SQLException
{
	System.out.println("enter eno to searach: ");
	int eno = sc.nextInt();
	String sql = "select * from myemp where eno= ? ";
	try(PreparedStatement pstmt = con.prepareStatement(sql)){
		   pstmt.setInt(1, eno);
		   try(ResultSet rs= pstmt.executeQuery()){
			if(rs.next()) {
				System.out.println("eno: "+rs.getString("eno"));
				System.out.println("ename: "+rs.getString("ename"));
				System.out.println("esal: "+rs.getString("esal"));
				System.out.println("egrade: "+rs.getString("egrade"));
			}else {
				System.out.println("record not found. ");
			}
		}
	}
}
private static void updateRecord(Connection con,Scanner sc) throws SQLException
{
	System.out.println("enter eno to update: ");
	int eno= sc.nextInt();
	sc.nextLine();
	
	String checkSql="select * from myemp where eno=?";
	try(PreparedStatement checkStmt = con.prepareStatement(checkSql)){
		checkStmt.setInt(1, eno);
		try(ResultSet rs= checkStmt.executeQuery()){
			if(!rs.next()) {
				System.out.println("record not found.");
				return;
			}
			String currentName=rs.getString("ename");
			Double currentSal=rs.getObject("esal")==null? null:rs.getDouble("eno");
			String currentGrade = rs.getString("egrade");
			
			System.out.print("enter new ename (leae blank to keep '"+currentName+"')");
			String ename=sc.nextLine().trim();
			if(ename.isEmpty()) ename=currentName;
			
			System.out.print("enter new esal (0 to keep"+currentSal+"): ");
			double esal = sc.nextDouble();
			sc.nextLine();
			
			if(esal ==0 && currentSal != null) esal = currentSal;
			
			
			System.out.print("enter new grade(leave blank to keep "+currentGrade+"'):");
			String egrade = sc.nextLine().trim();
			if(egrade.isEmpty()) egrade= currentGrade;
			
			String updateSql ="update myemp set ename=?,egrade=? where eno=? ";
			try(PreparedStatement pstmt = con.prepareStatement(updateSql)){
				if(ename==null)pstmt.setNull(1, Types.VARCHAR);
				else pstmt.setString(1,ename);
				
				if(currentSal == null && esal == 0)pstmt.setNull(2,Types.DOUBLE);
				else pstmt.setDouble(2, esal);
				
				if(egrade== null) pstmt.setNull(3, Types.VARCHAR);
				else pstmt.setString(3, egrade);
				
				pstmt.setInt(4, eno);
				int rows = pstmt.executeUpdate();
				System.out.println(rows+"reocrd(S) updated");
				
				
			}
			
		}
	}
	
}


private static void deleteRecord(Connection con,Scanner sc) throws SQLException
{
System.out.println("enter eno to delete");
int eno=sc.nextInt();
String sql ="delete from myemp where eno= ?";
try(PreparedStatement pstmt = con.prepareStatement(sql)){
	pstmt.setInt(1, eno);
	int rows = pstmt.executeUpdate();
	if(rows > 0) {
		System.out.println("record deleted.");
	}else {
		System.out.println("record not found. ");
	}
	
}
confirmTransaction(con,sc);
}
// helper method for commit /rollback

private static void confirmTransaction(Connection con,Scanner sc) throws SQLException
{
System.out.print("commit changes ?(Y/N): " );
String choice = sc.next();
if(choice.equalsIgnoreCase("Y")) {
	con.commit();
	System.out.println("Transaction committed. ");
	}
else {
	con.rollback();
	System.out.println("transaction rolled back.");
}
}
}