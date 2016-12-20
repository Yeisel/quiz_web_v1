/*

package prjbean;

import java.io.IOException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import prjdata.QuizUserDTO;

public class MainProc extends HttpServlet {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	HttpSession session = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		session = req.getSession();
		
		
	}

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
	
	public QuizUserDTO loginProc(String user_Name, String user_Password){
		
		QuizUserDTO dto = new QuizUserDTO();
		
		String sql = "select * from tblsawon where user_Name='?'";
		
		try{
			con = ds.getConnection();
		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_Name);
			rs = pstmt.executeQuery();
						
			if(user_Name.equals(request.getParameter("user_Id")) && user_Password.equals(request.getParameter("user_Pw"))){
				System.out.println("첫번째 if문 진입");
				session.setAttribute("logged", id);
				response.sendRedirect("index.jsp");
			}
			else if(guest.equals(request.getParameter("logout"))){
				System.out.println("2번째 if문 진입");
				session.invalidate();
				response.sendRedirect("index.jsp");
			}
			else{
				System.out.println("3번째 if문 진입");
				session.invalidate();
				response.sendRedirect("index.jsp");
			}
		}
		catch(Exception err){
			System.out.println("loginProc() : " + err);
		}
		finally{
			
		}
	}
	
	public void selectUser(String user_Name){
		
		try {
			con = ds.getConnection();
			
			String sql = "select * from user where user_id = ?";
			pstmt = con.prepareStatement(sql);  
			pstmt.setString(1, user_Name);
			
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
		finally{
			freeConnection();
		}
	}
	
	public void selectProduct(String product_Name){
		try {
			con = ds.getConnection();
			
			String sql = "select * from user where user_id like ? order by desc"; 
			pstmt = con.prepareStatement(sql);  
			pstmt.setString(1, "'%" + product_Name + "%'");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("product_number"));
				System.out.println(rs.getString("product_name"));
				System.out.println(rs.getString("product_price"));
				System.out.println(rs.getString("product_image"));
				System.out.println(rs.getString("product_stock"));
				System.out.println(rs.getString("product_company"));
				System.out.println(rs.getString("product_contents"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
}
*/