package prjbean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			System.out.println("DB ���� ����" + err);
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
		
		dispatcher = req.getRequestDispatcher("login.jsp");
		
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
}
