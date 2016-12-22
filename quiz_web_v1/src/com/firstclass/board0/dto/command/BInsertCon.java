package com.firstclass.board0.dto.command;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstclass.board0.dao.BDao;


public class BInsertCon {

	public int execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String f_board_id = request.getParameter("f_board_id");
		String f_board_title = request.getParameter("f_board_title");
		String f_board_content = request.getParameter("f_board_content");
		BDao dao = new BDao();
		
		
		return dao.insert(f_board_id, f_board_title, f_board_content);
	}
}