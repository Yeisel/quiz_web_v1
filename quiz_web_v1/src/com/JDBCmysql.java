package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCmysql {
	
	Connection conn = null;                                        // null로 초기화 한다.
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection JDBCmysql(){
		
		try{
			String url = "jdbc:mysql://192.168.1.54:3306/quiz_web_v1";        // 사용하려는 데이터베이스명을 포함한 URL 기술
			String id = "firstclass";                                                    // 사용자 계정
			String pw = "1111";                                                // 사용자 계정의 패스워드

			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

			String sql = "select * from user where user_id = ?";                        // sql 쿼리
			pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1,"sjlee");

			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

			while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.
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

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("데이터베이스 호출에 실패했습니다.");

		}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
		}
		
		return conn;
	}
}
