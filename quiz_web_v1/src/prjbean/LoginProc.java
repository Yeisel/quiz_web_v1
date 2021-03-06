package prjbean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

public class LoginProc extends HttpServlet{
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	HttpSession session = null;
	RequestDispatcher dispatcher = null;
	
	public LoginProc(){
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
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QuizUserDTO dto = new QuizUserDTO();
		
		session = req.getSession();
		
		if(req.getParameter("user_Id") == "" && req.getParameter("user_Pw") == ""){
			System.out.println("여기는 id pw 공백");
			dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}
		else if(req.getSession() == null){
			System.out.println("여기는 세션 널");
			dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}
		else if(req.getParameter("user_Id") != null && req.getParameter("user_Pw") != null){
			System.out.println(req.getParameter("user_Id") + " " + req.getParameter("user_Pw"));
			System.out.println("여기는 id pw 낫널");
			
			String userId = (String)req.getParameter("user_Id");
			String userPw = (String)req.getParameter("user_Pw");
			String guest = "guest";
			
			System.out.println(userId + " " + userPw);
			
			String sql = "select * from user where user_Id='" + userId + "'";
			
			try{
				con = ds.getConnection();
			
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.wasNull()){
					System.out.println("여기는 rs 널");
					dispatcher = req.getRequestDispatcher("login.jsp");
					dispatcher.forward(req, resp);
				}
				else{
					if(rs.next()){
						System.out.println("여기는 rs 넥스트");
						dto.setUser_Id(rs.getString("user_Id"));
						dto.setUser_Password(rs.getString("user_Password"));
						dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
					}
					
					req.setAttribute("dto", dto);
					
					dispatcher = req.getRequestDispatcher("login.jsp");
					
					if(rs.getString("user_Id").equals(userId) && rs.getString("user_Password").equals(userPw)){
						System.out.println("여기는 로긴 성공");
						session.setAttribute("logged", userId);
						dispatcher.forward(req, resp);
					}
					else if(guest.equals(req.getParameter("logout"))){
						System.out.println("여기는 로그아웃");
						session.invalidate();
						dispatcher.forward(req, resp);
					}
				}
			}
			catch(Exception err){
				err.printStackTrace();
			}
			finally{
				if(rs != null){try{rs.close();}catch(Exception err){}}
				if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
				if(con != null){try{con.close();}catch(Exception err){}}
			}
		}
		else{
			System.out.println("여기는 id pw 공백의 else");
			dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}
	}	
}
