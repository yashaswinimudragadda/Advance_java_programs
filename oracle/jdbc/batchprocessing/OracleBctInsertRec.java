package oracleConnections;
import java.sql.*;

public class OracleBctInsertRec {

    public static void main(String[] args) {

        String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";

        Connection con = null;

        try {

            con = DriverManager.getConnection(host, username, password);
            con.setAutoCommit(false);

            // -------- Statement Batch --------
            Statement stmt = con.createStatement();

            stmt.addBatch("insert into EMP values (190,'abhi',50000,'a')");
            stmt.addBatch("insert into EMP values (191,'bobby',50000,'c')");
            
            int[] done = stmt.executeBatch();

        	if(done[0] > 0){
        	    System.out.println("Statement batch update successful. Rows updated: " + done[0]);
        	}else{
        	    System.out.println("No rows updated in Statement batch.");
        	}

            stmt.executeBatch();

            // -------- PreparedStatement Batch --------
            String sql = "insert into EMP values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, 401);
            pstmt.setString(2, "abhi");
            pstmt.setInt(3, 50000);
            pstmt.setString(4, "a");
            pstmt.addBatch();

            pstmt.setInt(1, 402);
            pstmt.setString(2, "bobby");
            pstmt.setInt(3, 50000);
            pstmt.setString(4, "c");
            pstmt.addBatch();

            pstmt.executeBatch();

            con.commit();

            System.out.println("Records entered successfully");

            stmt.close();
            pstmt.close();
            con.close();

        } catch (SQLException se) {

            try {
                if (con != null)
                    con.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            se.printStackTrace();
        }
    }
}