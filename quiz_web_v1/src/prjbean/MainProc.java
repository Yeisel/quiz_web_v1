package prjbean;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MainProc {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MainProc(){
		try{
			Context ctx = new InitialContext();
			
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			
			con = ds.getConnection();
		}
		catch(Exception err){
			System.out.println("DB 연결 실패" + err);
		}
		finally{
			
		}
	}
	
	public void testDB(){
		try {
			con = ds.getConnection();
			
			String sql = "select * from user where user_id = ?"; 
			pstmt = con.prepareStatement(sql);  
			pstmt.setString(1,"sjlee");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("user_id"));
				System.out.println(rs.getString("user_email"));
				System.out.println(rs.getString("user_password"));
				System.out.println(rs.getString("user_name"));
				System.out.println(rs.getString("user_address"));
				System.out.println(rs.getString("user_phone_number"));
				System.out.println(rs.getString("user_total_point"));
				System.out.println(rs.getString("user_current_point"));
				System.out.println(rs.getString("user_month_point"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
