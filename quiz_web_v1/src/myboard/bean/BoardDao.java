package myboard.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BoardDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
	
	// 전체글 조회(List.jsp)
	public ArrayList getBoardList(String keyField, String keyWord){
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from f_board order by f_board_number";
		}
		else{
			sql = "select * from tblBoard where " + keyField
				+ " like '%" + keyWord + "%' order by f_board_pos";
		}
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				
				dto.setF_board_number(rs.getInt("f_board_number"));
				dto.setF_board_subject(rs.getString("f_board_subject"));
				dto.setF_board_contents(rs.getString("f_board_contents"));
				dto.setF_board_id(rs.getString("f_board_id"));
				dto.setF_board_count(rs.getString("f_board_count"));
				dto.setF_board_date(rs.getString("f_board_date"));
				dto.setF_board_good(rs.getString("f_board_good"));
				dto.setF_board_bad(rs.getString("f_board_bad"));
				dto.setF_board_pos(rs.getInt("f_board_pos"));
				dto.setF_board_depth(rs.getInt("f_board_depth"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return list;
	}
	
	private void updatePos(Connection con){
		try{
			String sql = "update tblBoard set f_board_pos=f_board_pos+1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updatePos : " + err);
		}
	}

}