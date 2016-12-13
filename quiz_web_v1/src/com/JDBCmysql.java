package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCmysql {
	
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection JDBCmysql(){
		
		try{
			String url = "jdbc:mysql://192.168.1.54:3306/quiz_web_v1";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
			String id = "firstclass";                                                    // ����� ����
			String pw = "1111";                                                // ����� ������ �н�����

			Class.forName("com.mysql.jdbc.Driver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
			conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

			String sql = "select * from user where user_id = ?";                        // sql ����
			pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			pstmt.setString(1,"sjlee");

			rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.

			while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
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

		}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
			e.printStackTrace();
			System.out.println("�����ͺ��̽� ȣ�⿡ �����߽��ϴ�.");

		}finally{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
		}
		
		return conn;
	}
}
