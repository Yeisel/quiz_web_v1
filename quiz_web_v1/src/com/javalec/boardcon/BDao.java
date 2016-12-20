package com.javalec.boardcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class BDao {

	DataSource dataSource;
	
	public BDao() {
		// TODO Auto-generated constructor stub
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

	public ArrayList<BDto> list() {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from f_board";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				int f_board_number = resultSet.getInt("f_board_number");
				String f_board_subject = resultSet.getString("f_board_subject");
				String f_board_contents = resultSet.getString("f_board_contents");
				String f_board_id = resultSet.getString("f_board_id");
				int f_board_count = resultSet.getInt("f_board_count");
				String f_board_firstdate = resultSet.getString("f_board_firstdate");
				String f_board_date = resultSet.getString("f_board_date");
				int f_board_good = resultSet.getInt("f_board_good");
				int f_board_bad = resultSet.getInt("f_board_bad");
				int f_board_pos = resultSet.getInt("f_board_pos");
				int f_board_depth = resultSet.getInt("f_board_depth");
				
				BDto dto = new BDto(f_board_number, f_board_subject, f_board_contents, f_board_id, 
						f_board_count, f_board_firstdate, f_board_date, f_board_good, f_board_bad, f_board_pos, f_board_depth);
				
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	public BDto Read(String idx) {
		// TODO Auto-generated method stub
		System.out.println("read start");
		upCount(idx);
		
		BDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			connection = dataSource.getConnection();
			
			String query = "select * from f_board where f_board_number = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idx));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {

				int f_board_number = resultSet.getInt("f_board_number");
				String f_board_subject = resultSet.getString("f_board_subject");
				String f_board_contents = resultSet.getString("f_board_contents");
				String f_board_id = resultSet.getString("f_board_id");
				int f_board_count = resultSet.getInt("f_board_count");
				String f_board_firstdate = resultSet.getString("f_board_firstdate");
				String f_board_date = resultSet.getString("f_board_date");
				int f_board_good = resultSet.getInt("f_board_good");
				int f_board_bad = resultSet.getInt("f_board_bad");
				int f_board_pos = resultSet.getInt("f_board_pos");
				int f_board_depth = resultSet.getInt("f_board_depth");
				
				dto = new BDto(f_board_number, f_board_subject, f_board_contents, f_board_id, 
						f_board_count, f_board_firstdate, f_board_date, f_board_good, f_board_bad, f_board_pos, f_board_depth);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	private void upCount(String idx) {
		System.out.println("upcount start");
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update f_board set f_board_count = f_board_count + 1 where f_board_number = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, idx);
			
			int rn = preparedStatement.executeUpdate();
			System.out.println(rn);
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
}
