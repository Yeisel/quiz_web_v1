package prjbean;

import java.io.IOException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
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
	RequestDispatcher dispatcher = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = (String)req.getParameter("user_Id");
		String userPw = (String)req.getParameter("user_Pw");
		String guest = "guest";
		
		session = req.getSession();
		
		QuizUserDTO dto = new QuizUserDTO();
		
		String sql = "select * from user where user_Id='" + userId + "'";
		
		try{
			con = ds.getConnection();
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("����� rs �ؽ�Ʈ");
				
				dto.setUser_Id(rs.getString("user_Id"));
				dto.setUser_Password(rs.getString("user_Password"));
				dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
		
				req.setAttribute("dto", dto);
			}
		
		dispatcher = req.getRequestDispatcher("index.jsp");
		
		if(session.getAttribute("logged") == null){			
			System.out.println("����� ���� �� : " + session.getAttribute("logged"));
			
			if(req.getParameter("user_Id") == "" && req.getParameter("user_Pw") == ""){				
				System.out.println("����� id pw ���� : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));
				dispatcher.forward(req, resp);
			}
			else if(req.getParameter("user_Id") != null && req.getParameter("user_Pw") != null){				
				System.out.println("����� id pw ���� : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));				
				System.out.println("userId , userPw : " + userId + ", " + userPw);				
				
				if(rs.getString("user_Id").equals(userId) && rs.getString("user_Password").equals(userPw)){
					System.out.println("����� �α� ����");
					session.setAttribute("logged", userId);
					dispatcher.forward(req, resp);
				}
				
				else if(guest.equals(req.getParameter("logout"))){
					System.out.println("����� �α׾ƿ�");
					session.invalidate();
					dispatcher.forward(req, resp);
				}
				else{
					System.out.println("����� ��ȸ��");
					session.invalidate();
					dispatcher.forward(req, resp);
				}
			}
			else{
				System.out.println("����� id pw ������ else");
				
				dispatcher.forward(req, resp);		
			}
		}
		else if(session.getAttribute("logged") != null){
			System.out.println(userId + ", " + session.getAttribute("logged"));
			
			if(guest.equals(req.getParameter("logout"))){
				System.out.println("����� ���� ������ guest.equals = " + req.getParameter("logout"));
				session.invalidate();
				dispatcher.forward(req, resp);
			}
			else if(userId.equals(session.getAttribute("logged"))){
				System.out.println("����� userId.equals(logged) = " + session.getAttribute("logged"));
				dispatcher.forward(req, resp);
			}
			else{
				System.out.println("����� ���� ���� = " + session.getAttribute("logged") + ", " + req.getParameter("home"));
				dispatcher.forward(req, resp);
			}
		}
		else{
			
		}
		
		} // try �ݱ�
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(rs != null){try{rs.close();}catch(Exception err){}}
			if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
			if(con != null){try{con.close();}catch(Exception err){}}
		}
	}

	public MainProc(){
		try{
			Context ctx = new InitialContext();
			
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			
			con = ds.getConnection();
		}
		catch(Exception err){
			System.out.println("DB ���� ����" + err);
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
